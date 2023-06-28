package semi.proj.PfF.review.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;
	private String reviewStatus;
	private String reviewWriter;
	private int orderNo;
	private String reviewStar;
	private String review_size;
	private String review_color;
	private String review_thick;
	
	public Review(int reviewNo, String reviewTitle, String reviewContent, Date reviewDate, String reviewStatus,
			String reviewWriter, int orderNo, String reviewStar, String review_size, String review_color,
			String review_thick) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewStatus = reviewStatus;
		this.reviewWriter = reviewWriter;
		this.orderNo = orderNo;
		this.reviewStar = reviewStar;
		this.review_size = review_size;
		this.review_color = review_color;
		this.review_thick = review_thick;
	}

	public Review() {
		super();
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getReview_size() {
		return review_size;
	}

	public void setReview_size(String review_size) {
		this.review_size = review_size;
	}

	public String getReview_color() {
		return review_color;
	}

	public void setReview_color(String review_color) {
		this.review_color = review_color;
	}

	public String getReview_thick() {
		return review_thick;
	}

	public void setReview_thick(String review_thick) {
		this.review_thick = review_thick;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewDate=" + reviewDate + ", reviewStatus=" + reviewStatus + ", reviewWriter=" + reviewWriter
				+ ", orderNo=" + orderNo + ", reviewStar=" + reviewStar + ", review_size=" + review_size
				+ ", review_color=" + review_color + ", review_thick=" + review_thick + "]";
	}
	
	
	
}
