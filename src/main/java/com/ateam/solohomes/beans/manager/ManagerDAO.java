package com.ateam.solohomes.beans.manager;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ManagerDAO {

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
}
