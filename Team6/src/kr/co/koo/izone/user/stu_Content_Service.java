package kr.co.koo.izone.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class stu_Content_Service implements stu_Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		StudentDBBean dao = StudentDBBean.getInstance();
		String s_no1 = request.getParameter("s_no");
		int s_no = Integer.parseInt(s_no1);
		//dao메서드를 통해  정보를 SELECT해서 리턴 받으세요.
		StudentBean stu = dao.getMemberInfo(s_no);
		//request객체에 조회된 정보를 저장하세요. EL변수: "contents"
		request.setAttribute("info", stu);

	}

}
