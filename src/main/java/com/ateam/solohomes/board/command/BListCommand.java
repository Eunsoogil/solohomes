package com.ateam.solohomes.board.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.ateam.solohomes.board.C;
import com.ateam.solohomes.board.beans.BWriteDTO;
import com.ateam.solohomes.board.beans.IWriteDAO;

public class BListCommand implements BCommand {

	@Override
	public void execute(Model model) {
//		BWriteDAO dao = new BWriteDAO();
//		ArrayList<BWriteDTO> list = dao.select();
//		model.addAttribute("list", list);
		
		//mybatis 사용
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		model.addAttribute("list", dao.select());
	}

}
