package com.ateam.solohomes.controller;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.search.SearchDAO;
import com.ateam.solohomes.beans.search.SearchDTO;
import com.ateam.solohomes.commnad.Command;
import com.ateam.solohomes.commnad.InfoViewCommand;
import com.ateam.solohomes.commnad.ListCommand;

@Controller
@RequestMapping("/user")
public class MainController {

	private Command command;
	private SqlSession sqlSession;
	private TransactionTemplate transactionTemplate;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	@Autowired
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
		C.transactionTemplate = transactionTemplate;
	}
	
	@RequestMapping("/main.do")
	public String ListMain(Model model) {
		command = new ListCommand();
		command.execute(model);
		return "user/main";
	}
	@RequestMapping("/search.do")
	public String search(Model model) {
		return "user/search/search";
	}
	
	@RequestMapping(value = "/searchOk.do", method = RequestMethod.POST)
	public String searchOk(Model model, HttpServletRequest request) {
		String userKeyword = (String)request.getParameter("userKeyword");
		
		System.out.println(userKeyword);
		if(userKeyword == null || userKeyword.equals("")){
			model.addAttribute("g_uid", 0);
			return "user/search/searchOk";
		}		
		SearchDAO dao = C.sqlSession.getMapper(SearchDAO.class);
		ArrayList<SearchDTO> keywordlist = dao.select();
		
		String [] keywords = new String [keywordlist.size() + 10];
		keywords[0] = "침대,1";
		keywords[1] = "화장대,2";
		keywords[2] = "서랍장,3";
		keywords[3] = "소파,4";
		keywords[4] = "거실장,5";
		keywords[5] = "옷장,6";
		keywords[6] = "테이블,7";
		keywords[7] = "의자,8";
		keywords[8] = "책상,9";
		keywords[9] = "책장,10";
		
		Iterator<SearchDTO> iter = keywordlist.iterator();
		int cnt = 0;
		while(iter.hasNext()){
			keywords[10 + cnt] = keywordlist.get(cnt).getG_name() + ","
					+ keywordlist.get(cnt).getG_uid();
			cnt++;
			if(cnt == keywordlist.size()) break;
		}

		String result = "";
		for(int i = 0; i < keywords.length; i++){
			if(keywords[i].startsWith(userKeyword)){
				result = keywords[i];
				break;
			}
		}
		String [] resultarr = result.split(",");
		
		if(resultarr[0].equals("")){
			model.addAttribute("g_uid", 0);
			return "user/search/searchOk";
		}	
		
		model.addAttribute("g_uid", resultarr[1]);
		return "user/search/searchOk";
	}
	
	@RequestMapping("/category.do")
	public String category(Model model) {
		return "user/search/category";
	}
	
	@RequestMapping("/detail.do")
	public String detail(Model model) {
		return "user/search/detail";
	}
	
	@RequestMapping("/productInfo.do")
	public String productInfo(int g_uid, Model model) {
		model.addAttribute("g_uid", g_uid); 
		new InfoViewCommand().execute(model);
		return "user/productInfo";
	}
}
