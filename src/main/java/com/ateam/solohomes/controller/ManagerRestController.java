package com.ateam.solohomes.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.manager.AjaxManagerQryResult;
import com.ateam.solohomes.beans.manager.AjaxMemberList;
import com.ateam.solohomes.beans.manager.ManagerDAO;
import com.ateam.solohomes.beans.manager.MemberRenumDTO;

@RestController
@RequestMapping("/managerAjax")
public class ManagerRestController {
	
	@RequestMapping("/member.ajax/{type}/{sortType}/{listPages}/{page}")
	public AjaxMemberList userList(@PathVariable("type") String type, @PathVariable("sortType") String sortType, @PathVariable("listPages") int listPages, @PathVariable("page") int page) {
		ArrayList<MemberRenumDTO> list = null;
		AjaxMemberList result = new AjaxMemberList();
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		//sort select
		int s_type = Integer.parseInt(sortType);
		System.out.println(s_type);
		String sortColumn = "";
		
		if (type.equals("user")) {
			switch(s_type) {
			case 0: 
				sortColumn = "mb.mb_uid";
				list = dao.selectAllUserByRow((page - 1) * listPages, listPages);
				break;
			case 1:
				sortColumn = "reportedNum";
				list = dao.selectAllUserByRowReportedNum((page - 1) * listPages, listPages);
				break;
			case 2:
				sortColumn = "mb.mb_regdate";
				list = dao.selectAllUserByRowRegdate((page - 1) * listPages, listPages);
				break;
			case 3:
				sortColumn = "mb.mb_id";
				list = dao.selectAllUserByRowId((page - 1) * listPages, listPages);
				break;
			case 4:
				sortColumn = "mb.mb_nn";
				list = dao.selectAllUserByRowNN((page - 1) * listPages, listPages);
				break;
			default: break;
			}
			result.setSortColumn(sortColumn);
		} else if (type.equals("admin")) {
			list = dao.selectAllAdminByRow((page - 1) * listPages, listPages);
		}
		result.setList(list);
		
		if (list != null && list.size() > 0) {
			result.setStatus("SUCCESS");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/deleteOk.do", method = RequestMethod.POST)
	public AjaxManagerQryResult deleteOk(String[] uids) {
		AjaxManagerQryResult result = new AjaxManagerQryResult();
		
		int cnt = 0;
		if (uids != null && uids.length > 0) {
			ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
			int[] list = new int[uids.length];
			for (int i = 0; i < list.length; i ++) {
				list[i] = Integer.parseInt(uids[i]);
			}
			
			cnt = dao.deleteMembersByUid(list);
			
			result.setCount(cnt);
			result.setStatus("SUCCESS");
		} else {
			result.setCount(cnt);
			result.setStatus("FAIL");
		}
		
		return result;
	}
}
