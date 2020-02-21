package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.LoginDAO;
import com.ateam.solohomes.beans.LoginDTO;

import util.SHA256;

public class LoginInsertMCMD implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object>map = model.asMap();
		LoginDTO mdto = (LoginDTO) map.get("MDTO");
		// String userId= mdto.getId();
		
		String email = mdto.getEmail();
		mdto.setEmailhash(new SHA256().getSHA256(email));
		
		
		LoginDAO dao = C.sqlSession.getMapper(LoginDAO.class);
		int cnt = dao.insertMember(mdto);
		
		model.addAttribute("result", cnt);
		//model.addAttribute("userId", userId);
		

	}

}
