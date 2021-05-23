package kr.co.koo.izone.user;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class stu_List implements stu_Service {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		StudentDBBean dao = StudentDBBean.getInstance();
		List<StudentBean> infos = dao.getStuInfo();
		request.setAttribute("infos", infos);
	}
	
}


