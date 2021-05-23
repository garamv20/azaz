package kr.co.koo.izone.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class stu_Update_Service implements stu_Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		StudentDBBean dao = StudentDBBean.getInstance();
		String s_no1 = request.getParameter("s_no");
		int s_no = Integer.parseInt(s_no1);
		String s_pwd = request.getParameter("s_pwd");
		String s_name = request.getParameter("s_name");
		String s_level1 = request.getParameter("s_level");
		int s_level = Integer.parseInt(s_level1);
		String s_email = request.getParameter("s_email");
		String s_tel = request.getParameter("s_tel");
		String s_status1 = request.getParameter("s_status");
		int s_status = Integer.parseInt(s_status1);
		String MAJOR_no1 = request.getParameter("MAJOR_no");
		int MAJOR_no = Integer.parseInt(MAJOR_no1);
		String s_jumin = request.getParameter("s_jumin");
		String s_birth = request.getParameter("s_birth");
		dao.updateSTU(s_no, s_pwd, s_name, s_level, s_birth, s_email, s_tel,
				s_status, MAJOR_no, s_jumin);

	}

}
