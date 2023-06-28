package semi.proj.PfF.qa.model.vo;

import java.sql.Date;

public class Qa {
	private int qaNo;
	private String qaTitle;
	private String qaContent;
	private Date qaDate;
	private char qaStatus;
	private Integer qaOrderNo;
	private int qaMemberNo;
	private int qaTypeNo;
	
	public Qa() {
	}

	public Qa(int qaNo, String qaTitle, String qaContent, Date qaDate, char qaStatus, Integer qaOrderNo, int qaMemberNo,
			int qaTypeNo) {
		super();
		this.qaNo = qaNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaDate = qaDate;
		this.qaStatus = qaStatus;
		this.qaOrderNo = qaOrderNo;
		this.qaMemberNo = qaMemberNo;
		this.qaTypeNo = qaTypeNo;
	}

	public int getQaNo() {
		return qaNo;
	}

	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public Date getQaDate() {
		return qaDate;
	}

	public void setQaDate(Date qaDate) {
		this.qaDate = qaDate;
	}

	public char getQaStatus() {
		return qaStatus;
	}

	public void setQaStatus(char qaStatus) {
		this.qaStatus = qaStatus;
	}

	public Integer getQaOrderNo() {
		return qaOrderNo;
	}

	public void setQaOrderNo(Integer qaOrderNo) {
		this.qaOrderNo = qaOrderNo;
	}

	public int getQaMemberNo() {
		return qaMemberNo;
	}

	public void setQaMemberNo(int qaMemberNo) {
		this.qaMemberNo = qaMemberNo;
	}

	public int getQaTypeNo() {
		return qaTypeNo;
	}

	public void setQaTypeNo(int qaTypeNo) {
		this.qaTypeNo = qaTypeNo;
	}

	@Override
	public String toString() {
		return "Qa [qaNo=" + qaNo + ", qaTitle=" + qaTitle + ", qaContent=" + qaContent + ", qaDate=" + qaDate
				+ ", qaStatus=" + qaStatus + ", qaOrderNo=" + qaOrderNo + ", qaMemberNo=" + qaMemberNo + ", qaTypeNo="
				+ qaTypeNo + "]";
	}
	
	
}
