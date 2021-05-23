package kr.co.koo.izone.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class pro_Update_Service implements pro_Service {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ProfessorDBBeaN dao = ProfessorDBBeaN.getInstance();
		String p_no = request.getParameter("p_no");
		String p_pwd = request.getParameter("p_pwd");
		String p_name = request.getParameter("p_name");
		String p_birth = request.getParameter("p_birth");
		String p_tel = request.getParameter("p_tel");
		String p_email = request.getParameter("p_email");
		String p_room = request.getParameter("p_room");
		String MAJOR_no = request.getParameter("MAJOR_no");
		dao.updatePro(Integer.parseInt(p_no), p_pwd, p_name, p_birth, p_tel, p_email, p_room, Integer.parseInt(MAJOR_no));			
		
	}

}
