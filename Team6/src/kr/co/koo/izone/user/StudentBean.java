package kr.co.koo.izone.user;

public class StudentBean {

	private int s_no;
	private String s_pwd;
	private String s_name;
	private int s_level;
	private String s_jumin;
	private String s_email;
	private String s_tel;
	private int s_status;
	private int MAJOR_no;
	
	public StudentBean(){
	}
	
	

	public StudentBean(int s_no, String s_pwd, String s_name, int s_level, String s_jumin, String s_email, String s_tel,
			int s_status, int MAJOR_no) {
		super();
		this.s_no = s_no;
		this.s_pwd = s_pwd;
		this.s_name = s_name;
		this.s_level = s_level;
		this.s_jumin = s_jumin;
		this.s_email = s_email;
		this.s_tel = s_tel;
		this.s_status = s_status;
		this.MAJOR_no = MAJOR_no;
	}



	public int getS_no() {
		return s_no;
	}



	public void setS_no(int s_no) {
		this.s_no = s_no;
	}



	public String getS_pwd() {
		return s_pwd;
	}



	public void setS_pwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}



	public String getS_name() {
		return s_name;
	}



	public void setS_name(String s_name) {
		this.s_name = s_name;
	}



	public int getS_level() {
		return s_level;
	}



	public void setS_level(int s_level) {
		this.s_level = s_level;
	}



	public String getS_jumin() {
		return s_jumin;
	}



	public void setS_jumin(String s_jumin) {
		this.s_jumin = s_jumin;
	}



	public String getS_email() {
		return s_email;
	}



	public void setS_email(String s_email) {
		this.s_email = s_email;
	}



	public String getS_tel() {
		return s_tel;
	}



	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}



	public int getS_status() {
		return s_status;
	}



	public void setS_status(int s_status) {
		this.s_status = s_status;
	}



	public int getMAJOR_no() {
		return MAJOR_no;
	}



	public void setMAJOR_no(int mAJOR_no) {
		MAJOR_no = mAJOR_no;
	}



	@Override
	public String toString() {
		return "STUDENT_VO [s_no=" + s_no + ", s_pwd=" + s_pwd + ", s_name=" + s_name + ", s_level=" + s_level
				+ ", s_jumin=" + s_jumin + ", s_email=" + s_email + ", s_tel=" + s_tel + ", s_status=" + s_status
				+ ", MAJOR_no=" + MAJOR_no + "]";
	}
	
	
	


	
	
}
