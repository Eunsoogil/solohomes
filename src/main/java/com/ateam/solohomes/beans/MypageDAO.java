package com.ateam.solohomes.beans;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface MypageDAO {
	
	// 페이징용 글 목록 SELECT
	// fromRow : 몇번째 row부터?
	// writePages : 페이지 당 몇개의 데이터(게시글)?
	// public ArrayList<> selectPurchaseListByUid(@Param("mb_uid") int mb_uid, @Param("fromRow") int fromRow, @Param("writePages")int writePages);
	// public ArrayList<> selectPurchaseListByUid(@Param("mb_uid") int mb_uid);

	public MemberDTO selectMemberInfo(int mb_uid);
	
	public int updateMemberInfo(@Param("dto") MemberDTO dto);
	
	public ArrayList<PurchaseDTO> selectPurchaseListByUid(@Param("mb_uid") int mb_uid, @Param("fromRow") int fromRow, @Param("writePages")int writePages);
	
}
