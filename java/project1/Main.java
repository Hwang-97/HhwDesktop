package project1;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

import project1.list.Member;
import project1.list.MemberList;

public class Main {
	
	private static List<Member> login = new ArrayList<Member>();

	public static void main(String[] args) throws Exception {
//		Random rnd =new Random();
//		  String review = new Scanner(System.in).nextLine();
//	      int score = new Scanner(System.in).nextInt();
//	      ContentData.reviewList.add(new Review(ContentData.reviewList.size()+1, ProductList.productList.get(rnd.nextInt(ProductList.productList.size())).getProductCode(), score, review));
//	      ContentData.reviewList.stream().forEach(c->System.out.println(c));
		// 멤버수는 1 증가하고 상품 코드는 랜덤 스코어 & 리뷰는 저장 가능 but list에만 저장된 것이라 프로그램 재 실행시 초기화됨
		
		Scanner scan =new Scanner(System.in);
		System.out.print("ID :");
		String id=scan.nextLine();
		System.out.print("PW :");
		String pw=scan.nextLine();
		
		login(id,pw);
//		login("ipdt6183","ym05");
		
		if(login.get(0).getIsAdmin().equals("1")) {
			//관리자
			System.out.println("관리자 로그인");
		}else {
			//회원
			System.out.println("회원 로그인");
			PurchaseDetailsCheck pdc = new PurchaseDetailsCheck(login.get(0).getMemberNumber());// 회원번호를 받음
			if(pdc.startOrder()) { // 해당 클래스를 종료하면 true 반환
				// 로그인 후 선택 리스트를 출력
				System.out.println("로그인 후 선택창");
			}
			
		}
	}

	private static void login(String id , String pw) throws Exception {
		//로그인 절차
		MemberList member = new MemberList();
		member.load().stream().filter(m->m.getId().equals(id)&&m.getPw().equals(pw)).forEach(m->login.add(m));
		// 통과하는 리스트만 저장
	}
}
