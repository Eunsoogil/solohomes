package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.ProductInfoDAO;
import com.ateam.solohomes.user.main.ProductInfoDTO;

public class InfoViewCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int g_uid = (Integer)map.get("g_uid");
		
		ProductInfoDAO dao = C.sqlSession.getMapper(ProductInfoDAO.class);
		ProductInfoDTO dto = dao.selectByUid(g_uid);
		
		
		model.addAttribute("dto", dto);
	}

}
