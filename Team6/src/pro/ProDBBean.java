package pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ProDBBean {
	private static ProDBBean instance = new ProDBBean();
	
	public static ProDBBean getinstance() {
		return instance;
	}
	
	
	
	public Connection getConnection() throws Exception{
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	
	//교수정보 불러오기
	public ProBean listpro(int p_no) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql="select p_no,p_name,substr(p_jumin,1,6),p_tel,p_email,p_room,major_no from professor where p_no=?";
		ProBean pro=null;
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, p_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				pro = new ProBean();
				pro.setP_no(rs.getInt(1));
				pro.setP_name(rs.getString(2));
				pro.setP_jumin(rs.getString(3));
				pro.setP_tel(rs.getString(4));
				pro.setP_email(rs.getString(5));
				pro.setP_room(rs.getString(6));
				pro.setMajor_no(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			} 
		}
		return pro;
	}
	//교수정보 불러오기
	public String majorname(int pmajor) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql="select name from professor p , major m where p.major_no = m.no and p.major_no=?";
		String major ="";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, pmajor);
			rs = ps.executeQuery();
			if(rs.next()) {
				major =rs.getString("name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			} 
		}
		return major;
	}
	//교수정보 불러오기
	public String lecturename(int pno) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql="select l_name from professor p , lecture l where p.p_no = l.professor_p_no and p.p_no=?";
		StringBuffer lecture =new StringBuffer();
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, pno);
			rs = ps.executeQuery();
			while(rs.next()) {
				lecture.append(rs.getString("l_name")+" ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			} 
		}
		return lecture.toString();
	}
	
	//수정하기
	public int updatepro(String tel,String email, int pno) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql="update professor set p_tel=?,p_email =? where p_no=?";
		int re = -1;
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, tel);
			ps.setString(2, email);
			ps.setInt(3, pno);
			ps.executeUpdate();
			re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			} 
		}
		return re;
	}
}
