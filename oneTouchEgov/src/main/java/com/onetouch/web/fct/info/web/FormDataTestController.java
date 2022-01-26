package com.onetouch.web.fct.info.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.web.fct.info.dao.AttachFileDTO;

import lombok.extern.java.Log;
import net.coobird.thumbnailator.Thumbnailator;

@Log
@Controller
public class FormDataTestController {

	
	//특정한 파일이 이미지 타입인지를 검사하는 메서드
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		}catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		String str= sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	//섬네일 데이터 전송하기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName)  {
		log.info("fileName:" + fileName);
		File file = new File("c:\\upload\\" + fileName);
		
		log.info("file" + file);
		
		ResponseEntity<byte[]> result = null;
		
		
		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//파일 아작스 ------------------------------------------------------------------------
	
	@PostMapping(value = "uploadAjaxAction", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("update ahax post.......");
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";			
		String uploadFolderPath = getFolder();		
		
		//make folder-------------------------------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: " + uploadPath );
		System.out.println(uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		//make yyyy/MM/dd folder
		for(MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			log.info("---------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			log.info("!!!!!!!!!!!!!!!!!!");
			log.info(uploadFileName);
			attachDTO.setFileName(uploadFileName);
			UUID uuid =  UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				//check image type file
				if(checkImageType(saveFile)) {
					
					attachDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
					
				}
				
				//add to List
				list.add(attachDTO);
				
			} catch (Exception e) {
				//log.error(e.getMessage());
				e.printStackTrace();
			}//end catch
		}//end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	//파일 아작스 ------------------------------------------------------------------------
	//파일 업로드 테스트 -------------------------------------------------------------------
		//파일 아작스 jsp 이동
			@RequestMapping("UploadAjax")
			public String moveAjaxUpload() {
				return "tiles/fct/uploadAjax";
			}
			
			@RequestMapping("UploadFile")
			public String moveUpload() {
				return "tiles/fct/UploadFile";
			}
			
			/* 파일업로드연습 */
			@GetMapping("/uploadForm")
			public void uploadForm() {
				log.info("upload form");
			}
			
			@PostMapping("/uploadFormAction")
			public void uploadFormPost(MultipartFile[] uploadFile, Model model)  {
				
				String uploadFolder = "C://upload";
				for(MultipartFile multipartFile : uploadFile) {
					log.info("--------------------------------");
					log.info("Upload File Name: " + multipartFile.getOriginalFilename());
					log.info("Upload File Size: " +multipartFile.getSize());
					
					File saveFile= new File(uploadFolder, multipartFile.getOriginalFilename());
					try {
						multipartFile.transferTo(saveFile);
					} catch (Exception e) {
						//log.error(e.getMessage());
					}//end catch
				}//end for
			}
		
		//---------------------------------------------------------------------------------
}
