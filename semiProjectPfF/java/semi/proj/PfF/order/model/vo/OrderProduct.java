package semi.proj.PfF.order.model.vo;

import java.sql.Date;

public class OrderProduct {
	private int orderPNo;
	private int productNo;
	private String productName;
	private int productPrice;
	private int discountRate;
	private int count;
	private String size;
	private long orderNo;
	private int memberNo;
	private String orderPayType;
	private int orderPrice;
	private String orderAddress;
	private Date orderDate;
	private String productMainPic;
	
	public OrderProduct(int productNo, int count, String size, long orderNo) {
		super();
		this.productNo = productNo;
		this.count = count;
		this.size = size;
		this.orderNo = orderNo;
	}

	public OrderProduct() {
		super();
	}

	public OrderProduct(int orderPNo, int productNo, String productName, int productPrice, int discountRate, int count,
			String size, long orderNo, int memberNo, String orderPayType, int orderPrice, String orderAddress,
			Date orderDate, String productMainPic) {
		super();
		this.orderPNo = orderPNo;
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.discountRate = discountRate;
		this.count = count;
		this.size = size;
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.orderPayType = orderPayType;
		this.orderPrice = orderPrice;
		this.orderAddress = orderAddress;
		this.orderDate = orderDate;
		this.productMainPic = productMainPic;
	}

	public int getOrderPNo() {
		return orderPNo;
	}

	public void setOrderPNo(int orderPNo) {
		this.orderPNo = orderPNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
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

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getProductMainPic() {
		return productMainPic;
	}

	public void setProductMainPic(String productMainPic) {
		this.productMainPic = productMainPic;
	}

	@Override
	public String toString() {
		return "OrderProduct [orderPNo=" + orderPNo + ", productNo=" + productNo + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", discountRate=" + discountRate + ", count=" + count + ", size="
				+ size + ", orderNo=" + orderNo + ", memberNo=" + memberNo + ", orderPayType=" + orderPayType
				+ ", orderPrice=" + orderPrice + ", orderAddress=" + orderAddress + ", orderDate=" + orderDate
				+ ", productMainPic=" + productMainPic + "]";
	}

}

