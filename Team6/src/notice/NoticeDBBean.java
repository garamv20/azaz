package notice;

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
	private static NoticeDBBean instance = new NoticeDBBean(); //媛앹껜�깮�꽦
	public static NoticeDBBean getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext(); //dbcp諛⑹떇 
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
			pstmt.setString(3, HanConv.toKor(notice.getN_name()));
			pstmt.setString(4, notice.getN_email());
			pstmt.setString(5, HanConv.toKor(notice.getN_title()));
			pstmt.setString(6, HanConv.toKor(notice.getN_content()));
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
		int dbCount = 0; //湲��쓽 媛쒖닔 
		int absolutePage=1;
		
		try {
			con = getConnection();
			
			//留ㅺ컻蹂��닔 2媛쒖쭨由�
//			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(n_no) from notice"); //�쟾泥닿��쓽 媛쒖닔 援ы븯湲� 
			
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
			String sql = "select * from notice order by n_no desc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absolutePage); //absolute 吏��젙�븳 �쐞移섎줈 �씠�룞 
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
					
					if (rs.isLast()) { //寃곌낵媛� 留덉�留됱씠硫� while臾� 鍮좎졇�굹媛� 
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
				pstmtUp.executeUpdate();  //update臾� 
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
					sql = "delete notice where n_no = ?"; //from �깮�왂媛��뒫 
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
				
				if (!pwd.equals(notice.getN_pwd())) { //鍮꾨�踰덊샇媛� �떎瑜쇰븣
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
	
	//湲�踰덊샇 諛쏆븘�꽌 �뙆�씪�젙蹂� 
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
	
	//援щ텇:�븰�깮 怨듭��궗�빆 
	public ArrayList<NoticeBean> listStudentNotice(String pageNumber) {
		ArrayList<NoticeBean> noticeList = new ArrayList<NoticeBean>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet pageSet=null;
		int dbCount = 0; //湲��쓽 媛쒖닔 
		int absolutePage=1;
		
		try {
			con = getConnection();
			
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(n_no) from notice where n_div='�븰�깮'"); //�븰�깮湲��쓽 媛쒖닔 援ы븯湲� 
			
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
			String sql = "select * from notice where n_div='�븰�깮' order by n_no desc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absolutePage); //absolute 吏��젙�븳 �쐞移섎줈 �씠�룞 
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
					
					if (rs.isLast()) { //寃곌낵媛� 留덉�留됱씠硫� while臾� 鍮좎졇�굹媛� 
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
	
	//援щ텇:援먯닔 怨듭��궗�빆 
	public ArrayList<NoticeBean> listProfessorNotice(String pageNumber) {
		ArrayList<NoticeBean> noticeList = new ArrayList<NoticeBean>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet pageSet=null;
		int dbCount = 0; //湲��쓽 媛쒖닔 
		int absolutePage=1;
		
		try {
			con = getConnection();
			
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(n_no) from notice where n_div='援먯닔'"); //援먯닔湲��쓽 媛쒖닔 援ы븯湲� 
			
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
			String sql = "select * from notice where n_div='援먯닔' order by n_no desc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absolutePage); //absolute 吏��젙�븳 �쐞移섎줈 �씠�룞 
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
					
					if (rs.isLast()) { //寃곌낵媛� 留덉�留됱씠硫� while臾� 鍮좎졇�굹媛� 
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
}
