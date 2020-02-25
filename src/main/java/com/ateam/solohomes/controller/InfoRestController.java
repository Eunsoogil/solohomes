package com.ateam.solohomes.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.AjaxInfoList;
import com.ateam.solohomes.user.main.AjaxInfoQryResult;
import com.ateam.solohomes.user.main.ProductInfoDAO;
import com.ateam.solohomes.user.main.ProductInfoDTO;

@RestController
@RequestMapping("/user")
public class InfoRestController {
	@RequestMapping("/likeup/{g_uid}/{mb_uid}")
	public AjaxInfoList likeup( 
			@PathVariable("g_uid") int g_uid, @PathVariable("mb_uid") int mb_uid){
		System.out.println(g_uid);
		System.out.println(mb_uid);
		AjaxInfoList result = new AjaxInfoList();
		
		ProductInfoDAO dao = C.sqlSession.getMapper(ProductInfoDAO.class);
		ArrayList<ProductInfoDTO> list = dao.likeCnt(g_uid);
		
		int cnt = dao.likePlus(g_uid);
		int cnt2 = dao.likeInsert(mb_uid, g_uid);
		
		if(cnt == 1  && cnt == 2) {
			result.setStatus("OK");
			result.setCount(cnt);
			result.setList(list);
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping("/likedown/{g_uid}/{mb_uid}")
	public AjaxInfoList likedown( 
			@PathVariable("g_uid") int g_uid, @PathVariable("mb_uid") int mb_uid){
		System.out.println(g_uid);
		System.out.println(mb_uid);
		AjaxInfoList result = new AjaxInfoList();
		
		ProductInfoDAO dao = C.sqlSession.getMapper(ProductInfoDAO.class);
		ArrayList<ProductInfoDTO> list = dao.likeCnt(g_uid);
		
		int cnt = dao.likeMinus(g_uid);
		int cnt2 = dao.likeDelete(mb_uid, g_uid);
		
		if(cnt == 1  && cnt == 2) {
			result.setStatus("OK");
			result.setCount(cnt);
			result.setList(list);
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
}
