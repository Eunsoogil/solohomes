package com.ateam.solohomes.commnad;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.CategoryDAO;
import com.ateam.solohomes.beans.GoodsDTO;

public class CategoryCMD implements Command {

	@Override
	public void execute(Model model) {
		
		int g_type = (int) model.getAttribute("g_type");
		System.out.println(g_type);
		
		CategoryDAO dao = C.sqlSession.getMapper(CategoryDAO.class);
		ArrayList<GoodsDTO> gdto = new ArrayList<GoodsDTO>();
		String typeName ="";
	
		
		switch(g_type) {
			case 1:
				gdto = dao.selectByTypee(g_type);
				typeName= "침 대";
				break;
			case 2:
				gdto = dao.selectByTypee(g_type);
				typeName= "화 장 대";
			break;
			case 3:
				gdto = dao.selectByTypee(g_type);
				typeName= "서 랍 장";
			break;
			case 4:
				gdto = dao.selectByTypee(g_type);
				typeName= "쇼 파";
			break;
			case 5:
				gdto = dao.selectByTypee(g_type);
				typeName= "거 실 장";
			break;
			case 6:
				gdto = dao.selectByTypee(g_type);
				typeName= "옷 장";
			break;
			case 7:
				gdto = dao.selectByTypee(g_type);
				typeName= "테 이 블";
			break;
			case 8:
				gdto = dao.selectByTypee(g_type);
				typeName= "의 자";
			break;
			case 9:
				gdto = dao.selectByTypee(g_type);
				typeName= "책 상";
			break;
			case 10:
				gdto = dao.selectByTypee(g_type);
				typeName= "책 장";
			break;
			default:
				break;
		}
		
		
		model.addAttribute("gdto", gdto);
		model.addAttribute("typeName", typeName);
		

		
	}

}
