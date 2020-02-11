package com.ateam.solohomes.board.command;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.board.C;
import com.ateam.solohomes.board.beans.BWriteDTO;
import com.ateam.solohomes.board.beans.IWriteDAO;

public class BUpdateCommand implements BCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		BWriteDTO dto = (BWriteDTO)map.get("dto");
//		BWriteDAO dao = new BWriteDAO();
//		int result = dao.update(dto);
		
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		int result = dao.update(dto.getUid(), dto);
		
		model.addAttribute("result", result);

	}

}
