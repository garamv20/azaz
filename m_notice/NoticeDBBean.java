package m_notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class NoticeDBBean {
	private static NoticeDBBean instance = new NoticeDBBean(); //객체생성
	public static NoticeDBBean getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext(); //dbcp방식 
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertNotice(NoticeBean notice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql =null;
		ResultSet rs = null;
		int number;
		try {
			con = getConnection();
			
			sql = "select max(n_no) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if ((rs.next())) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			sql = "insert into notice(n_no, n_div, n_name, n_email, n_title, n_content, n_pwd, n_date"
					+ ", n_fname, n_fsize, n_rfname) values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setNString(2,notice.getN_div());
			pstmt.setString(3, notice.getN_name());
			pstmt.setString(4, notice.getN_email());
			pstmt.setString(5, notice.getN_title());
			pstmt.setString(6, notice.getN_content());
			pstmt.setString(7, notice.getN_pwd());
			pstmt.setTimestamp(8, notice.getN_date());
			pstmt.setString(9, notice.getN_fname());
			pstmt.setInt(10, notice.getN_fsize());
			pstmt.setString(11, notice.getN_rfname());
			
			
			
			pstmt.executeUpdate();
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
	
	public ArrayList<NoticeBean> listNotice(String pageNumber) {
		ArrayList<NoticeBean> noticeList = new ArrayList<NoticeBean>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet pageSet=null;
		int dbCount = 0; //글의 개수 
		int absolutePage=1;
		
		try {
			con = getConnection();
			
			//매개변수 2개짜리
//			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(n_no) from notice"); //전체글의 개수 구하기 
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close(); 
				stmt.close();
			}
			if(dbCount % NoticeBean.pageSize == 0) {
				NoticeBean.pageCount = dbCount / NoticeBean.pageSize;
			}else {
				NoticeBean.pageCount = dbCount / NoticeBean.pageSize + 1;
			}
			
			if (pageNumber != null) {
				NoticeBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage =(NoticeBean.pageNum-1) * NoticeBean.pageSize +1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "select * from notice order by n_no";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absolutePage); //absolute 지정한 위치로 이동 
				int count = 0;
				
				while(count < NoticeBean.pageSize) {
					NoticeBean notice = new NoticeBean();
					notice.setN_no(rs.getInt(1));
					notice.setN_div(rs.getNString(2));
					notice.setN_name(rs.getString(3));
					notice.setN_email(rs.getString(4));
					notice.setN_title(rs.getString(5));
					notice.setN_content(rs.getString(6));
					notice.setN_pwd(rs.getString(7));
					notice.setN_date(rs.getTimestamp(8));
					notice.setN_hit(rs.getInt(9));
					notice.setN_fname(rs.getString(10));
					notice.setN_fsize(rs.getInt(11));
					notice.setN_rfname(rs.getString(12));
					
					noticeList.add(notice);
					
					if (rs.isLast()) { //결과값 마지막이면 while문 빠져나감 
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
		return noticeList;
	}
	public NoticeBean getNotice(int n_no, boolean hitadd) {
		Connection con = null;
		PreparedStatement pstmtUp = null;
		PreparedStatement pstmt = null;
		String sql =null;
		ResultSet rs = null;
		NoticeBean notice = null;
		
		try {
			con = getConnection();
			if (hitadd == true) {
				sql = "UPDATE notice SET n_hit = n_hit +1 where n_no = ?";
				pstmtUp = con.prepareStatement(sql);
				pstmtUp.setInt(1, n_no);
				pstmtUp.executeUpdate();  //update문 
				pstmtUp.close();
			}
			
			sql = "select * from notice where n_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				notice = new NoticeBean();
				notice.setN_no(rs.getInt(1));
				notice.setN_div(rs.getString(2));
				notice.setN_name(rs.getString(3));
				notice.setN_email(rs.getString(4));
				notice.setN_title(rs.getString(5));
				notice.setN_content(rs.getString(6));
				notice.setN_pwd(rs.getString(7));
				notice.setN_date(rs.getTimestamp(8));
				notice.setN_hit(rs.getInt(9));
				notice.setN_fname(rs.getString(10));
				notice.setN_fsize(rs.getInt(11));
				notice.setN_rfname(rs.getString(12));
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
		return notice;
	}
	
	public int deleteNotice(int n_no, String n_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int re = -1;
		String pwd ="";
		
		try {
			con = getConnection();
			sql = "select n_pwd from notice where n_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				if (!pwd.equals(n_pwd)) {
					re = 0;
				}else {
					sql = "delete notice where n_no = ?"; //from 생략가능 
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, n_no);
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
	
	public int editNotice(NoticeBean notice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int re = -1;
		String pwd ="";
		
		try {
			con = getConnection();
			sql = "select n_pwd from notice where n_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice.getN_no());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(notice.getN_pwd())) { //비밀번호가 다를때
					re = 0;
				}else {
					sql = "update notice set n_div = ?,n_name = ?,n_email = ?,n_title = ?,n_content = ? where n_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(notice.getN_div()));
					pstmt.setString(2, HanConv.toKor(notice.getN_name()));
					pstmt.setString(3, HanConv.toKor(notice.getN_email()));
					pstmt.setString(4, HanConv.toKor(notice.getN_title()));
					pstmt.setString(5, HanConv.toKor(notice.getN_content()));
					pstmt.setInt(6, notice.getN_no());
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
	
	//글번호 받아서 파일정보 
	public NoticeBean getFileName(int n_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		NoticeBean notice = null;
		
		try {
			con = getConnection();
			sql = "select n_fname, n_rfname from notice where n_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				notice = new NoticeBean();
				notice.setN_fname(rs.getString(1));
				notice.setN_rfname(rs.getString(2));
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
		return notice;
	}
}
