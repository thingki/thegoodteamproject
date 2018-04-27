package com.jeong.haejwo.dao;

import java.util.List;

import com.jeong.haejwo.vo.BoardVO;



public interface BoardDAO {

	public void insertBoard(BoardVO bo);
	public void updateBoard(BoardVO bo);
	public void incrementHit(BoardVO bo);
	public void deleteBoard(int idx);
	
	public BoardVO selectBoard(int idx);
	public List<BoardVO> selectAll();
	
	
	
}
