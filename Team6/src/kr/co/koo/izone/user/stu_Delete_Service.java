package kr.co.koo.izone.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class stu_Delete_Service implements stu_Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		StudentDBBean dao = StudentDBBean.getInstance();
		String s_no = request.getParameter("s_no");
		dao.deleteSTU(Integer.parseInt(s_no));

	}

}
