package com.ateam.solohomes.board.command;

import org.springframework.ui.Model;

import com.ateam.solohomes.board.C;
import com.ateam.solohomes.board.beans.IWriteDAO;

public class BDeleteCommand implements BCommand {

	@Override
	public void execute(Model model) {
		int uid = (Integer) model.getAttribute("uid");
//		BWriteDAO dao = new BWriteDAO();
//		int result = dao.delete(uid);
		
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		int result = dao.delete(uid);
		model.addAttribute("result", result);

	}

}
