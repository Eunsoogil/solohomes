package com.ateam.solohomes.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.SeriesDAO;
import com.ateam.solohomes.beans.SeriesDTO;

@Controller
@RequestMapping("/series")
public class SeriesController {
	
	@RequestMapping("/series.do")
	public String search(Model model) {
		SeriesDAO dao = C.sqlSession.getMapper(SeriesDAO.class);
		ArrayList<SeriesDTO> dto = dao.seriesselect();
		ArrayList<SeriesDTO> series = dao.seriesnum();
		model.addAttribute("dto", dto);
		model.addAttribute("series", series);
		return "series/series";
	}

}
