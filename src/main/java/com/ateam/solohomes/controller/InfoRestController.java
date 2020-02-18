package com.ateam.solohomes.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.ProductInfoDAO;
import com.ateam.solohomes.user.main.ProductInfoDTO;

@RestController
@RequestMapping("/user")
public class InfoRestController {
	@RequestMapping("/productInfo/{g_uid}")
	//매핑에 있는 uid값이 매개변수 uid에 저장된다.
	public ProductInfoDTO read(@PathVariable("g_uid") int g_uid) {
		ProductInfoDAO dao = C.sqlSession.getMapper(ProductInfoDAO.class);
		return dao.selectByUid(g_uid);
		// 만약 Uid가 없는값 /즉, 존재하지 않는 글을 체크한다면 쿼리는 문제없기때문에 에러가 나지 않는다.
		// 하지만 쿼리의 결과는 존재하지 않기 때문에 빈화면으로 출력이 된다. 
		// 따라서 REST설계를 했다면 , 이를 고려하여 에러를 나게 해주는것이 좋다.
	}
	
	
	
	@RequestMapping("/readErr/{g_uid}")
	//매핑에 있는 uid값이 매개변수 uid에 저장된다.
	public ResponseEntity<ProductInfoDTO> readErr(@PathVariable("g_uid") int g_uid) {
		ProductInfoDAO dao = C.sqlSession.getMapper(ProductInfoDAO.class);
		ProductInfoDTO dto = dao.selectByUid(g_uid);  // 값이 존재하지 않는다면 dto는 Null을 리턴한다.
		
		//글읽기 실패 (없는글일때)
		if (dto == null) return new ResponseEntity(HttpStatus.NOT_FOUND); // 404에러
		
		
		// 성공했다면 
		return new ResponseEntity<ProductInfoDTO>(dto,HttpStatus.OK);
	}
}
