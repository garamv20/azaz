<%@page import="lecture.ExamBean"%>
<%@page import="myUtil.HanConv"%>
<%@page import="member.StudentBean"%>
<%@page import="lecture.lecture1bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.ScoreDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int lno = Integer.parseInt(request.getParameter("lno"));
	String lname = HanConv.toKor(request.getParameter("lname"));
	int lsem = Integer.parseInt(request.getParameter("lsem"));
	
	ScoreDBBean db = ScoreDBBean.getInstance();
	ArrayList<StudentBean> studentList = db.getStudentList(lno);
	
	int i, s_no=0, midEx=0, finalEx=0, task=0, total=0;
	String s_name="", score="";
	ArrayList<ExamBean> examList= new ArrayList<ExamBean>();
	ExamBean exam;
	for(i=0; i < studentList.size(); i++){
		StudentBean student = studentList.get(i);
		s_no = student.getS_no();
		s_name = student.getS_name();
		
		if(request.getParameter("midEx"+i).equals("")){
			midEx = 0;
		}else{
			midEx = Integer.parseInt(request.getParameter("midEx"+i));
		}
		if(request.getParameter("finalEx"+i).equals("")){
			finalEx = 0;
		}else{
			finalEx = Integer.parseInt(request.getParameter("finalEx"+i));
		}
		if(request.getParameter("task"+i).equals("")){
			task = 0;
		}else{
			task = Integer.parseInt(request.getParameter("task"+i));
		}
		total = midEx + finalEx + task;
		
		if(total >= 90){
			score = "A";
		}else if(total >= 80){
			score = "B";
		}else if(total >= 70){
			score = "C";
		}else if(total >= 60){
			score = "D";
		}else if(total < 60){
			score = "F";
		}
		
		exam = new ExamBean();
		exam.setS_no(s_no);
		exam.setS_name(s_name);
		exam.setL_no(lno);
		exam.setMidEx(midEx);
		exam.setFinalEx(finalEx);
		exam.setTask(task);
		exam.setTotal(total);
		exam.setScore(score);
		
		examList.add(exam);
	}
	
	if(db.insertExam(examList) == 1){
		response.sendRedirect("hpsc0104W.jsp?lno="+lno+"&lname="+lname);
	}
%>

    				

