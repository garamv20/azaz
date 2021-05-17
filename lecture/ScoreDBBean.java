package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.StudentBean;

public class ScoreDBBean {
	private static ScoreDBBean instance = new ScoreDBBean();
	public static ScoreDBBean getInstance() {
		return instance; 
	}
	
	public Connection getConnection() throws Exception{ //커넥션
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//교수번호로 강의객체 받아오는 메소드 
	public ArrayList<lecture1bean> getLecture(int pno) {
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<lecture1bean> lectureList = new ArrayList<lecture1bean>();
		lecture1bean lecture = null;
		
		try {
			con = getConnection();
			sql = "select * from lecture where professor_p_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lecture = new lecture1bean();
				lecture.setL_no(rs.getInt(1));
				lecture.setL_name(rs.getString(2));
				lecture.setL_level(rs.getInt(3));
				lecture.setL_sem(rs.getInt(4));
				lecture.setL_unit(rs.getInt(5));
				lecture.setL_max(rs.getInt(6));
				lecture.setL_day(rs.getString(7));
				lecture.setL_start(rs.getInt(8));
				lecture.setL_time(rs.getInt(9));
				lecture.setL_com(rs.getString(10));
				lecture.setMajor_no(rs.getInt(11));
				lecture.setProfessor_p_no(rs.getInt(12));
				lectureList.add(lecture);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return lectureList;
	}
	
	//강의번호로 학생목록 조회 
	public ArrayList<StudentBean> getStudentList(int lno) {
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<StudentBean> studentList = new ArrayList<StudentBean>();
		StudentBean student;
		try {
			con = getConnection();
			sql ="select a.s_no, b.s_name from lecture_a a, student b where a.s_no = b.s_no and a.l_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lno);                                                                                                   
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				student = new StudentBean();
				student.setS_no(rs.getInt(1));
				student.setS_name(rs.getString(2));
				studentList.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return studentList;
	}
	
	//exam 테이블에 데이터추가 
	public int insertExam(ArrayList<ExamBean> examList) {
		Connection con = null;	
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();
			for (int i = 0; i < examList.size(); i++) {
				sql = "insert into exam values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);

				ExamBean exam = examList.get(i);
				pstmt.setInt(1, exam.getS_no());
				pstmt.setString(2, exam.getS_name());
				pstmt.setInt(3, exam.getL_no());
				pstmt.setInt(4, exam.getMidEx());
				pstmt.setInt(5, exam.getFinalEx());
				pstmt.setInt(6, exam.getTask());
				pstmt.setInt(7, exam.getTotal());
				pstmt.setString(8, exam.getScore());
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 1;
	}
	
	//exam 점수 목록
	public ArrayList<ExamBean> getExamList(int l_no) {
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<ExamBean> examList = new ArrayList<ExamBean>();
		
		try {
			con = getConnection();
			sql = "select * from exam where l_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, l_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ExamBean exam = new ExamBean();
				exam.setS_no(rs.getInt(1));
				exam.setS_name(rs.getString(2));
				exam.setL_no(rs.getInt(3));
				exam.setMidEx(rs.getInt(4));
				exam.setFinalEx(rs.getInt(5));
				exam.setTask(rs.getInt(6));
				exam.setTotal(rs.getInt(7));
				exam.setScore(rs.getString(8));
				
				examList.add(exam);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return examList;
	}
	
}
