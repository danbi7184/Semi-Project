package semi.proj.PfF.product.model.vo;

import java.sql.Date;

public class Product {
	private int productNo;
	private String productName;
	private int productPrice;
	private Date resisterationDate;
	private int discountRate;
	private String productInfo;
	private String productType;
	private String productType2;
	private String productMainPic;
	private String productDetailPic1;
	private String productDetailPic2;
	private String productDetailPic3;
	private char productStatus;
	private int buyCount;
	private String size;
	

	public Product() {
		super();
	}

	public Product(int productNo, String productName, int productPrice, Date resisterationDate, int discountRate,
			String productInfo, String productType, String productType2, String productMainPic, String productDetailPic1,
			String productDetailPic2, String productDetailPic3, char productStatus, int buyCount, String size) {
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.resisterationDate = resisterationDate;
		this.discountRate = discountRate;
		this.productInfo = productInfo;
		this.productType = productType;
		this.productType2 = productType2;
		this.productMainPic = productMainPic;
		this.productDetailPic1 = productDetailPic1;
		this.productDetailPic2 = productDetailPic2;
		this.productDetailPic3 = productDetailPic3;
		this.productStatus = productStatus;
		this.buyCount = buyCount;
		this.size = size;
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

	public Date getResisterationDate() {
		return resisterationDate;
	}

	public void setResisterationDate(Date resisterationDate) {
		this.resisterationDate = resisterationDate;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductType2() {
		return productType2;
	}

	public void setProductType2(String producType2) {
		this.productType2 = producType2;
	}

	public String getProductMainPic() {
		return productMainPic;
	}

	public void setProductMainPic(String productMainPic) {
		this.productMainPic = productMainPic;
	}

	public String getProductDetailPic1() {
		return productDetailPic1;
	}

	public void setProductDetailPic1(String productDetailPic1) {
		this.productDetailPic1 = productDetailPic1;
	}

	public String getProductDetailPic2() {
		return productDetailPic2;
	}

	public void setProductDetailPic2(String productDetailPic2) {
		this.productDetailPic2 = productDetailPic2;
	}

	public String getProductDetailPic3() {
		return productDetailPic3;
	}

	public void setProductDetailPic3(String productDetailPic3) {
		this.productDetailPic3 = productDetailPic3;
	}

	public char getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(char productStatus) {
		this.productStatus = productStatus;
	}

	public int getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", resisterationDate=" + resisterationDate + ", discountRate=" + discountRate + ", productInfo="
				+ productInfo + ", productType=" + productType + ", productType2=" + productType2 + ", productMainPic="
				+ productMainPic + ", productDetailPic1=" + productDetailPic1 + ", productDetailPic2="
				+ productDetailPic2 + ", productDetailPic3=" + productDetailPic3 + ", productStatus=" + productStatus
				+ ", buyCount=" + buyCount + ", size=" + size + "]";
	}
	
	
	
	
}