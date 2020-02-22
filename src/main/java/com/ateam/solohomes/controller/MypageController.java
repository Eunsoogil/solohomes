package com.ateam.solohomes.controller;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.AjaxPurchaseList;
import com.ateam.solohomes.beans.MemberDTO;
import com.ateam.solohomes.beans.MypageDAO;
import com.ateam.solohomes.beans.PurchaseDTO;
import com.ateam.solohomes.commnad.MypageMemberCheckCommand;
import com.ateam.solohomes.commnad.MypageMemberInfoCommand;
import com.ateam.solohomes.commnad.MypageMemberUpdateCommand;

@Controller
@RequestMapping("/user/mypage")
public class MypageController {
	
	
	// MyBatis
	private SqlSession sqlSession;
	
		
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	
	@RequestMapping("/memberCheck.do/{mb_uid}")
	public String memberCheck(@PathVariable("mb_uid") int mb_uid, Model model){
		model.addAttribute("mb_uid", mb_uid);
		return "user/mypage/memberCheck";
	}
	
	
	@RequestMapping(value = "/memberCheckOk.do", method = RequestMethod.POST)
	public String memberCheckOk(MemberDTO dto, Model model){
		
		model.addAttribute("dto", dto);
		new MypageMemberCheckCommand().execute(model);
		
		return "user/mypage/memberCheckOk";
	}
    
	
	@RequestMapping("/memberUpdate.do/{mb_uid}")
	public String memberUpdate(@PathVariable("mb_uid") int mb_uid, Model model){
		model.addAttribute("mb_uid", mb_uid);   
		new MypageMemberInfoCommand().execute(model);
		
		return "user/mypage/memberUpdate";
	}
	
	
	@RequestMapping(value = "/memberUpdateOk.do", method = RequestMethod.POST)
	public String memberUpdateOk(MemberDTO dto, Model model){
		model.addAttribute("dto", dto);
		new MypageMemberUpdateCommand().execute(model);
		
		return "user/mypage/memberUpdateOk";
	}
	

}
