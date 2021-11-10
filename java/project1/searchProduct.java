package project1;

import java.util.Scanner;
import com.ShopingElectronics.data.*;

public class searchProduct {
	private static Scanner scan = new Scanner(System.in);
	
//	public static void main(String[] args) {
//		
//		int searchCategory1;
//		int searchCategory2;
//		
//		printProductList();
//		showProductList();
//		menuCategoryList(ProductList.CName1);
//		searchCategory1=inputCategoryNum();
//		menuCategoryList(ProductList.CName2);
//		searchCategory2=inputCategoryNum();
//		showProductList(searchCategory1, searchCategory2);
//		
//	}

	private static int inputCategoryNum() {
		
		// 메인 – 로그인 – 회원 – 아이디입력/비밀번호입력 – 상품조회
		// 사용자에게 menuCategoryList()를 통해 카테고리 메뉴목록을 출력하고 이 메소드를 통해 값을 입력받음
		
		while (true) {
			try {
				int input = scan.nextInt();
				if (input >= 0 && input <= ProductList.CName1.length) {
					return input;
				} else {
					throw new Exception();
				}
			} catch (Exception e) {
				System.out.println("다시 입력하세요.\n");
				System.out.print("조회할 카테고리 입력 > ");
				scan.nextLine();
			}
		}
		
	}//inputSwitchNum()

	private static void showProductList(int searchCategory1, int searchCategory2) {
		
		// 메인 – 로그인 – 회원 – 아이디입력/비밀번호입력 – 상품조회
		// 전체 상품 리스트 조회 메소드, (카테고리1, 카테고리2)로 서칭가능하게 오버로드
		
		int count=0;
		System.out.println("상품번호\t상품코드\t\t상품명\t모델이름\t카테고리1\t카테고리2\t가격\t재고\t할인율\t주문횟수\t환불횟수");
		for (Product p : ProductList.productList) {
			if(Integer.parseInt(p.getProductCategory1())==searchCategory1 &&
					Integer.parseInt(p.getProductCategory2())==searchCategory2) {
				System.out.printf("%s\t" //상품번호
						+ "%s\t"	//상품코드
						+ "%s\t"	//상품명
						+ "%s\t"	//모델이름
						+ "%s\t"	//카테고리1
						+ "%s\t"	//카테고리2
						+ "%,8d원\t"	//가격
						+ "%s개\t"	//재고
						+ "%s%%\t"	//할인율
						+ "%s회\t"	//주문횟수
						+ "%s회\n"	//환불횟수
						,p.getProductNum()
						,p.getProductCode()
						,p.getProductName()
						,p.getProductModel()
						,p.getProductCategory1Name()
						,p.getProductCategory2Name()
						,p.getProductPrice()
						,p.getProductStock()
						,p.getProductSale()*100
						,p.getProductOrderNum()
						,p.getProductRefundNum());
				count++;
			}
		}
		System.out.printf("\n총 %d개의 상품을 찾았습니다.\n",count);
	}
	
	private static void showProductList() {
		
		// 메인 – 로그인 – 회원 – 아이디입력/비밀번호입력 – 상품조회
		// 전체 상품 리스트 조회 메소드, (카테고리1, 카테고리2)로 서칭가능하게 오버로드
		
		int count=0;
		System.out.println("상품번호\t상품코드\t\t상품명\t모델이름\t카테고리1\t카테고리2\t\t가격\t재고\t할인율\t주문횟수\t환불횟수");
		for (Product p : ProductList.productList) {
			System.out.printf("%s\t" //상품번호
					+ "%s\t"	//상품코드
					+ "%s\t"	//상품명
					+ "%s\t"	//모델이름
					+ "%s\t"	//카테고리1
					+ "%s\t\t"	//카테고리2
					+ "%,8d원\t"	//가격
					+ "%s개\t"	//재고
					+ "%s%%\t"	//할인율
					+ "%s회\t"	//주문횟수
					+ "%s회\n"	//환불횟수
					,p.getProductNum()
					,p.getProductCode()
					,p.getProductName()
					,p.getProductModel()
					,p.getProductCategory1Name()
					,p.getProductCategory2Name()
					,p.getProductPrice()
					,p.getProductStock()
					,p.getProductSale()*100
					,p.getProductOrderNum()
					,p.getProductRefundNum());
			count++;
		}
		System.out.printf("\n총 %d개의 상품을 찾았습니다.\n",count);
	}//showProductList()

	private static void printProductList() {
		
		// 메인 – 로그인 – 회원 – 아이디입력/비밀번호입력 – 상품조회
		
		System.out.println("───────────────── [ 🛒 상품 조회 ] ─────────────────");
		//TODO figlet으로 상품조회 이미지 넣기
		
	}//printProductList()

	private static void menuCategoryList(String[] categoryArray) {
		
		// 메인 – 로그인 – 회원 – 아이디입력/비밀번호입력 – 상품조회
		// ProductList.java에 static으로 선언한 카테고리 배열을 받아와서 목록을 출력하는 메소드
		
		System.out.println("───────────────── [ 카테고리 목록 ] ─────────────────");
		System.out.println("0. 뒤로가기");
		for (int i = 0; i < categoryArray.length; i++) {
			System.out.printf("%d. %s\n",i+1,categoryArray[i]);
		}
		System.out.println("──────────────────────────────────────────────────");
		System.out.print("조회할 카테고리 입력 > ");
		
	}//menuCategoryList(String[] categoryArray)
}
