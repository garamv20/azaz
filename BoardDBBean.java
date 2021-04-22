package magic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.HanConv;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean(); //객체생성
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext(); //dbcp방식 
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(BoardBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int number;
		try {
			con = getConnection();
			sql = "select max(b_id) from boardt";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if((rs.next())) {
				number = rs.getInt(1) + 1;
			}else {
				number = 1;
			}
			
			sql = "insert into boardt(b_id, b_name, b_email, b_title, b_content, b_pwd, b_date) values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(board.getB_name()));
			pstmt.setString(3, board.getB_email());
			pstmt.setString(4, HanConv.toKor(board.getB_title()));
			pstmt.setString(5, HanConv.toKor(board.getB_content()));
			pstmt.setString(6, board.getB_pwd());
			pstmt.setTimestamp(7, board.getB_date());
			
			pstmt.executeUpdate(); //쿼리실행 
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}
	
	public ArrayList<BoardBean> listBoard(){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			String sql="select * from boardt order by b_id";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				BoardBean board=new BoardBean();
				board.setB_id(rs.getInt(1));
				board.setB_name(rs.getString(2));
				board.setB_email(rs.getString(3));
				board.setB_title(rs.getString(4));
				board.setB_content(rs.getString(5));
				board.setB_pwd(rs.getString(6));
				board.setB_date(rs.getTimestamp(7));
				board.setB_hit(rs.getInt(8));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	//show.jsp에서 사용할때 와 edit.jsp에서 사용할때로 나뉨 
	public BoardBean getBoard(int bid, boolean hitadd) { 
		Connection con = null;
		PreparedStatement pstmtUp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		BoardBean board =null;
		
		try {
			con = getConnection();
			
			if (hitadd == true) {
				sql = "UPDATE boardt SET b_hit = b_hit +1 where b_id = ? ";
				pstmtUp = con.prepareStatement(sql);
				pstmtUp.setInt(1, bid);
				pstmtUp.executeUpdate();  //update문 
				pstmtUp.close();
			}
			
			sql = "select * from boardt where b_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				board = new BoardBean();
				board.setB_id(rs.getInt(1)); //sql데이터 컬럼순서대로 
				board.setB_name(rs.getString(2));
				board.setB_email(rs.getString(3));
				board.setB_title(rs.getString(4));
				board.setB_content(rs.getString(5));
				board.setB_pwd(rs.getString(6));
				board.setB_date(rs.getTimestamp(7));
				board.setB_hit(rs.getInt(8)); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return board;
	}
	
	public int deleteBoard(int b_id, String b_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int re = -1;
		String pwd ="";
		
		try {
			con = getConnection();
			sql = "select b_pwd from boardt where b_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);	//받아온 글번호
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(b_pwd)) {  //비밀번호가 같지않으면? 
					re = 0;
				}else {
					sql = "delete boardt where b_id = ?"; //from 생략가능 
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, b_id);
					pstmt.executeUpdate();
					re = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public int editBoard(BoardBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int re = -1;
		String pwd ="";

		try {
			con = getConnection();
			sql = "select b_pwd from boardt where b_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getB_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(board.getB_pwd())) { //비밀번호가 다를때
					re = 0;
				}else {
					sql = "update boardt set b_name = ?, b_email = ?,b_title = ?,b_content = ? where b_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(board.getB_name()));
					pstmt.setString(2, HanConv.toKor(board.getB_email()));
					pstmt.setString(3, HanConv.toKor(board.getB_title()));
					pstmt.setString(4, HanConv.toKor(board.getB_content()));
					pstmt.setInt(5, board.getB_id());
					pstmt.executeUpdate();
					re = 1;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
}
