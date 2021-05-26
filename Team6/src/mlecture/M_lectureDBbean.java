package mlecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import pro.ProDBBean;

public class M_lectureDBbean {
	private static M_lectureDBbean instance = new M_lectureDBbean();

	public static M_lectureDBbean getinstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public ArrayList<M_lectureBean> listKeywords(String selectke, String lecturename) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<M_lectureBean> list = new ArrayList<M_lectureBean>();
		M_lectureBean mltb = null;
		String sql = "";
		try {
			con = getConnection();
			switch (selectke) {
			case "01":
				sql = "select l_no,l_name,l_max from major m , lecture l where m.no = l.major_no and name like ? order by no";
				break;
			case "02":
				sql = "select l_no,l_name,l_max from lecture where l_name like ?";
				break;
			default:
				break;
			}
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + lecturename + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				mltb = new M_lectureBean();
				mltb.setL_no(rs.getInt(1));
				mltb.setL_name(rs.getString(2));
				mltb.setL_max(3);
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

	public ArrayList<M_lectureBean> listlecture() throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<M_lectureBean> list = new ArrayList<M_lectureBean>();
		M_lectureBean mltb = null;
		String sql = "select l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				mltb = new M_lectureBean();
				mltb.setL_no(rs.getInt(1));
				mltb.setL_name(rs.getString(2));
				mltb.setL_level(rs.getInt(3));
				mltb.setL_sem(rs.getInt(4));
				mltb.setL_unit(rs.getInt(5));
				mltb.setL_max(rs.getInt(6));
				mltb.setL_day(rs.getString(7));
				mltb.setL_start(rs.getInt(8));
				mltb.setL_time(rs.getInt(9));
				mltb.setL_com(rs.getString(10));
				mltb.setMajor_no(rs.getInt(11));
				mltb.setProfessor_p_no(rs.getInt(12));
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

	public ArrayList<M_lectureBean> listlecture(int l_no) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<M_lectureBean> list = new ArrayList<M_lectureBean>();
		M_lectureBean mltb = null;
		String sql = "select l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture where l_no=?";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, l_no);
			rs = ps.executeQuery();

			while (rs.next()) {
				mltb = new M_lectureBean();
				mltb.setL_no(rs.getInt(1));
				mltb.setL_name(rs.getString(2));
				mltb.setL_level(rs.getInt(3));
				mltb.setL_sem(rs.getInt(4));
				mltb.setL_unit(rs.getInt(5));
				mltb.setL_max(rs.getInt(6));
				mltb.setL_day(rs.getString(7));
				mltb.setL_start(rs.getInt(8));
				mltb.setL_time(rs.getInt(9));
				mltb.setL_com(rs.getString(10));
				mltb.setMajor_no(rs.getInt(11));
				mltb.setProfessor_p_no(rs.getInt(12));
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

	public int mlecdelete(int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "delete lecture where l_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, l_no);
			ps.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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

	public int mlecinsert(String l_name, int l_level, int l_sem, int l_unit, int l_max, String l_day, int l_start,
			int l_time, int l_com, int major_no, int professor_p_no) {
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		int lno = 0;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "select max(l_no) from lecture";
			ps = con.prepareCall(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				lno = rs.getInt(1);
			}

			sql = "insert into lecture VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, lno + 1);
			ps.setString(2, hancom.toKor(l_name));
			ps.setInt(3, l_level);
			ps.setInt(4, l_sem);
			ps.setInt(5, l_unit);
			ps.setInt(6, l_max);
			ps.setString(7, hancom.toKor(l_day));
			ps.setInt(8, l_start);
			ps.setInt(9, l_time);
			ps.setInt(10, l_com);
			ps.setInt(11, major_no);
			ps.setInt(12, professor_p_no);
			ps.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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

	public int name(String majorname) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		int no = 0;
		try {
			con = getConnection();
			sql = "select no from major where name=?";
			ps = con.prepareCall(sql);
			ps.setString(1, majorname);
			rs = ps.executeQuery();
			if (rs.next()) {
				no = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return no;
	}

	public int updatemale(int l_no, String l_name, int l_level, int l_sem, int l_max, String l_day, int l_start,
			int l_com, int major_no, int professor_p_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update lecture set l_name=?,l_level=?,l_sem=?,l_max=?,l_day=?,l_start=?,l_com=?,major_no=?,professor_p_no=? where l_no=?";
		int re = -1;
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, hancom.toKor(l_name));
			ps.setInt(2, l_level);
			ps.setInt(3, l_sem);
			ps.setInt(4, l_max);
			ps.setString(5, hancom.toKor(l_day));
			ps.setInt(6, l_start);
			ps.setInt(7, l_com);
			ps.setInt(8, major_no);
			ps.setInt(9, professor_p_no);
			ps.setInt(10, l_no);
			ps.executeUpdate();
			re = 1;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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

	public ArrayList<M_lectureBean> majorlist(String name) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<M_lectureBean> list = new ArrayList<M_lectureBean>();
		M_lectureBean mltb = null;
		String sql = "select name,no from major where name like?";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				mltb = new M_lectureBean();
				mltb.setM_name(rs.getString("name"));
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

	public ArrayList<M_lectureBean> profelist(String name) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<M_lectureBean> list = new ArrayList<M_lectureBean>();
		M_lectureBean mltb = null;
		String sql = "select p_name,p_no,m.name from professor p , major m where p.major_no = m.no and p_name like  ?";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				mltb = new M_lectureBean();
				mltb.setP_name(rs.getString(1));
				mltb.setProfessor_p_no(rs.getInt(2));
				mltb.setM_name(rs.getString(3));
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
}
