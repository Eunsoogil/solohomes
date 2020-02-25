package com.ateam.solohomes.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.AjaxInfoList;
import com.ateam.solohomes.user.main.AjaxInfoQryResult;
import com.ateam.solohomes.user.main.AjaxReviewList;
import com.ateam.solohomes.user.main.ProductInfoDAO;
import com.ateam.solohomes.user.main.ProductInfoDTO;
import com.ateam.solohomes.user.main.ReviewDAO;
import com.ateam.solohomes.user.main.ReviewDTO;

@RestController
@RequestMapping("/user")
public class InfoRestController {
	@RequestMapping("/likeup/{g_uid}/{mb_uid}")
	public AjaxInfoList likeup( 
			@PathVariable("g_uid") int g_uid, @PathVariable("mb_uid") int mb_uid){
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
	
	@RequestMapping("/review/{g_uid}/{mb_uid}/{writePages}/{page}")
	public AjaxReviewList list(
			@PathVariable("g_uid") int g_uid, @PathVariable("mb_uid") int mb_uid,
			@PathVariable("writePages") int writePages, @PathVariable("page") int page ){
		AjaxReviewList result = new AjaxReviewList();
		ArrayList<ReviewDTO> list = null;
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		list = dao.selectByRow(g_uid, (page - 1) * writePages, writePages);
		result.setList(list);

		if(list != null && list.size() > 0) {
			result.setStatus("OK");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}	
		return result;
	}
	
	@RequestMapping("/review/delete.do")
	public AjaxInfoQryResult deleteOk(int co_uid) {
		AjaxInfoQryResult result = new AjaxInfoQryResult();
		
		int cnt = 0;
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		cnt = dao.deleteByUid(co_uid);
		
		if(cnt == 1) {
			result.setStatus("OK");
			result.setCount(cnt);
		} else {
			result.setStatus("FAIL");
		}		
		return result;
	}
}
