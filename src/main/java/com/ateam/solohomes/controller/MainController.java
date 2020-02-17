package com.ateam.solohomes.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ateam.solohomes.C;
import com.ateam.solohomes.commnad.Command;
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
}
