package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp.PStmtKey;

public class lecture1DBbean {
	// ���� �ð��� ��� �� ���� �����߽��ϴ�.
	private static lecture1DBbean instance = new lecture1DBbean();

	public static lecture1DBbean getinstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	// ��������� ������ ���̽� �����ϴ� �ڵ��Դϴ�.

	// 어레이 리스트를 활용해서 데이터 베이스에 저장 되어 있는 강의테이블에서 불러오는 코드입니다.
	public ArrayList<lecture1bean> listlecture(int majorno) throws Exception {
		// 전공번호를 받아서 그 전공에 맞는 강의 출력
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		lecture1bean llb = null;
		ArrayList<lecture1bean> list = new ArrayList<lecture1bean>();
		String sql = "select l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture where major_no=?";
		// lecture�� �ִ� major_no�� ���� ���� �ҷ�����
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, majorno);
			rs = ps.executeQuery();

			while (rs.next()) {
				llb = new lecture1bean();
				llb.setL_no(rs.getInt(1));
				llb.setL_name(rs.getString(2));
				llb.setL_level(rs.getInt(3));
				llb.setL_sem(rs.getInt(4));
				llb.setL_unit(rs.getInt(5));
				llb.setL_max(rs.getInt(6));
				llb.setL_day(rs.getString(7));
				llb.setL_start(rs.getInt(8));
				llb.setL_time(rs.getInt(9));
				llb.setL_com(rs.getString(10));
				llb.setMajor_no(rs.getInt(11));
				llb.setProfessor_p_no(rs.getInt(12));
				list.add(llb); // ��̸���Ʈ�� ��� �ڵ��Դϴ�.
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

	// 신청버튼을 클릭시 데이터베이스에 넣는코드
	public int insertlecture(int s_no, int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "insert into lecture_a(s_no,l_no) values(?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_no);
			ps.setInt(2, l_no);
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}

	// 학생 번호를 받아 그 학생이 수강하고 있는 걸 불러오는 코드
	public ArrayList<lecture1bean> viewlecture(int s_no) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		lecture1bean llb = null;
		ArrayList<lecture1bean> list = new ArrayList<lecture1bean>();
		String sql = "select l.l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture l,lecture_a a where l.l_no = a.l_no and a.s_no=? order by l.l_no";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_no);
			rs = ps.executeQuery();

			while (rs.next()) {
				llb = new lecture1bean();
				llb.setL_no(rs.getInt(1));
				llb.setL_name(rs.getString(2));
				llb.setL_level(rs.getInt(3));
				llb.setL_sem(rs.getInt(4));
				llb.setL_unit(rs.getInt(5));
				llb.setL_max(rs.getInt(6));
				llb.setL_day(rs.getString(7));
				llb.setL_start(rs.getInt(8));
				llb.setL_time(rs.getInt(9));
				llb.setL_com(rs.getString(10));
				llb.setMajor_no(rs.getInt(11));
				llb.setProfessor_p_no(rs.getInt(12));
				list.add(llb); // ��̸���Ʈ�� ��� �ڵ��Դϴ�.
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

	// 중복 강의가 있는지 확인하는 코드
	public int confirmlecture(int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "select l_no from lecture_a where l_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, l_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			re = -1;
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
			return re;
		}
	}

	// 삭제하는 코드
	public int deletelecture(int s_no, int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "delete lecture_a where s_no=? and l_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_no);
			ps.setInt(2, l_no);
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}

	// 학점계산하는 코드
	public lecture1bean semlecture(int s_no) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		lecture1bean llb = null;
		try {
			con = getConnection();
			sql = "select sum(l_unit) from lecture where l_no in (select l_no from lecture_a where s_no=?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				llb = new lecture1bean();
				llb.setL_sem(rs.getInt(1));
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
		return llb;
	}

	// 수강인원이 추가되면 수강인원 마이너스하기
	public int maxlecture(int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "UPDATE lecture SET l_max = l_max-1 where l_no=?";
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

	// 수강취소햇을경우 다시 인원수를 돌리기위한 코드
	public int maxlecture2(int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "UPDATE lecture SET l_max = l_max+1 where l_no=?";
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
}
