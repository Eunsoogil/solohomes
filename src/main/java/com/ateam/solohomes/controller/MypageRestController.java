package com.ateam.solohomes.controller;

import java.util.ArrayList;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.AjaxLikeList;
import com.ateam.solohomes.beans.AjaxPurchaseList;
import com.ateam.solohomes.beans.AjaxRequestList;
import com.ateam.solohomes.beans.GoodsDTO;
import com.ateam.solohomes.beans.MypageDAO;
import com.ateam.solohomes.beans.PurchaseDTO;
import com.ateam.solohomes.beans.RequestDTO;
import com.ateam.solohomes.commnad.MypageRequestWriteCommand;


@RestController
@RequestMapping("/mypageAjax")
public class MypageRestController {
	
	
	@RequestMapping("/memberPurchaseList.ajax/{mb_uid}/{writePages}/{page}")
	public AjaxPurchaseList memberPurchaseList(@PathVariable("mb_uid") int mb_uid, @PathVariable("writePages") int writePages, @PathVariable("page") int page){
	
		System.out.println("mb_uid: "+ mb_uid);
		System.out.println("writePages: "+ writePages);
		System.out.println("page: "+ page);
		
		AjaxPurchaseList result = new AjaxPurchaseList();
		ArrayList<PurchaseDTO> list = null;
		
		// 페이징처리 결과를 리스트로 
		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		list = dao.selectPurchaseListByUid(mb_uid, (page - 1) * writePages, writePages);
		
		
		result.setList(list);
	
		// 잃어들인 글 내용이 있는 경우와 없는 경우로 나누어 처리
		if(list != null && list.size() > 0){ 
			result.setStatus("OK");
			result.setCount(list.size());
		}else {
			result.setStatus("FAIL");
		}
		
		System.out.println(result.getStatus());
	
		return result;
	}
	

	
	
	@RequestMapping("/searchDate.ajax/{mb_uid}/{searchStartDate}/{searchEndDate}/{writePages}/{page}")
	public AjaxPurchaseList searchDate(@PathVariable("mb_uid") int mb_uid, 
										@PathVariable("searchStartDate") String searchStartDate, 
										@PathVariable("searchEndDate") String searchEndDate, 
										@PathVariable("writePages") int writePages, 
										@PathVariable("page") int page){
	
		System.out.println("mb_uid: "+ mb_uid);
		System.out.println("searchStartDate: "+ searchStartDate);
		System.out.println("searchEndDate: "+ searchEndDate);
		System.out.println("writePages: "+ writePages);
		System.out.println("page: "+ page);
		
		AjaxPurchaseList result = new AjaxPurchaseList();
		ArrayList<PurchaseDTO> list = null;
		
		// 페이징처리 결과를 리스트로 
		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		list = dao.searchDate(mb_uid, searchStartDate, searchEndDate, (page - 1) * writePages, writePages);
			
		result.setList(list);
	
		// 잃어들인 글 내용이 있는 경우와 없는 경우로 나누어 처리
		if(list != null && list.size() > 0){ 
			result.setStatus("OK");
			result.setCount(list.size());
		}else {
			result.setStatus("FAIL");
		}
		
		System.out.println(result.getStatus());
	
		return result;
	}
	
	
	
	
	@RequestMapping("/searchKeyword.ajax/{mb_uid}/{keyword}/{writePages}/{page}")
	public AjaxPurchaseList searchKeyword(@PathVariable("mb_uid") int mb_uid, 
										@PathVariable("keyword") String keyword, 
										@PathVariable("writePages") int writePages, 
										@PathVariable("page") int page){
	
		System.out.println("mb_uid: "+ mb_uid);
		System.out.println("keyword: "+ keyword);
		System.out.println("writePages: "+ writePages);
		System.out.println("page: "+ page);
		
		AjaxPurchaseList result = new AjaxPurchaseList();
		ArrayList<PurchaseDTO> list = null;
		
		// 페이징처리 결과를 리스트로 
		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		list = dao.searchKeyword(mb_uid, keyword, (page - 1) * writePages, writePages);
		
		
		result.setList(list);
	
		// 잃어들인 글 내용이 있는 경우와 없는 경우로 나누어 처리
		if(list != null && list.size() > 0){ 
			result.setStatus("OK");
			result.setCount(list.size());
		}else {
			result.setStatus("FAIL");
		}
		
		System.out.println(result.getStatus());
	
		return result;
	}
	
	
	
	@RequestMapping("/purchaseConfirm.ajax/{mb_uid}/{py_uid}")
	public AjaxPurchaseList purchaseConfirm(@PathVariable("mb_uid") int mb_uid, @PathVariable("py_uid") int py_uid){
	
		System.out.println("mb_uid: "+ mb_uid);
		System.out.println("py_uid: "+ py_uid);;
		
		AjaxPurchaseList result = new AjaxPurchaseList();
		
		// 페이징처리 결과를 리스트로 
		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		int qryResult = dao.purchaseConfirm(mb_uid, py_uid);
		
		System.out.println("qryResult : " + qryResult);
		
		if(qryResult == 1) {
			result.setStatus("OK");
		}else {
			result.setStatus("FAIL");
		}
	
		return result;
	}

	
	
	
	@RequestMapping("/memberLikeList.ajax/{mb_uid}/{writePages}/{page}")
	public AjaxLikeList memberLikeList(@PathVariable("mb_uid") int mb_uid, @PathVariable("writePages") int writePages, @PathVariable("page") int page){
	
		System.out.println("mb_uid: "+ mb_uid);
		System.out.println("writePages: "+ writePages);
		System.out.println("page: "+ page);
		
		AjaxLikeList result = new AjaxLikeList();
		ArrayList<GoodsDTO> list = null;
		
		// 페이징처리 결과를 리스트로 
		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		list = dao.selectMemberLikeListByUid(mb_uid, (page - 1) * writePages, writePages);
			
		result.setList(list);
	
		// 잃어들인 글 내용이 있는 경우와 없는 경우로 나누어 처리
		if(list != null && list.size() > 0){ 
			result.setStatus("OK");
			result.setCount(list.size());
		}else {
			result.setStatus("FAIL");
		}
		
		System.out.println(result.getStatus());
	
		return result;
	}
	
	
	
	@RequestMapping("/memberRequestList.ajax/{mb_uid}/{writePages}/{page}")
	public AjaxRequestList memberRequestList(@PathVariable("mb_uid") int mb_uid, @PathVariable("writePages") int writePages, @PathVariable("page") int page){
	
		System.out.println("mb_uid: "+ mb_uid);
		System.out.println("writePages: "+ writePages);
		System.out.println("page: "+ page);
		
		AjaxRequestList result = new AjaxRequestList();
		ArrayList<RequestDTO> list = null;
		
		// 페이징처리 결과를 리스트로 
		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		list = dao.selectMemberRequest(mb_uid, (page - 1) * writePages, writePages);
	
		result.setList(list);
	
		// 잃어들인 글 내용이 있는 경우와 없는 경우로 나누어 처리
		if(list != null && list.size() > 0){ 
			result.setStatus("OK");
			result.setCount(list.size());
		}else {
			result.setStatus("FAIL");
		}
		
		System.out.println(result.getStatus());
	
		return result;
	}

	
	
	
}
