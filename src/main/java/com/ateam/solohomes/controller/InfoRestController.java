package com.ateam.solohomes.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.AjaxInfoList;
import com.ateam.solohomes.user.main.AjaxInfoQryResult;
import com.ateam.solohomes.user.main.ProductInfoDAO;
import com.ateam.solohomes.user.main.ProductInfoDTO;

@RestController
@RequestMapping("/user")
public class InfoRestController {
	@RequestMapping("/like/{g_uid}")
	public AjaxInfoQryResult list( @PathVariable("g_uid") int g_uid){
		AjaxInfoQryResult result = new AjaxInfoQryResult();	
		ProductInfoDAO dao = C.sqlSession.getMapper(ProductInfoDAO.class);
		int cnt = dao.likePlus(g_uid);
		
		if(cnt == 1) {
			result.setStatus("OK");
			result.setCount(cnt);
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	} // end list()
}
