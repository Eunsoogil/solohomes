package com.ateam.solohomes.board.command;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.board.C;
import com.ateam.solohomes.board.beans.BWriteDTO;
import com.ateam.solohomes.board.beans.IWriteDAO;

public class BWriteCommand implements BCommand {

	@Override
	public void execute(Model model) {
		//controller에서 dao 생성후 model에 넣어줘서 넘어온 상황
		Map<String, Object> map = model.asMap();
		BWriteDTO dto = (BWriteDTO)map.get("dto");
//		BWriteDAO dao = new BWriteDAO();
//		int result = dao.insert(dto);
//		model.addAttribute("result", result);
		
		//mybatis 사용
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		model.addAttribute("result", dao.insert(dto));
		//model.addAttribute("result", dao.insert(dto.getSubject(), dto.getContent(), dto.getName()));
		
		//auto-generated key 값 확인
		System.out.println("생성된 uid = " + dto.getUid());
	}

}
