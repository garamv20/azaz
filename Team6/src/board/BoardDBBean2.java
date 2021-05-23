package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.*;

public class BoardDBBean2 {
	private static BoardDBBean2 instance=new BoardDBBean2();
	public static BoardDBBean2 getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(BoardBean2 board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int number;
		
		int id = board.getBp_id();
		int ref = board.getBp_ref();
		int step = board.getBp_step();
		int level = board.getBp_level();
		
		try {
			con = getConnection();
			sql="SELECT MAX(BP_ID) FROM BOARD_P";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				number=rs.getInt(1)+1;
			}else {
				number=1;
			}
			
			if (id != 0) {
				sql="update board_p set bp_step = bp_step + 1 where bp_ref=? and bp_step > ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				
				step=step+1;
				level=level+1;
			}else {
				ref=number;
				step=0;
				level=0;
			}
			
			sql="insert into board_p(bp_id, bp_name, bp_email, bp_title, bp_content, bp_pwd, bp_date"
					+ ", bp_ip, bp_ref, bp_step, bp_level, bp_fname, bp_fsize, bp_rfname) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println("@@@###sql ===> "+sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
//			pstmt.setString(2, HanConv.toKor(board.getB_name()));
			pstmt.setString(2, board.getBp_name());
			pstmt.setString(3, board.getBp_email());
//			pstmt.setString(4, HanConv.toKor(board.getB_title()));
//			pstmt.setString(5, HanConv.toKor(board.getB_content()));
			pstmt.setString(4, board.getBp_title());
			pstmt.setString(5, board.getBp_content());
			pstmt.setString(6, board.getBp_pwd());
			pstmt.setTimestamp(7, board.getBp_date());
			pstmt.setString(8, board.getBp_ip());
			pstmt.setInt(9, ref);
			pstmt.setInt(10, step);
			pstmt.setInt(11, level);
			pstmt.setString(12, board.getBp_fname());
			pstmt.setInt(13, board.getBp_fsize());
			pstmt.setString(14, board.getBp_rfname());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}
	
	public ArrayList<BoardBean2> listBoard(String pageNumber){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absoultePage=1;
		
		ArrayList<BoardBean2> boardList = new ArrayList<BoardBean2>();
		
		try {
			con = getConnection();
			
//			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(bp_id) from board_p");
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if (dbCount % BoardBean2.pageSize == 0) {
				BoardBean2.pageCount = dbCount / BoardBean2.pageSize;
			}else {
				BoardBean2.pageCount = dbCount / BoardBean2.pageSize + 1;
			}
			
			if (pageNumber != null) {
				BoardBean2.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (BoardBean2.pageNum-1) * BoardBean2.pageSize + 1;
			}
			
//			stmt = con.createStatement();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql="select * from board_p order by bp_ref desc, bp_step asc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				while (count < BoardBean2.pageSize) {
					BoardBean2 board=new BoardBean2();
					board.setBp_id(rs.getInt(1));
					board.setBp_name(rs.getString(2));
					board.setBp_email(rs.getString(3));
					board.setBp_title(rs.getString(4));
					board.setBp_content(rs.getString(5));
					board.setBp_pwd(rs.getString(6));
					board.setBp_date(rs.getTimestamp(7));
					board.setBp_hit(rs.getInt(8));
					board.setBp_ip(rs.getString(9));
					board.setBp_ref(rs.getInt(10));
					board.setBp_step(rs.getInt(11));
					board.setBp_level(rs.getInt(12));
					board.setBp_fname(rs.getString(13));
					board.setBp_fsize(rs.getInt(14));
					
					boardList.add(board);
					
					if (rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					count++;
				}
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
	
	public BoardBean2 getBoard(int bid, boolean hitadd) {
		Connection con=null;
		PreparedStatement pstmtUp=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		BoardBean2 board=null;
		
		try {
			con = getConnection();
			
			if (hitadd==true) {
				sql="update board_p set bp_hit=bp_hit+1 where bp_id=?";
				pstmtUp = con.prepareStatement(sql);
				pstmtUp.setInt(1, bid);
				pstmtUp.executeUpdate();
				pstmtUp.close();
			}
			
			sql="select * from board_p where bp_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board=new BoardBean2();
				board.setBp_id(rs.getInt(1));
				board.setBp_name(rs.getString(2));
				board.setBp_email(rs.getString(3));
				board.setBp_title(rs.getString(4));
				board.setBp_content(rs.getString(5));
				board.setBp_pwd(rs.getString(6));
				board.setBp_date(rs.getTimestamp(7));
				board.setBp_hit(rs.getInt(8));
				board.setBp_ip(rs.getString(9));
				board.setBp_ref(rs.getInt(10));
				board.setBp_step(rs.getInt(11));
				board.setBp_level(rs.getInt(12));
				board.setBp_fname(rs.getString(13));
				board.setBp_fsize(rs.getInt(14));
				board.setBp_rfname(rs.getString(15));
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
	
	public int deleteBoard(int bp_id, String bp_pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			con = getConnection();
			sql="select bp_pwd from board_p where bp_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bp_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(bp_pwd)) {
					re=0;
				}else {
					sql="delete board_p where bp_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bp_id);
					pstmt.executeUpdate();
					re=1;
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
	
	public int ad_deleteBoard(int bp_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			con = getConnection();
			sql="delete board_p where bp_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bp_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bp_id);
				pstmt.executeUpdate();
				re=1;
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
	
	public int editBoard(BoardBean2 board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			con = getConnection();
			sql="select bp_pwd from board_p where bp_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getBp_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(board.getBp_pwd())) {
					re=0;
				}else {
					sql="update board_p set bp_name=?, bp_email=?, bp_title=?, bp_content=? where bp_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(board.getBp_name()));
					pstmt.setString(2, HanConv.toKor(board.getBp_email()));
					pstmt.setString(3, HanConv.toKor(board.getBp_title()));
					pstmt.setString(4, HanConv.toKor(board.getBp_content()));
					pstmt.setInt(5, board.getBp_id());
					pstmt.executeUpdate();
					re=1;
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
	
	public BoardBean2 getFileName(int bid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		BoardBean2 board=null;
		
		try {
			con = getConnection();
			sql="select bp_fname, bp_rfname from board_p where bp_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board=new BoardBean2();
				board.setBp_fname(rs.getString(1));
				board.setBp_rfname(rs.getString(2));
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
}




















