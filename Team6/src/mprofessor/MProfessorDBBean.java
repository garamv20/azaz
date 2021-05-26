package mprofessor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import mlecture.M_lectureBean;

public class MProfessorDBBean {
	private static MProfessorDBBean instance = new MProfessorDBBean();

	public static MProfessorDBBean getinstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public ArrayList<MProfessorBean> prolist() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MProfessorBean> list = new ArrayList<MProfessorBean>();
		String sql = "select p_no,p_name,name,substr(p_jumin,1,6),p_tel,p_email,p_room,major_no from professor p,major m where p.major_no=m.no order by major_no ,p_room";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				MProfessorBean pro = new MProfessorBean();
				pro.setP_no(rs.getInt(1));
				pro.setP_name(rs.getString(2));
				pro.setMajor_name(rs.getString(3));
				pro.setP_jumin(rs.getString(4));
				pro.setP_tel(rs.getString(5));
				pro.setP_email(rs.getString(6));
				pro.setP_room(rs.getString(7));
				pro.setMajor_no(rs.getInt(8));
				list.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		return list;
	}

	public ArrayList<MProfessorBean> listKeywords(String selectke, String lecturename) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MProfessorBean> list = new ArrayList<MProfessorBean>();
		String sql = "";
		try {
			con = getConnection();
			switch (selectke) {
			case "01":
				sql = "select p_no,p_name,name,substr(p_jumin,1,6),p_tel,p_email,p_room,major_no from professor p,major m where p.major_no=m.no and name like ? order by major_no ,p_room";
				break;
			case "02":
				sql = "select p_no,p_name,name,substr(p_jumin,1,6),p_tel,p_email,p_room,major_no from professor p,major m where p.major_no=m.no and p_name like ? order by major_no ,p_room";
				break;
			default:
				break;
			}
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + lecturename + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				MProfessorBean pro = new MProfessorBean();
				pro.setP_no(rs.getInt(1));
				pro.setP_name(rs.getString(2));
				pro.setMajor_name(rs.getString(3));
				pro.setP_jumin(rs.getString(4));
				pro.setP_tel(rs.getString(5));
				pro.setP_email(rs.getString(6));
				pro.setP_room(rs.getString(7));
				pro.setMajor_no(rs.getInt(8));
				list.add(pro);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return list;
	}

	public int insertmpro(String name, String jumin, String tel, String email, String room, int major) {
		Connection con = null;
		Connection con2 = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		String sql = "";
		int p_no = 0;
		int re = -1;
		try {
			con = getConnection();
			sql = "select max(p_no) from professor";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				p_no = rs.getInt(1);
				sql = "insert into professor VALUES(?,?,?,?,?,?,?,?)";
				ps2 = con.prepareStatement(sql);
				ps2.setInt(1, p_no + 1);
				ps2.setString(2, jumin.substring(6));
				ps2.setString(3, hancom.toKor(name));
				ps2.setString(4, jumin);
				ps2.setString(5, hancom.toKor(tel));
				ps2.setString(6, email);
				ps2.setString(7, room);
				ps2.setInt(8, major);
				ps2.executeUpdate();
				re = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
				if (ps2 != null)
					ps2.close();
				if (con2 != null)
					con2.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}

	public ArrayList<MProfessorBean> majorlist(String name) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MProfessorBean> list = new ArrayList<MProfessorBean>();
		MProfessorBean mltb = null;
		String sql = "select name,no from major where name like?";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				mltb = new MProfessorBean();
				mltb.setMajor_name(rs.getString("name"));
				mltb.setMajor_no(rs.getInt("no"));
				list.add(mltb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return list;
	}

	public int deletempro(int p_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql="";
		int re=-1;
		try {
			con = getConnection();
			sql="delete professor where p_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, p_no);
			ps.executeUpdate();
			re=1;
		}catch (Exception e) {
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

	// 수정하기
	public int updatepro(int p_no ,String name, String jumin, String tel, String email, String room, int major) {
		Connection con = null;
		PreparedStatement ps2 = null;
		String sql = "update professor set p_name=?,p_pwd=?, p_jumin=?,p_tel=?,p_email =?,p_room=?,major_no=? where p_no=?";
		int re = -1;
		try {
			con = getConnection();
			ps2 = con.prepareStatement(sql);
			ps2.setString(1, hancom.toKor(name));
			ps2.setString(2, jumin.substring(6));
			ps2.setString(3, jumin);
			ps2.setString(4, hancom.toKor(tel));
			ps2.setString(5, email);
			ps2.setString(6, room);
			ps2.setInt(7, major);
			ps2.setInt(8, p_no);
			ps2.executeUpdate();
			re = 1;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps2 != null)
					ps2.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public ArrayList<MProfessorBean> prolist2(int p_no) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MProfessorBean> list = new ArrayList<MProfessorBean>();
		String sql = "select p_no,p_name,name,p_jumin,p_tel,p_email,p_room,major_no from professor p,major m where p.major_no=m.no and p_no=? order by major_no ,p_room";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, p_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				MProfessorBean pro = new MProfessorBean();
				pro.setP_no(rs.getInt(1));
				pro.setP_name(rs.getString(2));
				pro.setMajor_name(rs.getString(3));
				pro.setP_jumin(rs.getString(4));
				pro.setP_tel(rs.getString(5));
				pro.setP_email(rs.getString(6));
				pro.setP_room(rs.getString(7));
				pro.setMajor_no(rs.getInt(8));
				list.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		return list;
	}
}
