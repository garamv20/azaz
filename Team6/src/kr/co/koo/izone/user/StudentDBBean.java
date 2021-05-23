package kr.co.koo.izone.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.koo.izone.util.JdbcUtil;


public class StudentDBBean {
	public static final int LOGIN_SUCCESS = 1;      //濡쒓렇�씤 �꽦怨�
	public static final int LOGIN_FAIL_ID = -1;     //濡쒓렇�씤 �떎�뙣 - �븰踰� �삤瑜�
	public static final int LOGIN_FAIL_PW = 0;      //濡쒓렇�씤 �떎�뙣 - 鍮꾨�踰덊샇 �삤瑜�

	private static StudentDBBean dao = new StudentDBBean();
	private DataSource ds;
	
	private StudentDBBean() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static StudentDBBean getInstance() {
		if (dao == null) {
			dao = new StudentDBBean();
		}
		return dao;
	}
	
	// �븰�깮 �젙蹂� 媛��졇�삤�뒗 硫붿꽌�뱶
	public StudentBean getMemberInfo(int s_no) {      

		StudentBean user = null;

		String sql = "select * from student where s_no=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new StudentBean();
				user.setS_no(rs.getInt("s_no"));
				user.setS_level(rs.getInt("s_level"));
				user.setS_status(rs.getInt("s_status"));
				user.setMAJOR_no(rs.getInt("MAJOR_no"));
				user.setS_pwd(rs.getString("s_pwd"));
				user.setS_name(rs.getString("s_name"));
				user.setS_jumin(rs.getString("s_jumin"));
				user.setS_email(rs.getString("s_email"));
				user.setS_tel(rs.getString("s_tel"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return user;
	}
	
		
		// 濡쒓렇�씤�쓽 �쑀�슚�꽦�쓣 寃�利앺븯�뒗 硫붿꽌�뱶 �꽑�뼵.
		public int userCheck(int s_no, String s_pwd) {
			// �쟾�떖�맂 �젙蹂대�� 諛뷀깢�쑝濡� 濡쒓렇�씤�씠 �쑀�슚�븳吏�瑜� �뙋�젙�븷 �닔 �엳�뒗 JDBC濡쒖쭅 �옉�꽦

			String sql = "select s_pwd from student where s_no=?";

			int result = 0;

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, s_no);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					String dbpw = rs.getString("s_pwd");
					if (dbpw.equals(s_pwd)) { // 濡쒓렇�씤�뿉 �꽦怨듯뻽�쓣�븣!
						result = LOGIN_SUCCESS;
					} else { // 鍮꾨쾲�씠 ���졇�쓣�븣!
						result = LOGIN_FAIL_PW;
					}
				} else { // �븘�씠�뵒媛� 議댁옱�븯吏� �븡�뒗寃쎌슦
					result = LOGIN_FAIL_ID;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			return result;
		}
		
		
	
		// 鍮꾨�踰덊샇 �닔�젙�쓣 �쐞�븳 硫붿꽌�뱶 �꽑�뼵.
		public boolean changePassword(String s_no, String newPwd){
			
			boolean flag = false;
			
			String sql = "update student set s_pwd = ? where s_no = ?";
			Connection conn=null;
			PreparedStatement pstmt =null;
			
			try {
				conn=ds.getConnection();
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, newPwd);
				pstmt.setString(2, s_no);
				
				int i = pstmt.executeUpdate();
				
				if(i==1) {
					flag=true;
				}else {
					flag=false;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
			return flag;
		}
	
		
	
		
		
		//�븰�깮�젙蹂대�� DB�뿉 ���옣�븯�뒗 硫붿꽌�뱶.
		public void write(int s_no, String s_pwd, String s_name, int s_level, String s_jumin, String s_email,
				String s_tel, int s_status, int MAJOR_no) {
			
			String sql = "insert into student values (?,?,?,?,?,?,?,?,?)";
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, s_no);
				pstmt.setString(2, s_pwd);
				pstmt.setString(3, s_name);
				pstmt.setInt(4, s_level);
				pstmt.setString(5, s_jumin);
				pstmt.setString(6, s_tel);
				pstmt.setString(7, s_email);
				pstmt.setInt(8, s_status);
				pstmt.setInt(9, MAJOR_no);

				int i = pstmt.executeUpdate();
				if(i == 1) {
					System.out.println("�젙蹂� �벑濡� �꽦怨�!");
				} else {
					System.out.println("�젙蹂� �벑濡� �떎�뙣!");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
			
		}
		
		
		
		//�븰�깮�젙蹂� 紐⑸줉�쓣 DB濡쒕��꽣 諛쏆븘�삱 硫붿꽌�뱶 �꽑�뼵.
		public List<StudentBean> getStuInfo(){
			
			List<StudentBean> infoList = new ArrayList<>();
			
			String sql = "select * from student order by s_no DESC";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					StudentBean info = new StudentBean(
							rs.getInt("s_no"), 
							rs.getString("s_pwd"),
							rs.getString("s_name"), 
							rs.getInt("s_level"),
							rs.getString("s_jumin"), 	 
							rs.getString("s_email"), 	 
							rs.getString("s_tel"), 	 
							rs.getInt("s_status"),
							rs.getInt("MAJOR_no")
							);
					infoList.add(info);
				}
				
				System.out.println("�븰�깮 �젙蹂� 議고쉶 �셿猷�!");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			
			return infoList;
		}
		
		
		


		//�쉶�썝�젙蹂� �닔�젙�쓣 泥섎━�븯�뒗 硫붿꽌�뱶 - �븰�깮�슜
				public boolean updateSTUDENT(StudentBean stu) {
					boolean flag = false;

					Connection conn = null;
					PreparedStatement pstmt = null;

					String sql = "UPDATE student SET s_pwd=?,s_tel=?, s_email=? WHERE s_no=?";

					try {
						conn = ds.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, stu.getS_pwd());
						pstmt.setString(2, stu.getS_tel());
						pstmt.setString(3, stu.getS_email());
						pstmt.setInt(4, stu.getS_no());

						int i = pstmt.executeUpdate();

						if(i == 1) {
							flag = true;
						}else {
							flag = false;
						}			
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						JdbcUtil.close(conn);
						JdbcUtil.close(pstmt);
					}

					return flag;
				}
		
