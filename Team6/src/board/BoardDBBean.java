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

public class BoardDBBean {
	private static BoardDBBean instance=new BoardDBBean();
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(BoardBean board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int number;
		
		int id = board.getbs_id();
		int ref = board.getbs_ref();
		int step = board.getbs_step();
		int level = board.getbs_level();
		
		try {
			con = getConnection();
			sql="SELECT MAX(bs_ID) FROM board_s";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				number=rs.getInt(1)+1;
			}else {
				number=1;
			}
			
			if (id != 0) {
				sql="update board_s set bs_step = bs_step + 1 where bs_ref=? and bs_step > ?";
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
			
			sql="insert into board_s(bs_id, bs_name, bs_email, bs_title, bs_content, bs_pwd, bs_date"
					+ ", bs_ip, bs_ref, bs_step, bs_level, bs_fname, bs_fsize, bs_rfname) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println("@@@###sql ===> "+sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
//			pstmt.setString(2, HanConv.toKor(board.getB_name()));
			pstmt.setString(2, board.getbs_name());
			pstmt.setString(3, board.getbs_email());
//			pstmt.setString(4, HanConv.toKor(board.getB_title()));
//			pstmt.setString(5, HanConv.toKor(board.getB_content()));
			pstmt.setString(4, board.getbs_title());
			pstmt.setString(5, board.getbs_content());
			pstmt.setString(6, board.getbs_pwd());
			pstmt.setTimestamp(7, board.getbs_date());
			pstmt.setString(8, board.getbs_ip());
			pstmt.setInt(9, ref);
			pstmt.setInt(10, step);
			pstmt.setInt(11, level);
			pstmt.setString(12, board.getbs_fname());
			pstmt.setInt(13, board.getbs_fsize());
			pstmt.setString(14, board.getbs_rfname());
			
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
	
	public ArrayList<BoardBean> listBoard(String pageNumber){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absoultePage=1;
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			
//			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(bs_id) from board_s");
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if (dbCount % BoardBean.pageSize == 0) {
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			}else {
				BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
			}
			
			if (pageNumber != null) {
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (BoardBean.pageNum-1) * BoardBean.pageSize + 1;
			}
			
//			stmt = con.createStatement();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql="select * from board_s order by bs_ref desc, bs_step asc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				while (count < BoardBean.pageSize) {
					BoardBean board=new BoardBean();
					board.setbs_id(rs.getInt(1));
					board.setbs_name(rs.getString(2));
					board.setbs_email(rs.getString(3));
					board.setbs_title(rs.getString(4));
					board.setbs_content(rs.getString(5));
					board.setbs_pwd(rs.getString(6));
					board.setbs_date(rs.getTimestamp(7));
					board.setbs_hit(rs.getInt(8));
					board.setbs_ip(rs.getString(9));
					board.setbs_ref(rs.getInt(10));
					board.setbs_step(rs.getInt(11));
					board.setbs_level(rs.getInt(12));
					board.setbs_fname(rs.getString(13));
					board.setbs_fsize(rs.getInt(14));
					
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
	
	public BoardBean getBoard(int bid, boolean hitadd) {
		Connection con=null;
		PreparedStatement pstmtUp=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		BoardBean board=null;
		
		try {
			con = getConnection();
			
			if (hitadd==true) {
				sql="update board_s set bs_hit=bs_hit+1 where bs_id=?";
				pstmtUp = con.prepareStatement(sql);
				pstmtUp.setInt(1, bid);
				pstmtUp.executeUpdate();
				pstmtUp.close();
			}
			
			sql="select * from board_s where bs_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board=new BoardBean();
				board.setbs_id(rs.getInt(1));
				board.setbs_name(rs.getString(2));
				board.setbs_email(rs.getString(3));
				board.setbs_title(rs.getString(4));
				board.setbs_content(rs.getString(5));
				board.setbs_pwd(rs.getString(6));
				board.setbs_date(rs.getTimestamp(7));
				board.setbs_hit(rs.getInt(8));
				board.setbs_ip(rs.getString(9));
				board.setbs_ref(rs.getInt(10));
				board.setbs_step(rs.getInt(11));
				board.setbs_level(rs.getInt(12));
				board.setbs_fname(rs.getString(13));
				board.setbs_fsize(rs.getInt(14));
				board.setbs_rfname(rs.getString(15));
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
	
	public int deleteBoard(int bs_id, String bs_pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			con = getConnection();
			sql="select bs_pwd from board_s where bs_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bs_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(bs_pwd)) {
					re=0;
				}else {
					sql="delete board_s where bs_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bs_id);
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
	
	public int ad_deleteBoard(int bs_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			con = getConnection();
			sql="delete board_s where bs_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bs_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bs_id);
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
	
	public int editBoard(BoardBean board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			con = getConnection();
			sql="select bs_pwd from board_s where bs_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getbs_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(board.getbs_pwd())) {
					re=0;
				}else {
					sql="update board_s set bs_name=?, bs_email=?, bs_title=?, bs_content=? where bs_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(board.getbs_name()));
					pstmt.setString(2, HanConv.toKor(board.getbs_email()));
					pstmt.setString(3, HanConv.toKor(board.getbs_title()));
					pstmt.setString(4, HanConv.toKor(board.getbs_content()));
					pstmt.setInt(5, board.getbs_id());
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
	
	public BoardBean getFileName(int bid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		BoardBean board=null;
		
		try {
			con = getConnection();
			sql="select bs_fname, bs_rfname from board_s where bs_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board=new BoardBean();
				board.setbs_fname(rs.getString(1));
				board.setbs_rfname(rs.getString(2));
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




















