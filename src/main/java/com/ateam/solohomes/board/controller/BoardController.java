package com.ateam.solohomes.board.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ateam.solohomes.board.C;
import com.ateam.solohomes.board.beans.BWriteDTO;
import com.ateam.solohomes.board.command.*;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	// Mybatis용 sqlSession
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}

	private BCommand command;
	
	public BoardController() {
		System.out.println("BoardController 생성");
	}
	
	@RequestMapping("/list.do")
	public String list(Model model) {
		command = new BListCommand();
		command.execute(model);
		return "board/list";
	}
	
	@RequestMapping("/write.do")
	public String write(Model model) {
		return "board/write";
	}
	
	@RequestMapping(value = "/writeOk.do", method = RequestMethod.POST)
	public String writeOk(BWriteDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new BWriteCommand().execute(model);
		return "board/writeOk";
	}
	
	@RequestMapping(value = "/view.do")
	public String view(int uid, Model model) {
		model.addAttribute("uid", uid);
		command = new BViewCommand();
		command.execute(model);
		return "board/view";
	}
	
	@RequestMapping(value = "/update.do")
	public String update(int uid, Model model) {
		model.addAttribute("uid", uid);
		command = new BSelectCommand();
		command.execute(model);
		return "board/update";
	}
	
	@RequestMapping(value = "/updateOk.do")
	public String updateOk(BWriteDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new BUpdateCommand().execute(model);
		return "board/updateOk";
	}
	
	@RequestMapping(value = "/deleteOk.do")
	public String delete(int uid, Model model) {
		model.addAttribute("uid", uid);
		command = new BDeleteCommand();
		command.execute(model);
		return "board/deleteOk";
	}

}
