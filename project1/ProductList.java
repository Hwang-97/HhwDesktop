package project1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;


public class ProductList {
	
	public static ArrayList<Product> productList;
	private static Random rnd = new Random();
	private static String pathProduct = ".\\src\\project1\\상품 데이터.txt";			//상품 데이터 저장 경로
	private static String pathCategory1 = ".\\src\\project1\\카테고리1 데이터.txt";		//카테고리1 데이터 저장 경로
	private static String pathCategory2 = ".\\src\\project1\\카테고리2 데이터.txt";		//카테고리2 데이터 저장 경로
	//TODO ***덤프 카테고리1, 2 전체 목록은 아래에 기입***
	public static String[] CName1= {"모니터","노트북","마우스","키보드","헤드셋","핸드폰"}; //더미 카테고리
	public static String[] CName2= {"삼성","Apple","로지텍","LG","MSI","ASUS"}; //더미 카테고리
/*
	// 2차 카테고리
	// 모든 2차카테고리ArrayList를 저장하는 ArrayList
	public static ArrayList<ArrayList> allCategory;
	
	// allCategory에 저장되는 2차카테고리 ArrayList
	public static ArrayList<String> categoryMonitor;	 
	public static ArrayList<String> categoryNotebook;
	public static ArrayList<String> categoryMouse;
	public static ArrayList<String> categoryKeyboard;
	public static ArrayList<String> categoryHeadset;
	public static ArrayList<String> categoryPhone;
	
	//TODO 위 2차 카테고리 ArrayList에 저장되는 배열(여기서 2차 카테고리 수정)
	public static String[] arrayMonitor= {"LG","MSI","삼성","한성컴퓨터"};
	public static String[] arrayNotebook= {"Apple","ASUS","LG","MSI","삼성"};
	public static String[] arrayMouse= {"ABKO","ASUS","DECK","MicroSoft","RAZER","로지텍"};
	public static String[] arrayKeyboard= {"ABKO","DECK","RAZER","삼성","LG","한성컴퓨터"};
	public static String[] arrayHeadset= {"LG","SONY","로지텍","베이어다이나믹","삼성"};
	public static String[] arrayPhone= {"삼성","Apple"};
*/	
	static {
		productList=new ArrayList<Product>();
/*
		for (int i = 0; i < arrayMonitor.length; i++) {
			categoryMonitor.add(arrayMonitor[i]);
		}
		for (int i = 0; i < arrayNotebook.length; i++) {
			categoryNotebook.add(arrayNotebook[i]);
		}
		for (int i = 0; i < arrayMouse.length; i++) {
			categoryMouse.add(arrayMouse[i]);
		}
		for (int i = 0; i < arrayKeyboard.length; i++) {
			categoryKeyboard.add(arrayKeyboard[i]);
		}
		for (int i = 0; i < arrayHeadset.length; i++) {
			categoryHeadset.add(arrayHeadset[i]);
		}
		for (int i = 0; i < arrayPhone.length; i++) {
			categoryPhone.add(arrayPhone[i]);
		}
		allCategory.add(categoryMonitor);
		allCategory.add(categoryNotebook);
		allCategory.add(categoryMouse);
		allCategory.add(categoryKeyboard);
		allCategory.add(categoryHeadset);
		allCategory.add(categoryPhone);
*/		
		try {
			//경로지정
			
			BufferedReader readerP=new BufferedReader(new FileReader(pathProduct));
			BufferedReader readerC1=new BufferedReader(new FileReader(pathCategory1));
			BufferedReader readerC2=new BufferedReader(new FileReader(pathCategory2));
			String line = null;
			
			// ──────────────────데이터 불러오기──────────────────
			//TODO 첫 행 데이터는 스킵
			readerP.readLine();
			while ((line = readerP.readLine()) != null) {
				
				String[] temp = line.split("▶");
				
				Product p= new Product();
				p.setProductNum(Integer.parseInt(temp[0]));
				p.setProductCode(temp[1]);
				p.setProductName(temp[2]);
				p.setProductModel(temp[3]);
				
//				TODO 참고* 나중에 상품목록 출력할 때 아래 구문 참고해서 사용 (숫자 카테고리 > 실제 이름으로 변형하는 구문)
//				p.setProductCategory1(CName1[Integer.parseInt(temp[4])-1]);
//				p.setProductCategory2(CName2[Integer.parseInt(temp[5])-1]);
				p.setProductCategory1(temp[4]);
				p.setProductCategory2(temp[5]);
				p.setProductPrice(Integer.parseInt(temp[6]));
				p.setProductStock(Integer.parseInt(temp[7]));
				p.setProductSale(Double.parseDouble(temp[8]));
				p.setProductOrderNum(Integer.parseInt(temp[9]));
				p.setProductRefundNum(Integer.parseInt(temp[10]));
				
				productList.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//static
	
	public static void main(String[] args){
		
//		createProductDump();	//덤프 생성
//		outputAll();			//출력
		
	}//main

	public static void createProductDump() {
		//		──────────────────난수 및 필요 데이터 생성──────────────────
				//상품정보
				String productCode = "";	//상품코드		
				String productName = "";	//상품명		
				String productModel = "";	//모델이름		
				int productPrice = 0;		//가격
				int productStock = 0;		//재고
				double productSale = 0;		//할인율
				int productOrderNum = 0;	//주문횟수
				int productRefundNum = 0;	//환불횟수
				//난수 데이터
				double[] sale= {0,0,0,0,0,0,0,0.05,0.05,0.1};
				int[] price = {100000,200000,250000,300000,450000,500000,800000,900000,1000000,1050000,1210000,1300000,1350000,2000000,3500000,};
				String[] model= {"A모델","B모델","C모델","D모델","E모델","F모델","G모델","H모델"};
				
				//전체 상품 수 카운트는 int count (더미생성for문에서 사용)
				int count=1;
				//같은 카테고리의 카운트는 해쉬맵으로 (상품코드 중간코드 생성에서 사용)
				HashMap<Integer, Integer> categoryCount = new HashMap<Integer, Integer>();
				
				
				
				
				try {
					BufferedWriter writerP = new BufferedWriter(new FileWriter(pathProduct));
					BufferedWriter writerC1 = new BufferedWriter(new FileWriter(pathCategory1));
					BufferedWriter writerC2 = new BufferedWriter(new FileWriter(pathCategory2));
					
					BufferedReader reader = new BufferedReader(new FileReader(pathCategory1));
					
		//			──────────────────카테고리1 데이터.txt 생성──────────────────
					for(int i=0; i<CName1.length; i++) {
						String category = String.format("%d▶%s",i+1,CName1[i]);
						writerC1.write(category);
						writerC1.newLine();
					}
					System.out.println("카테고리1 데이터.txt 생성완료\n");
					writerC1.close();
					
					
					
		//			──────────────────카테고리2 데이터.txt 생성──────────────────
					for(int i=0; i<CName2.length; i++) {
						String category = String.format("%d▶%s",i+1,CName2[i]);
						writerC2.write(category);
						writerC2.newLine();
					}
					System.out.println("카테고리2 데이터.txt 생성완료\n");
					writerC2.close();
					
					
					//#3 상품정보
		//			상품번호		productNum			i+1로 돌림
		//			상품코드		productCode			☆카테고리1(1자리)-카테고리2(1자리)-상품명식별(3자리)-모델식별(1자리)
		//			상품명		productName			카테고리1추출
		//			모델			productModel		모델A~모델H(순차적 생성)
		//			카테고리2		productCategory1	CName1.lenght
		//			카테고리1		productCategory2	CName2.lenght
		//			가격			productPrice		100000~3000000
		//			재고			productStock		0~300
		//			할인율		productSale			0(70%), 0.05(20%), 0.1(10%) 
		//			주문횟수		productOrderNum		20~40
		//			환불횟수		productRefundNum	1~10
		//			상품평점평균	productGradeAvg		0~5
					
					//TODO 아래 첫 행 생성 삭제할 경우 데이터 불러오는 부분 1행 넘기기 취소해야함
					writerP.write("상품번호▶상품코드▶상품명▶모델이름▶카테고리번호▶가격▶재고▶할인율▶주문횟수▶환불횟수\n");
					for (int i = 0; count < 300; i++) {
						// ──────────────────더미값 정의하기──────────────────
						//카테고리 ***카테고리 수에 따라 조정하기***
						int category1=rnd.nextInt(CName1.length)+1;
						int category2=rnd.nextInt(CName2.length)+1;
						
						
						//같은 카테고리 카운트 방식 (상품코드 가운데자리 카운트용)
						if(categoryCount.get(10*category1+category2)==null) 	//맵에 1이 없는 경우
							categoryCount.put(10*category1+category2, 1);
						else 												//맵에 1이 있는 경우
							categoryCount.put(10*category1+category2, categoryCount.get(10*category1+category2)+1);
						
						
						//상품명 -> 카테고리 숫자를 서칭해서 그 카테고리의 기기명에 덧붙임
						String line=null;
						reader = new BufferedReader(new FileReader(pathCategory1));
						while ((line = reader.readLine()) != null) {
							String[] temp= line.split("▶");
							if(category1==Integer.parseInt(temp[0])) {
								productName=temp[1]+categoryCount.get(10*category1+category2);
							}
						}
						//가격
						productPrice=price[rnd.nextInt(price.length)];
						//할인율
						productSale=sale[rnd.nextInt(sale.length)];	
						
						
						
						//아래 포문은 모델 ABC 순차로 넣기 위한 포문 "j<rnd.nextInt(4)+1" <모델 수 랜덤조정
						for(int j=0; j<rnd.nextInt(4)+1; j++) { //현재 모델 수 A~D
							//재고
							productStock=rnd.nextInt(300);
							//주문횟수
							productOrderNum=rnd.nextInt(20)+20;
							//환불횟수
							productRefundNum=rnd.nextInt(9)+1;
							//모델 A부터 순차로 
							productModel=model[j];
							//상품코드☆
							productCode=String.format("%d%d-%03d-%d",category1,category2,categoryCount.get(10*category1+category2),j);
							
							//──────────────────데이터 집어넣기──────────────────
							String product = String.format("%d▶%s▶%s▶%s▶%d▶%d▶%d▶%d▶%.2f▶%d▶%d"
									,count								//상품번호	int
									,productCode						//상품코드	String
									,productName						//상품명		String
									,productModel						//모델이름	String
									,category1							//카테고리1	int
									,category2							//카테고리2	int
									,productPrice						//가격		int
									,productStock						//재고		int
									,productSale						//할인율		double
									,productOrderNum					//주문횟수	int
									,productRefundNum					//환불횟수	int
									);
							writerP.write(product);
							writerP.newLine();
							count++;
						}
						
						
					}
					System.out.println("상품 데이터.txt 생성완료");
					writerP.close();
					reader.close();
					
					
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("오류 createProductDump()");
					e.printStackTrace();
				}
	}//createProductDump()

	private static void outputAll() {
		System.out.println();
		System.out.println("상품번호\t상품코드\t\t상품명\t모델이름\t카테고리1\t카테고리2\t가격\t재고\t할인율\t주문횟수\t환불횟수");
		for (Product p : productList) {
			System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n"
								,p.getProductNum()
								,p.getProductCode()
								,p.getProductName()
								,p.getProductModel()
								,p.getProductCategory1()
								,p.getProductCategory2()
								,p.getProductPrice()
								,p.getProductStock()
								,p.getProductSale()
								,p.getProductOrderNum()
								,p.getProductRefundNum());
		}
	}//outputAll()

} //class ProductDump








