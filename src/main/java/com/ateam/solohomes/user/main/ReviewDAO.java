package com.ateam.solohomes.user.main;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface ReviewDAO {
	public ArrayList<ReviewDTO> select(int g_uid);
	
	public int insert(final ReviewDTO dto);

	public int update(ReviewDTO dto);
	
	public int deleteByUid(int co_uid);
	
	// 페이징 용 글 목록 SELECT 
	// fromRow : 몇번째 ROW부터 ?
	// writePages : 페이지당 몇개의 데이터 (게시글)?
	public ArrayList<ReviewDTO> selectByRow(
			@Param("g_uid")int g_uid,
			@Param("fromRow")int fromRow,
			@Param("writePages")int writePages
	);
	
}
