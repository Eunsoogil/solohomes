package com.ateam.solohomes.board.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.ateam.solohomes.board.C;
import com.ateam.solohomes.board.beans.BWriteDTO;
import com.ateam.solohomes.board.beans.IWriteDAO;

public class BSelectCommand implements BCommand {

	@Override
	public void execute(Model model) {
		int uid = (Integer) model.getAttribute("uid");
//		BWriteDAO dao = new BWriteDAO();
//		ArrayList<BWriteDTO> sel = dao.selectByUid(uid);
		
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		ArrayList<BWriteDTO> sel = dao.selectByUid(uid);
		
		model.addAttribute("sel", sel);
	}

}
