package notice;

import java.sql.Timestamp;

public class NoticeBean {
	private int n_no;
	private String n_div;
	private String n_name;
	private String n_email;
	private String n_title;
	private String n_content;
	private String n_pwd;
	private Timestamp n_date;
	private int n_hit;
	public static int pageSize = 10;
	public static int pageCount = 1; //84건일때 9 
	public static int pageNum = 1;
	private String n_fname;
	private int n_fsize;
	private String n_rfname;
	
	
	public static String pageNumber(int limit) { //4페이지씩 표현하기때문에 limit = 4 
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp; //pageNum - (pageNum - 1) % limit
		
		if((startPage - limit) > 0) {
			str="<a href='hmno0103R.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if (i == pageNum) {
				str+="["+i+"]&nbsp;&nbsp;";
			}else {
				str+="<a href='hmno0103R.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='hmno0103R.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_div() {
		return n_div;
	}
	public void setN_div(String n_div) {
		this.n_div = n_div;
	}
	public String getN_name() {
		return n_name;
	}
	public void setN_name(String n_name) {
		this.n_name = n_name;
	}
	public String getN_email() {
		return n_email;
	}
	public void setN_email(String n_email) {
		this.n_email = n_email;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_pwd() {
		return n_pwd;
	}
	public void setN_pwd(String n_pwd) {
		this.n_pwd = n_pwd;
	}
	public Timestamp getN_date() {
		return n_date;
	}
	public void setN_date(Timestamp n_date) {
		this.n_date = n_date;
	}
	public int getN_hit() {
		return n_hit;
	}
	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}

	public String getN_fname() {
		return n_fname;
	}

	public void setN_fname(String n_fname) {
		this.n_fname = n_fname;
	}

	public int getN_fsize() {
		return n_fsize;
	}

	public void setN_fsize(int n_fsize) {
		this.n_fsize = n_fsize;
	}

	public String getN_rfname() {
		return n_rfname;
	}

	public void setN_rfname(String n_rfname) {
		this.n_rfname = n_rfname;
	}
	
	
}
