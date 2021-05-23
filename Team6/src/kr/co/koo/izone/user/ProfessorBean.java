package kr.co.koo.izone.user;

public class ProfessorBean {

	private int p_no;
	private String p_pwd;
	private String p_name;
	private String p_birth;
	private String p_tel;
	private String p_email;
	private String p_room;
	private int MAJOR_no;
	
	public ProfessorBean() {
	}

	public ProfessorBean(int p_no, String p_pwd, String p_name, String p_birth, String p_tel, String p_email,
			String p_room, int mAJOR_no) {
		super();
		this.p_no = p_no;
		this.p_pwd = p_pwd;
		this.p_name = p_name;
		this.p_birth = p_birth;
		this.p_tel = p_tel;
		this.p_email = p_email;
		this.p_room = p_room;
		MAJOR_no = mAJOR_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_pwd() {
		return p_pwd;
	}

	public void setP_pwd(String p_pwd) {
		this.p_pwd = p_pwd;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_birth() {
		return p_birth;
	}

	public void setP_birth(String p_birth) {
		this.p_birth = p_birth;
	}

	public String getP_tel() {
		return p_tel;
	}

	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getP_room() {
		return p_room;
	}

	public void setP_room(String p_room) {
		this.p_room = p_room;
	}

	public int getMAJOR_no() {
		return MAJOR_no;
	}

	public void setMAJOR_no(int mAJOR_no) {
		MAJOR_no = mAJOR_no;
	}

	@Override
	public String toString() {
		return "PROFESSORBEAN [p_no=" + p_no + ", p_pwd=" + p_pwd + ", p_name=" + p_name + ", p_birth=" + p_birth
				+ ", p_tel=" + p_tel + ", p_email=" + p_email + ", p_room=" + p_room + ", MAJOR_no=" + MAJOR_no + "]";
	}

	
	
	
	
	
	
}
