package semi.proj.PfF.common.model.vo;

public class Picture {
	private int pictureNo;
	private String pictureUrl;
	private String originName;
	private String newName;
	private int pictureCategory;
	private int pictureRefBoardNo;
	
	public Picture(int pictureNo, String pictureUrl, String originName, String newName, int pictureCategory,
			int pictureRefBoardNo) {
		super();
		this.pictureNo = pictureNo;
		this.pictureUrl = pictureUrl;
		this.originName = originName;
		this.newName = newName;
		this.pictureCategory = pictureCategory;
		this.pictureRefBoardNo = pictureRefBoardNo;
	}

	public int getPictureNo() {
		return pictureNo;
	}

	public void setPictureNo(int pictureNo) {
		this.pictureNo = pictureNo;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

	public int getPictureCategory() {
		return pictureCategory;
	}

	public void setPictureCategory(int pictureCategory) {
		this.pictureCategory = pictureCategory;
	}

	public int getPictureRefBoardNo() {
		return pictureRefBoardNo;
	}

	public void setPictureRefBoardNo(int pictureRefBoardNo) {
		this.pictureRefBoardNo = pictureRefBoardNo;
	}

	@Override
	public String toString() {
		return "Picture [pictureNo=" + pictureNo + ", pictureUrl=" + pictureUrl + ", originName=" + originName
				+ ", newName=" + newName + ", pictureCategory=" + pictureCategory + ", pictureRefBoardNo="
				+ pictureRefBoardNo + "]";
	}

	
}
