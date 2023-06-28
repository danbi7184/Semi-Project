package semi.proj.PfF.order.model.vo;

import java.sql.Date;

public class Coupon {
	private int couponNo;
	private int memberNo;
	private String couponName;
	private int couponPrice;
	private Date couponCreateDate;
	private Date couponExpireDate;
	
	public Coupon() {
		super();
	}

	public Coupon(int couponNo, int memberNo, String couponName, int couponPrice, Date couponCreateDate,
			Date couponExpireDate) {
		super();
		this.couponNo = couponNo;
		this.memberNo = memberNo;
		this.couponName = couponName;
		this.couponPrice = couponPrice;
		this.couponCreateDate = couponCreateDate;
		this.couponExpireDate = couponExpireDate;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public int getCouponPrice() {
		return couponPrice;
	}

	public void setCouponPrice(int couponPrice) {
		this.couponPrice = couponPrice;
	}

	public Date getCouponCreateDate() {
		return couponCreateDate;
	}

	public void setCouponCreateDate(Date couponCreateDate) {
		this.couponCreateDate = couponCreateDate;
	}

	public Date getCouponExpireDate() {
		return couponExpireDate;
	}

	public void setCouponExpireDate(Date couponExpireDate) {
		this.couponExpireDate = couponExpireDate;
	}

	@Override
	public String toString() {
		return "Coupon [couponNo=" + couponNo + ", memberNo=" + memberNo + ", couponName=" + couponName
				+ ", couponPrice=" + couponPrice + ", couponCreateDate=" + couponCreateDate + ", couponExpireDate="
				+ couponExpireDate + "]";
	}
	
}