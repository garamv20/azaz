package lecture;

public class ExamBean {
	private int s_no;
	private String s_name;
	private int l_no;
	private int midEx;
	private int finalEx;
	private int task;
	private int total;
	private String score;
	
	public int getS_no() {
		return s_no;
	}
	
	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public int getMidEx() {
		return midEx;
	}
	public void setMidEx(int midEx) {
		this.midEx = midEx;
	}
	public int getFinalEx() {
		return finalEx;
	}
	public void setFinalEx(int finalEx) {
		this.finalEx = finalEx;
	}
	public int getTask() {
		return task;
	}
	public void setTask(int task) {
		this.task = task;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
}

