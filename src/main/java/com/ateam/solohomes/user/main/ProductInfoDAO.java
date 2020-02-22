package com.ateam.solohomes.user.main;


public interface ProductInfoDAO{
	// 가구 상세 띄우기
	public ProductInfoDTO selectByUid(int g_uid);
	
	// 좋아요
	public int likeInsert(int gl_uid, int mb_uid, int g_uid);
	// 좋아요 취소
	public int likeDelete(int gl_uid);
	
	// 장바구니
	public int cartInsert(int cr_uid, int mb_uid, int in_uid, int cr_amount);
}
