package com.onetouch.web.fct.dwtm.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onetouch.web.fct.dwtm.dao.DwtmMapper;
import com.onetouch.web.fct.dwtm.dao.DwtmVO;
import com.onetouch.web.fct.dwtm.service.DwtmService;

import lombok.extern.java.Log;
@RequestMapping("/fct")
@Log
@Controller
public class DwtmController {

	@Autowired DwtmService dservice;
	@Autowired DwtmMapper dmapper;
	
	//수리횟수 조회
	@ResponseBody
	@PostMapping("/selectFctFixCount")
	public List<DwtmVO> selectFixFctCount(@RequestBody DwtmVO dwtmVO) {
		System.out.println();
		return dservice.selectFctFixCount(dwtmVO);
	}
	//비동기 조회 이동
	@RequestMapping("/fctDwtmSel")
	public String moveDwtmSelPage() {
		return "tiles/fct/dwtmSel";
	}
	
	//비동기 삭제
	@ResponseBody
	@PostMapping("/dwtmDelete")
	public int dwtmDelete(@RequestBody DwtmVO dwtmVO) {
		log.info("삭제 컨트롤러 연결했슴");
		System.out.println(dwtmVO);
		return dservice.dwtmDelte(dwtmVO);
	}
	
	//비동기 수정
	@ResponseBody
	@PostMapping("/dwtmUpdate")
	public  List<DwtmVO> dwtmUpdate(@RequestBody DwtmVO dwtmVO) {
		dmapper.updateChangeFctDwtmWait(dwtmVO);
		dservice.dwtmUpdate(dwtmVO);
		return dservice.dwtmSelectAll(dwtmVO);
	}
	
	//비동기 등록
	@ResponseBody
	@PostMapping("/dwtmInsret")
	public int dwtmInsert(@RequestBody DwtmVO dwtmVO) {
		dservice.dwtmInsert(dwtmVO);
		dmapper.updateChangeFctDwtm(dwtmVO);	//설비 상태 비가동으로 변경
		return 1;
	}
	
	@RequestMapping("/fctDwtmIns")
	public String moveDwtmPage() {
		return "tiles/fct/dwtmIns";
	}
	
	/* 비동기 테이블 목록 조회 */
	@ResponseBody
	@PostMapping("/dwtmSelectAll")
	public List<DwtmVO> dwtmSelect(@RequestBody DwtmVO dwtmVO){
		System.out.println("비동기 테이블 목록조회테스트");
		System.out.println(dwtmVO);
		return dservice.dwtmSelectAll(dwtmVO);
		
	}
}
