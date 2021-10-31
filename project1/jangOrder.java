package project1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

public class jangOrder {
	
	private static String path = ".\\src\\project1\\basket.txt";
	private static String path2 = ".\\src\\project1\\tracking.txt";
	
	
	private static Random rnd;
	private static BufferedWriter bag;	
	private static BufferedWriter writer; 
	private static int productNumber;	//상품 번호 = new Scanner(System.in);
	private static int productQuantity;	//상품별 수량
	
	//private static List<jangOrder> jangList;
	//private static List<jangOrder> baeList;
	
	static {
		rnd = new Random();
		
		//jangList = new ArrayList<jangOrder>();
		//baeList = new ArrayList<jangOrder>();		
		
		try {			
			bag 	//장바구니 더미 데이터 저장 경로
			= new BufferedWriter(new FileWriter(".\\src\\project1\\basket.txt"));
			writer 	//배송 더미 데이터 저장 경로
			= new BufferedWriter(new FileWriter(".\\src\\project1\\tracking.txt"));
			
			BufferedReader readerJ =new BufferedReader(new FileReader(path));
			BufferedReader readeT =new BufferedReader(new FileReader(path2));
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
		
	public static void main(String[] args) throws IOException {
		
		//5조 데이터 설계		//#4
		// 1. 장바구니 데이터
		//	- 회원 번호 : (1~50)
		//	- 상품 번호 : (1~300)	
		//	- 상품별 수량 : (1~5)
		
		// 2. 배송 데이터
		// - 주문 번호 : (1~100까지)
		// - 배송송장번호(날짜조합) : 년월일+회원번호
		// - 배송현황

		// - ▶ 사용하여 구분
				

		
		jang(); //장바구니 더미 데이터
		
		
		
//		orderTrack();//배송 더미 데이터(10월28일자)
		
		
		
	}


	public static void orderTrack() throws IOException {
		
		int[] track = new int[50];
		String[] str = { "배송중", "배송완료", "출고준비" };	//배송현황

		
		String title = "주문번호▶배송송장번호(날짜조합)▶배송현황";
		writer.write(title);
		writer.newLine();// "\r\n"

		for (int i = 0; i < 50; i++) {
			
			int member = i + 1;

			String tra = String.format("%d▶"+/*%s▶*/"%s", member,/* order(),*/ str[rnd.nextInt(str.length)]);

			writer.write(tra);
			writer.newLine();// "\r\n"
		}

		writer.close();
		System.out.println("장바구니 더미 데이터 작성 완료");
		
	}//배송 더미 데이터
	
//	public static String order() {
//		
//		int memberNumber = rnd.nextInt(50) + 1;
//		int year = 2021;	
//		int month = 9; 	//
//		//int month = 10; //10월
//		int date = 28; //28일
//		String invoice = "";
//		
//		Calendar c = Calendar.getInstance();
//		
//		c.set(year, month-1, date);
//		invoice = String.format("%tF", c);		
//		invoice = invoice.replace("-", "");		
//		invoice += String.format("%d", memberNumber);
//	
//		return invoice;
//
//	}//장바구니_송장번호 메소드


	public static void jang() throws IOException {
		
		int[] bask = new int[50];		
		
		
		String title = "회원번호▶상품번호▶상품별수량";
		bag.write(title);			
		bag.newLine();//"\r\n"
		
		for (int i=0; i<50; i++) {
			
			productNumber =rnd.nextInt(300)+1;
			productQuantity = rnd.nextInt(5)+1;
			
			String basket = String.format("%d▶%d▶%d", i+1, productNumber, productQuantity);
			
			bag.write(basket);			
			bag.newLine();//"\r\n"
		}
		
		bag.close();
		System.out.println("배송 더미 데이터 작성 완료");
		
	}//장바구니 더미 데이터
		
		

}//jangOrder
