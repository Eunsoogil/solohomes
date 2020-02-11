package com.ateam.solohomes.board.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.ateam.solohomes.board.C;
import com.ateam.solohomes.board.beans.BWriteDTO;
import com.ateam.solohomes.board.beans.IWriteDAO;

public class BViewCommand implements BCommand {

	@Override
	public void execute(Model model) {
		int uid = (Integer) model.getAttribute("uid");
//		BWriteDAO dao = new BWriteDAO();
//		ArrayList<BWriteDTO> read = dao.readByUid(uid);
		
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		dao.incViewCnt(uid);
		ArrayList<BWriteDTO> read = dao.selectByUid(uid);
		model.addAttribute("read", read);
	}

}
