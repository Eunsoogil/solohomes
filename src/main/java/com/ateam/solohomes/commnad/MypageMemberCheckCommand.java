package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.MemberDTO;
import com.ateam.solohomes.beans.MypageDAO;

public class MypageMemberCheckCommand implements Command{
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		
		int result = 0;
		
		MemberDTO dto = (MemberDTO)map.get("dto");
		MemberDTO resultDTO = null;
		
		String mb_pwCheck = dto.getMb_pw().trim();
	
		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		
		resultDTO = dao.selectMemberInfo(dto.getMb_uid());
		String mb_pw = resultDTO.getMb_pw().trim();
		
		if(mb_pw.equals(mb_pwCheck)) {
			result = 1;
		}
		
		System.out.println("mb_uid:" + dto.getMb_uid());
		System.out.println("result:" + result);
		
		model.addAttribute("mb_uid", dto.getMb_uid());
		model.addAttribute("result", result);

	}

}
