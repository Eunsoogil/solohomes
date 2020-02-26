package com.ateam.solohomes.commnad;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.omg.CORBA.Request;
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
		
		int userUID = -1;
		String userID = "";
		int level = 0;
		
		
		
		if(cnt == 1) {
			
			dao = C.sqlSession.getMapper(LoginDAO.class);
			mdto = dao.selectById(mdto.getId());
			
			userUID = mdto.getUid();
			userID = mdto.getId();
			level = mdto.getLevel();
		
		}
		
		HttpSession session = new HttpSession() {
			
			@Override
			public void setMaxInactiveInterval(int interval) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void setAttribute(String name, Object value) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void removeValue(String name) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void removeAttribute(String name) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void putValue(String name, Object value) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean isNew() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public void invalidate() {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public String[] getValueNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object getValue(String name) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public HttpSessionContext getSessionContext() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public ServletContext getServletContext() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getMaxInactiveInterval() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public long getLastAccessedTime() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getId() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public long getCreationTime() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public Enumeration getAttributeNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object getAttribute(String name) {
				// TODO Auto-generated method stub
				return null;
			}
		};
		
		session.setAttribute("userUID", userUID);
		session.setAttribute("userID", userID);
		session.setAttribute("level", level);
		
		model.addAttribute("result", cnt);
		//model.addAttribute("userId", userId);
		

	}

}
