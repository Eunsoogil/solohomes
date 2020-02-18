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
import com.ateam.solohomes.beans.PaymentDTO;
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
	
		
	@RequestMapping("/index.do")
	public String home(Model model){
		return "user/index";
	}

	
	@RequestMapping("/memberPurchaseList/{mb_uid}/{writePages}/{page}")
	public AjaxPurchaseList memberPurchaseList(@PathVariable("mb_uid") int mb_uid, @PathVariable("writePages") int writePages, @PathVariable("page") int page){
	
		AjaxPurchaseList result = new AjaxPurchaseList();
		ArrayList<PaymentDTO> list = null;
		
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
	
		return result;
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
