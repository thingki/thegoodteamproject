package com.jeong.haejwo.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeong.haejwo.dao.BoardDAO;
import com.jeong.haejwo.vo.BoardVO;


@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sql;
	// private SqlSessionFactory ssf;

	// insert
	@Override
	public void insertBoard(BoardVO bo) {
		sql.insert("board.insertBoard", bo);

	}

	// update
	@Override
	public void updateBoard(BoardVO bo) {
		sql.update("board.updateBoard", bo);

	}

	// 조회수
	@Override
	public void incrementHit(BoardVO bo) {
		int idx = bo.getIdx();
		int count = sql.selectOne("board.getHit", idx);
		count++;
		bo.setHit(count);
		sql.update("board.updateBoardHit", bo);
	}

	// 삭제
	@Override
	public void deleteBoard(int idx) {
		sql.delete("board.deleteBoard", idx);

	}

	@Override
	public BoardVO selectBoard(int idx) {
		return sql.selectOne("board.selectBoard", idx);
	}

	@Override
	public List<BoardVO> selectAll() {
		List<BoardVO> result=sql.selectList("board.getAll");
		return result;
	}
}