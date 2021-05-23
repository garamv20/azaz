package kr.co.koo.izone.user;

import java.util.*;
import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("*.ga")
public class sui extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public sui() {
        super();        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get요청 발생!! doGet호출!");
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post요청 발생!! doPost호출!");
		doRequest(request, response);
	}

	private void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청위임됨! doRequest호출!!");
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		
		//컨트롤러가 안내해줄 UI페이지의 경로정보를 담을 변수.
		String viewPage = null;
		stu_Service sv = null;
		pro_Service sr = null;
		if(uri.equals("/izone/users/stuList.ga")) {
			sv=new stu_List();
			sv.execute(request, response);
			viewPage = "/users/hmst0101R.jsp";
		} else if(uri.equals("/izone/users/stuWriteView.ga")) {
			viewPage = "/users/hmst0201W.jsp";
		} else if(uri.equals("/izone/users/stuWrtie.ga")) {
			sv = new stu_Write_Service();
			sv.execute(request, response);
			viewPage = "/users/stuList.ga";
		} else if(uri.equals("/izone/users/stuContentView.ga")) {
			sv=new stu_Content_Service();
			sv.execute(request, response);		
			viewPage = "/users/hmst0202W.jsp";
		} else if(uri.equals("/izone/users/stuUpdate.ga")){
			sv = new stu_Update_Service();
			sv.execute(request, response);
			viewPage = "/users/stuList.ga";
		} else if (uri.equals("/izone/users/stuDelete.ga")) {
			sv = new stu_Delete_Service();
			sv.execute(request, response);
			viewPage = "/users/stuList.ga";
		} else if(uri.equals("/izone/users/proList.ga")) {
			sr = new pro_List();
			sr.execute(request, response);
			viewPage ="/users/hmpr0101R.jsp";
		} else if(uri.equals("/izone/users/proWriteView.ga")) {		
			viewPage ="/users/hmpr0201W.jsp";
		} else if(uri.equals("/izone/users/proWrtie.ga")) {
			sr = new pro_Write_Service();
			sr.execute(request, response);
			viewPage ="/users/proList.ga";
		} else if(uri.equals("/izone/users/proContentView.ga")) {
			sr = new pro_Contents_Service();
			sr.execute(request, response);
			viewPage ="/users/hmpr0202W.jsp";
		} else if(uri.equals("/izone/users/proUpdate.ga")) {
			sr = new pro_Update_Service();
			sr.execute(request, response);
			viewPage ="/users/proList.ga";
		} else if(uri.equals("/izone/users/proDelete.ga")) {
			sr = new pro_Delete_Service();
			sr.execute(request, response);
			viewPage ="/users/proList.ga";
		}
	
		
		//페이지 강제이동 forward
		RequestDispatcher dp = request.getRequestDispatcher(viewPage);
		dp.forward(request, response);
		
	}

}



