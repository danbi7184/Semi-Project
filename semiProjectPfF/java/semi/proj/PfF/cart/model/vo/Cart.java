package semi.proj.PfF.cart.model.vo;

public class Cart {
	private int cartNo;
	private String optionSize;
	private String optionColor;
	private int cartCount;
	private int productNo;
	private int memberNo;
	private String productName;
	private String productInfo;
	private int productPrice;
	private String productMainPic;
	private int discountRate;
	
	public Cart() {
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getOptionSize() {
		return optionSize;
	}

	public void setOptionSize(String optionSize) {
		this.optionSize = optionSize;
	}

	public String getOptionColor() {
		return optionColor;
	}

	public void setOptionColor(String optionColor) {
		this.optionColor = optionColor;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductMainPic() {
		return productMainPic;
	}

	public void setProductMainPic(String productMainPic) {
		this.productMainPic = productMainPic;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	
	
	
	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", optionSize=" + optionSize + ", optionColor=" + optionColor + ", cartCount="
				+ cartCount + ", productNo=" + productNo + ", memberNo=" + memberNo + ", productName=" + productName
				+ ", productInfo=" + productInfo + ", productPrice=" + productPrice + ", productMainPic="
				+ productMainPic + ", discountRate=" + discountRate + "]";
	}
	
	

	
	
	
	

}
