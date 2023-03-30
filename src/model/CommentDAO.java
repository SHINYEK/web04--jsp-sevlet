package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {
	//댓글 삭제
	public void delete(int id) {
		try {
			String sql = "delete from comments where id=?";
			PreparedStatement ps = DB.CON.prepareStatement(sql);
			ps.setInt(1, id);
			ps.execute();
		}catch(Exception e) {
			System.out.println("댓글삭제오류"+e.toString());
		}
	}
	//댓글 등록
	public void insert(CommentVO vo) {
		try {
			String sql = "insert into comments(body, postid, writer) values(?,?,?)";
			PreparedStatement ps = DB.CON.prepareStatement(sql);
			ps.setString(1, vo.getBody());
			ps.setInt(2, vo.getPostid());
			ps.setString(3, vo.getWriter());
			ps.execute();
		}catch(Exception e) {
			System.out.println("댓글등록오류"+e.toString());
		}
	}
	//특정 게시글 댓글수
	public int total(int postid) {
		int total = 0;
		try {
			String sql = "select count(*) total from comments where postid=?";
			PreparedStatement ps = DB.CON.prepareStatement(sql);
			ps.setInt(1, postid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				total = rs.getInt("total");
			}
		}catch(Exception e) {
			System.out.println("게시글수오류"+e.toString());
		}
		return total;
	}
	//댓글목록
	public ArrayList<CommentVO> list(int postid, int page, int size){
		ArrayList<CommentVO> array = new ArrayList<CommentVO>();
		try {
			String sql = "select * from comments where postid=? order by id desc limit ?,?";
			PreparedStatement ps = DB.CON.prepareStatement(sql);
			ps.setInt(1, postid);
			ps.setInt(2, (page-1)*size);
			ps.setInt(3, size);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setId(rs.getInt("id"));
				vo.setBody(rs.getString("body"));
				vo.setWriter(rs.getString("writer"));
				vo.setDate(rs.getTimestamp("date"));
				System.out.println(vo.toString());
				array.add(vo);
			}
		}catch(Exception e) {
			System.out.println("댓글출력오류"+e.toString());
		}
		return array;
	}
}
