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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.web.adm.bas.dao.BasDtlVO;
import com.onetouch.web.adm.bas.dao.BasMapper;
import com.onetouch.web.fct.info.dao.InfoMapper;
import com.onetouch.web.fct.info.dao.InfoVO;
import com.onetouch.web.fct.info.dao.LineVO;
import com.onetouch.web.fct.info.service.InfoService;

import lombok.extern.java.Log;
import net.coobird.thumbnailator.Thumbnailator;
@RequestMapping("/fct")
@Log
@Controller
public class InfoController {
	@Autowired InfoService infoservice;
	@Autowired InfoMapper infomapper;
	@Autowired BasMapper basservice;
		
	//라인 조회
	@ResponseBody
	@GetMapping("/LineSelect")
	public List<LineVO> lineSelect(){
		System.out.println("라인 조회 컨트롤러 연결완료");
		return infoservice.LineSelect();
	}
	
//수정
  @ResponseBody
  @PostMapping("/Updateinfo")
  public List<InfoVO> InfoUpdate(InfoVO infoVO) {
	  infoservice.InfoUpdate(infoVO);
	  System.out.println("확인하기 업데이트 문제에서 조회 조건");
	  System.out.println(infoVO.getCheckPrcCd());
	  return infoservice.selectFctInfoAll(infoVO);
  }
	
	//공정코드 조회 
	@ResponseBody
	@GetMapping("/selectPrc")
	public List<BasDtlVO> showPrc() {
		BasDtlVO basdtlVO = new BasDtlVO();
		basdtlVO.setBasCd("FCT_DIV");
		List<BasDtlVO> list = basservice.selectBasDtl(basdtlVO);
		System.out.println(list);
		return list;
	}
	
	//목록조회 페이지이동
	@RequestMapping("/fctInfoIns")
	public String moveList( ) {
		
		
		
		return "tiles/fct/infoIns";
	}
	
	//목록조회 페이지이동
	@RequestMapping("/fctInfoSel")
	public String showList( ) {
		
		
		
		return "tiles/fct/infoSel";
	}
	
	  //목록조회 처리
	  @ResponseBody
	  @PostMapping("/list1") //s는 공정코드 키 값으로 들어감 
	  public List<InfoVO> list(@RequestBody InfoVO infoVO) {
		  System.out.println("검색조건 넘어온지 확인하기 ");
		  System.out.println(infoVO.getCheckPrcCd());
		  List<InfoVO> list = new ArrayList<>();
		  list = infoservice.selectFctInfoAll(infoVO);
		  System.out.println(list);
	  return list; 
	  }
	  
	
	  @ResponseBody      
	  @PostMapping("/deleteInfo")
	  public List<InfoVO> delete(@RequestBody List<InfoVO> del,InfoVO infoVO) {
		 
		  infoservice.deleteFctInfo(del);
		  return infoservice.selectFctInfoAll(infoVO);
	  }
	  
	  // 설비 등록 아작스 -------------------------------------------------------------------------------------------//
		/*
		 * @ResponseBody
		 * 
		 * @PostMapping(value = "/infoInsert", produces =
		 * MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE) public ResponseEntity<InfoVO>
		 * InfoInsert(MultipartFile uploadFile, InfoVO infoVO) { System.out.println(
		 * "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 * log.info("update ahax post.......");
		 * 
		 * 
		 * String uploadFolder = "C:\\upload"; String uploadFolderPath = getFolder();
		 * 
		 * if(uploadFile != null && uploadFile.getSize() >0) { //make
		 * folder------------------------------- File uploadPath = new
		 * File(uploadFolder, uploadFolderPath); log.info("upload path: " + uploadPath
		 * ); System.out.println(uploadPath);
		 * 
		 * if(uploadPath.exists() == false) { uploadPath.mkdirs(); }
		 * 
		 * MultipartFile multipartFile = uploadFile;
		 * 
		 * 
		 * log.info("---------------------------"); log.info("Upload File Name: " +
		 * multipartFile.getOriginalFilename()); log.info("Upload File Size: " +
		 * multipartFile.getSize());
		 * 
		 * String uploadFileName = multipartFile.getOriginalFilename();
		 * log.info("!!!!!!!!!!!!!!!!!!"); log.info(uploadFileName);
		 * 
		 * UUID uuid = UUID.randomUUID(); uploadFileName = uuid.toString() + "_" +
		 * uploadFileName;
		 * 
		 * try { File saveFile = new File(uploadPath, uploadFileName);
		 * multipartFile.transferTo(saveFile);
		 * 
		 * infoVO.setFctImg(uploadFileName); infoVO.setUuid(uuid.toString());
		 * infoVO.setUploadPath(uploadFolderPath);
		 * 
		 * //check image type file if(checkImageType(saveFile)) {
		 * 
		 * infoVO.setImage(true); FileOutputStream thumbnail = new FileOutputStream(new
		 * File(uploadPath, "s_" + uploadFileName));
		 * Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100,
		 * 100); thumbnail.close();
		 * 
		 * }
		 * 
		 * 
		 * 
		 * } catch (Exception e) { //log.error(e.getMessage()); e.printStackTrace();
		 * }//end catch }
		 * 
		 * System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		 * ); System.out.println(infoVO.getFctImg()); infoservice.insertFctInfo(infoVO);
		 * return new ResponseEntity<>(infoVO, HttpStatus.OK);
		 * //infoservice.selectFctInfoAll(infoVO); }
		 */
	  
	  //파일 업로드 관련 메소드
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
		
}
