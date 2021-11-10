package project1;

public class Product{
//	상품번호		productNum			전역변수로 선언
//	상품코드		productCode			☆카테고리1(1자리)-카테고리2(1자리)-상품명식별(3자리)-모델식별(1자리)
//	상품명		productName			카테고리1추출
//	모델			productModel		모델A~모델H(순차적 생성)
//	카테고리1		productCategory1	CName1.lenght
//	카테고리2		productCategory2	CName2.lenght
//	가격			productPrice		100000~3000000
//	재고			productStock		0~300
//	할인율		productSale			0(70%), 0.05(20%), 0.1(10%) 
//	주문횟수		productOrderNum		20~40
//	환불횟수		productRefundNum	1~10
	private int productNum;
	private String productCode;
	private String productName;
	private String productModel;
	private String productCategory1;
	private String productCategory2;
	private int productPrice;
	private int productStock;
	private double productSale;
	private int productOrderNum;
	private int productRefundNum;
	
	
	
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductModel() {
		return productModel;
	}
	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}
	public String getProductCategory1() {
		return productCategory1;
	}
	public String getProductCategory1Name() {
		return ProductList.CName1[Integer.parseInt(getProductCategory1())-1];
	}
	public void setProductCategory1(String productCategory1) {
		this.productCategory1 = productCategory1;
	}
	public String getProductCategory2() {
		return productCategory2;
	}
	public String getProductCategory2Name() {
		return ProductList.CName2[Integer.parseInt(getProductCategory2())-1];
	}
	public void setProductCategory2(String productCategory2) {
		this.productCategory2 = productCategory2;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public double getProductSale() {
		return productSale;
	}
	public void setProductSale(double productSale) {
		this.productSale = productSale;
	}
	public int getProductOrderNum() {
		return productOrderNum;
	}
	public void setProductOrderNum(int productOrderNum) {
		this.productOrderNum = productOrderNum;
	}
	public int getProductRefundNum() {
		return productRefundNum;
	}
	public void setProductRefundNum(int productRefundNum) {
		this.productRefundNum = productRefundNum;
	}
}