				//�쉶�썝�젙蹂� �닔�젙�쓣 泥섎━�븯�뒗 硫붿꽌�뱶 - 愿�由ъ옄�슜
				public void updateSTU(int s_no, String s_pwd, String s_name, int s_level, String s_birth, String s_email,
						String s_tel, int s_status, int MAJOR_no, String s_jumin) {
					

					Connection conn = null;
					PreparedStatement pstmt = null;

					String sql = "UPDATE student SET s_pwd=?, s_name=?, s_level=?, s_birth=?, s_email=?, s_tel=?, s_status=?, MAJOR_no=?, s_jumin=? WHERE s_no=?";

					try {
						conn = ds.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, s_pwd);
						pstmt.setString(2, s_name);
						pstmt.setInt(3, s_level);
						pstmt.setString(4, s_birth);
						pstmt.setString(5, s_email);
						pstmt.setString(6, s_tel);
						pstmt.setInt(7, s_status);
						pstmt.setInt(8, MAJOR_no);
						pstmt.setString(9, s_jumin);
						pstmt.setInt(10, s_no);

						pstmt.executeUpdate();

						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						JdbcUtil.close(conn);
						JdbcUtil.close(pstmt);
					}

				}
				
		// �븰�깮�쓽 �젙蹂대�� �궘�젣�븷 硫붿꽌�뱶 �꽑�뼵
				
		public void deleteSTU(int s_no) {
			String sql = "delete from student where s_no = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, s_no);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
			
		}

				
		
		
		
}
