package board;

import java.sql.Timestamp;

public class BoardBean {
	private int bs_id;
	private String bs_name;
	private String bs_email;
	private String bs_title;
	private String bs_content;
	private String bs_pwd;
	private Timestamp bs_date;
	private int bs_hit;
	private String bs_ip;
	private int bs_ref;
	private int bs_step;
	private int bs_level;
	public static int pageSize = 10;
	public static int pageCount = 1;
	public static int pageNum = 1;
	private String bs_fname;
	private int bs_fsize;
	private String bs_rfname;

	public int getbs_id() {
		return bs_id;
	}

	public void setbs_id(int bs_id) {
		this.bs_id = bs_id;
	}

	public String getbs_name() {
		return bs_name;
	}

	public void setbs_name(String bs_name) {
		this.bs_name = bs_name;
	}

	public String getbs_email() {
		return bs_email;
	}

	public void setbs_email(String bs_email) {
		this.bs_email = bs_email;
	}

	public String getbs_title() {
		return bs_title;
	}

	public void setbs_title(String bs_title) {
		this.bs_title = bs_title;
	}

	public String getbs_content() {
		return bs_content;
	}

	public void setbs_content(String bs_content) {
		this.bs_content = bs_content;
	}

	public String getbs_pwd() {
		return bs_pwd;
	}

	public void setbs_pwd(String bs_pwd) {
		this.bs_pwd = bs_pwd;
	}

	public Timestamp getbs_date() {
		return bs_date;
	}

	public void setbs_date(Timestamp bs_date) {
		this.bs_date = bs_date;
	}

	public int getbs_hit() {
		return bs_hit;
	}

	public void setbs_hit(int bs_hit) {
		this.bs_hit = bs_hit;
	}

	public String getbs_ip() {
		return bs_ip;
	}

	public void setbs_ip(String bs_ip) {
		this.bs_ip = bs_ip;
	}

	public int getbs_ref() {
		return bs_ref;
	}

	public void setbs_ref(int bs_ref) {
		this.bs_ref = bs_ref;
	}

	public int getbs_step() {
		return bs_step;
	}

	public void setbs_step(int bs_step) {
		this.bs_step = bs_step;
	}

	public int getbs_level() {
		return bs_level;
	}

	public void setbs_level(int bs_level) {
		this.bs_level = bs_level;
	}

	public static int getPageSize() {
		return pageSize;
	}

	public static void setPageSize(int pageSize) {
		BoardBean.pageSize = pageSize;
	}

	public static int getPageCount() {
		return pageCount;
	}

	public static void setPageCount(int pageCount) {
		BoardBean.pageCount = pageCount;
	}

	public static int getPageNum() {
		return pageNum;
	}

	public static void setPageNum(int pageNum) {
		BoardBean.pageNum = pageNum;
	}

	public String getbs_fname() {
		return bs_fname;
	}

	public void setbs_fname(String bs_fname) {
		this.bs_fname = bs_fname;
	}

	public int getbs_fsize() {
		return bs_fsize;
	}

	public void setbs_fsize(int bs_fsize) {
		this.bs_fsize = bs_fsize;
	}

	public String getbs_rfname() {
		return bs_rfname;
	}

	public void setbs_rfname(String bs_rfname) {
		this.bs_rfname = bs_rfname;
	}

	public static String pageNumber(int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp; //pageNum - (pageNum - 1) % limit
		
		if((startPage - limit) > 0) {
			str="<a href='hsbo0101R.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if (i == pageNum) {
				str+="["+i+"]&nbsp;&nbsp;";
			}else {
				str+="<a href='hsbo0101R.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='hsbo0101R.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	
	
}
