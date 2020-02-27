package com.ateam.solohomes.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ateam.solohomes.C;
import com.ateam.solohomes.commnad.Command;
import com.ateam.solohomes.commnad.ManagerIndexCommand;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
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

	@RequestMapping("/index.do")
	public String managerMain(Model model) {
		command = new ManagerIndexCommand();
		command.execute(model);
		return "manager/index";
	}
	
	@RequestMapping("/member.do")
	public String manageMember() {
		return "manager/member";
	}
	
	@RequestMapping("/goods.do")
	public String manageGoods() {
		return "manager/goods";
	}
	
	@RequestMapping("/goodsWrite.do")
	public String manageGoodsWrite() {
		return "manager/goodsWrite";
	}
	
	@RequestMapping("/review.do")
	public String manageReview() {
		return "manager/review";
	}
	
	@RequestMapping("/request.do")
	public String manageRequest() {
		return "manager/request";
	}
}
