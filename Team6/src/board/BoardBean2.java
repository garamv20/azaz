package board;

import java.sql.Timestamp;

public class BoardBean2 {
	private int bp_id;
	private String bp_name;
	private String bp_email;
	private String bp_title;
	private String bp_content;
	private String bp_pwd;
	private Timestamp bp_date;
	private int bp_hit;
	private String bp_ip;
	private int bp_ref;
	private int bp_step;
	private int bp_level;
	public static int pageSize = 10;
	public static int pageCount = 1;
	public static int pageNum = 1;
	private String bp_fname;
	private int bp_fsize;
	private String bp_rfname;

	public int getBp_id() {
		return bp_id;
	}

	public void setBp_id(int bp_id) {
		this.bp_id = bp_id;
	}

	public String getBp_name() {
		return bp_name;
	}

	public void setBp_name(String bp_name) {
		this.bp_name = bp_name;
	}

	public String getBp_email() {
		return bp_email;
	}

	public void setBp_email(String bp_email) {
		this.bp_email = bp_email;
	}

	public String getBp_title() {
		return bp_title;
	}

	public void setBp_title(String bp_title) {
		this.bp_title = bp_title;
	}

	public String getBp_content() {
		return bp_content;
	}

	public void setBp_content(String bp_content) {
		this.bp_content = bp_content;
	}

	public String getBp_pwd() {
		return bp_pwd;
	}

	public void setBp_pwd(String bp_pwd) {
		this.bp_pwd = bp_pwd;
	}

	public Timestamp getBp_date() {
		return bp_date;
	}

	public void setBp_date(Timestamp bp_date) {
		this.bp_date = bp_date;
	}

	public int getBp_hit() {
		return bp_hit;
	}

	public void setBp_hit(int bp_hit) {
		this.bp_hit = bp_hit;
	}

	public String getBp_ip() {
		return bp_ip;
	}

	public void setBp_ip(String bp_ip) {
		this.bp_ip = bp_ip;
	}

	public int getBp_ref() {
		return bp_ref;
	}

	public void setBp_ref(int bp_ref) {
		this.bp_ref = bp_ref;
	}

	public int getBp_step() {
		return bp_step;
	}

	public void setBp_step(int bp_step) {
		this.bp_step = bp_step;
	}

	public int getBp_level() {
		return bp_level;
	}

	public void setBp_level(int bp_level) {
		this.bp_level = bp_level;
	}

	public static int getPageSize() {
		return pageSize;
	}

	public static void setPageSize(int pageSize) {
		BoardBean2.pageSize = pageSize;
	}

	public static int getPageCount() {
		return pageCount;
	}

	public static void setPageCount(int pageCount) {
		BoardBean2.pageCount = pageCount;
	}

	public static int getPageNum() {
		return pageNum;
	}

	public static void setPageNum(int pageNum) {
		BoardBean2.pageNum = pageNum;
	}

	public String getBp_fname() {
		return bp_fname;
	}

	public void setBp_fname(String bp_fname) {
		this.bp_fname = bp_fname;
	}

	public int getBp_fsize() {
		return bp_fsize;
	}

	public void setBp_fsize(int bp_fsize) {
		this.bp_fsize = bp_fsize;
	}

	public String getBp_rfname() {
		return bp_rfname;
	}

	public void setBp_rfname(String bp_rfname) {
		this.bp_rfname = bp_rfname;
	}

	public static String pageNumber(int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp; //pageNum - (pageNum - 1) % limit
		
		if((startPage - limit) > 0) {
			str="<a href='hpbo0101R.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if (i == pageNum) {
				str+="["+i+"]&nbsp;&nbsp;";
			}else {
				str+="<a href='hpbo0101R.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='hpbo0101R.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	
	
}
