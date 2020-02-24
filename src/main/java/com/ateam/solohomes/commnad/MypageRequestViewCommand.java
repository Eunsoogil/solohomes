package com.ateam.solohomes.commnad;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.MypageDAO;
import com.ateam.solohomes.beans.RequestDTO;

public class MypageRequestViewCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int rq_uid = (Integer)map.get("rq_uid");

		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		RequestDTO dto = dao.selectRequestByUid(rq_uid);
		
		model.addAttribute("dto", dto);

	}

}
