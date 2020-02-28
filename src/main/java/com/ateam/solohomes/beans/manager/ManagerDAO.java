package com.ateam.solohomes.beans.manager;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.ateam.solohomes.beans.GoodsDTO;
import com.ateam.solohomes.beans.GoodsInfoDTO;

@MapperScan
public interface ManagerDAO {
	
	// NON AJAX
	// count today's sign up member
	public Integer countTodaySignUp();
	// count today's sales
	public Integer countTodaySales();
	// sum today's sales
	public Integer sumTodaySales();
	// insert goods
	public Integer insertGoods(GoodsDTO goodsDTO);
	// insert goods_info
	public Integer insertGoodsInfo(@Param("color") String color, @Param("imgPath") String imgPath, @Param("g_uid") int g_uid);
	// select goods by uid
	public GoodsDTO selectGoodsByUid(@Param("uid") int uid);
	// select goods_info by g_uid
	public ArrayList<GoodsInfoDTO> selectGoodsInfosByGuid(@Param("uid") int uid);
	// update goods by g_uid
	public Integer updateGoods(@Param("dto") GoodsDTO goodsDTO, @Param("g_uid") int uid);
	// delete goods_info by_uid
	public Integer deleteGoodsInfoByUid(int uid);
	// REST
	// select all users
	public ArrayList<MemberRenumDTO> selectAllUserByRow(@Param("startRow") int startRow, @Param("listPage") int listPage);
	public ArrayList<MemberRenumDTO> selectAllUserByRowReportedNum(@Param("startRow") int startRow, @Param("listPage") int listPage);
	public ArrayList<MemberRenumDTO> selectAllUserByRowRegdate(@Param("startRow") int startRow, @Param("listPage") int listPage);
	public ArrayList<MemberRenumDTO> selectAllUserByRowId(@Param("startRow") int startRow, @Param("listPage") int listPage);
	public ArrayList<MemberRenumDTO> selectAllUserByRowNN(@Param("startRow") int startRow, @Param("listPage") int listPage);
	// select all admins
	public ArrayList<MemberRenumDTO> selectAllAdminByRow(@Param("startRow") int startRow, @Param("listPage") int listPage);
	// delete checked members
	public int deleteMembersByUid(@Param("uidList") int[] list);
	
	// select all requests
	public ArrayList<RequestDTO> selectAllRequestByRow(@Param("startRow") int startRow, @Param("listPage") int listPage);
	// select all no response requests 
	public ArrayList<RequestDTO> selectAllRequestNoResponseByRow(@Param("startRow") int startRow, @Param("listPage") int listPage);
	// select request by uid
	public ArrayList<RequestDTO> selectRequestByUid(@Param("uid") int uid);
	// update response first
	public int updateRequestByUid(@Param("uid") int uid, @Param("response") String response);
	// delete requests by uids
	public int deleteRequestsByUids(@Param("uidList") int[] list);
	
	// select all comments
	public ArrayList<CommentRenumDTO> selectAllCommentByRow(@Param("startRow") int startRow, @Param("listPage") int listPage);
	public ArrayList<CommentRenumDTO> selectAllCommenType1(@Param("startRow") int startRow, @Param("listPage") int listPage);
	// select comment by uid
	public ArrayList<CommentRenumDTO> selectCommentByUid(@Param("uid") int uid);
	// delete checked reviews
	public int deleteCommentsByUids(@Param("uidList") int[] list);
	
	// get statistics of monthly sales amount
	public ArrayList<MonthlySalesDTO> getMonthlySales();
	// get daily sales
	public ArrayList<DailySalesDTO> getDailySalesByMonth(@Param("month") String month);
	
	// select goods by type and sort
	public ArrayList<GoodsSalNumDTO> selectSortedGoodsByType(@Param("type") int type, @Param("columnNum") int columnNum, @Param("sord") String sord, @Param("startRow") int startRow, @Param("listPage") int listPage);
	// delete goods by uids
	public int deleteGoodsByUids(@Param("uidList") int[] list);
}
