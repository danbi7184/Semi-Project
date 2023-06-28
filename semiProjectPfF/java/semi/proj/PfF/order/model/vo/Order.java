package semi.proj.PfF.order.model.vo;

import java.sql.Date;

public class Order {
	private long orderNo;
	private int memberNo;
	private String orderPayType;
	private int orderPrice;
	private int orderUsedPoint;
	private int orderEarnPoint;
	private String orderName;
	private String orderHomePhone;
	private String orderPhone;
	private String orderAddress;
	private String orderMessage;
	private Date orderDate;
	
	public Order() {
	}

	public Order(long orderNo, int memberNo, String orderPayType, int orderPrice, int orderUsedPoint,
			int orderEarnPoint, String orderName, String orderHomePhone, String orderPhone, String orderAddress,
			String orderMessage) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.orderPayType = orderPayType;
		this.orderPrice = orderPrice;
		this.orderUsedPoint = orderUsedPoint;
		this.orderEarnPoint = orderEarnPoint;
		this.orderName = orderName;
		this.orderHomePhone = orderHomePhone;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderMessage = orderMessage;
	}

	public long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getOrderPayType() {
		return orderPayType;
	}

	public void setOrderPayType(String orderPayType) {
		this.orderPayType = orderPayType;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getOrderUsedPoint() {
		return orderUsedPoint;
	}

	public void setOrderUsedPoint(int orderUsedPoint) {
		this.orderUsedPoint = orderUsedPoint;
	}

	public int getOrderEarnPoint() {
		return orderEarnPoint;
	}

	public void setOrderEarnPoint(int orderEarnPoint) {
		this.orderEarnPoint = orderEarnPoint;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderHomePhone() {
		return orderHomePhone;
	}

	public void setOrderHomePhone(String orderHomePhone) {
		this.orderHomePhone = orderHomePhone;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderMessage() {
		return orderMessage;
	}

	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", memberNo=" + memberNo + ", orderPayType=" + orderPayType
				+ ", orderPrice=" + orderPrice + ", orderUsedPoint=" + orderUsedPoint + ", orderEarnPoint="
				+ orderEarnPoint + ", orderName=" + orderName + ", orderHomePhone=" + orderHomePhone + ", orderPhone="
				+ orderPhone + ", orderAddress=" + orderAddress + ", orderMessage=" + orderMessage + ", orderDate="
				+ orderDate + "]";
	}
}

