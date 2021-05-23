package kr.co.koo.izone.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class pro_List implements pro_Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ProfessorDBBeaN dao = ProfessorDBBeaN.getInstance();
		List<ProfessorBean> infos = dao.getProInfo();
		request.setAttribute("infos", infos);

	}

}
