package project1;

public class Menu {
	public static void Main() {
		printLine("#");
		printTitle("메인");
		print("1. 로그인");
		print("2. 회원 가입");
		print("3. 상품 조회");
		print("4. 배송 조회");
		print("5. 종료");
		printLine(25, "#");
	}

	public static void login() {
		printLine("#");
		printTitle("1. 로그인");
		print("1. 회원");
		print("2. 비회원");
		print("3. 관리자");
		print("4. 아이디 찾기");
		print("5. 비밀번호 찾기");
		printLine("#");
	}

	public static void logout() {
		printLine("#");
		print("로그아웃 되었습니다.");
		print("메인 화면으로 돌아갑니다.");
		printLine();
	}

	public static void memberLoginMenu() {
		printLine();
		printTitle("1. 회원 로그인");
		print("1. 개인 정보");
		print("2. 구매 내역");
		print("3. 장바구니");
		print("4. 상품 조회");
		print("5. 배송 조회");
		print("6. 회원 탈퇴");
		print("7. 로그 아웃");
		printLine();

	}

	public static void memberInfoMenu() {
		printLine();
		printTitle("개인 정보");
		print("0. 뒤로가기");
		print("1. 개인 정보 확인");
		print("2. 개인 정보 수정");
		printLine();
	}

	public static void memberOrderMenu() {
		printLine();
		printTitle("2. 구매 내역");
		print("0. 뒤로 가기");
		print("1. 상세 보기");
	}

	public static void memberOrderInfo() {
		printLine();
		printTitle("1. 상세 보기");
		print("0. 뒤로 가기");
		print("1. 구매 취소");
		print("2. 리뷰 작성");
		printLine();
	}

	public static void memberBasketMenu() {
		printLine();
		printTitle("3. 장바구니");
		print("0. 뒤로 가기");
		print("1. 상세 보기");
		print("2. 초기화");

	}

	public static void memberBasketInfo() {
		printLine();
		print("0. 뒤로 가기");
		print("1. 삭제");
		print("2. 구매");
		printLine();
	}

	public static void noneMemberLoginMenu() {
		printLine();
		printTitle("2. 비회원 로그인");
	}

	public static void adminLoginMenu() {
		printLine();
		printTitle("3. 관리자 로그인");
		print("0. 로그 아웃");
		print("1. 회원 정보 관리");
		print("2. 상품 관리");
		print("3. 통계 보기");
		print("3. 배송 관리");
		print("3. 매출액 조회");
	}

	public static void adminMemberInfoMenu() {
		printLine();
		printTitle("1. 회원 정보 관리");
		print("0. 뒤로 가기");
		print("1. 전체 회원 조회");
		print("2. 개인 회원 조회");
		printLine();
	}

	public static void adminMemberInfoAll() {
		printLine();
		printTitle("1. 전체 회원 조회");
		print("회원번호\t이름\t아이디\t비밀번호");
	}

	public static void adminMemberInfo() {
		printLine();
		printTitle("2. 개인 회원 조회");
		print("회원번호\t이름\t아이디\t비밀번호");
	}

	public static void adminItemMenu() {
		printLine();
		printTitle("2. 상품 관리");
		print("0. 뒤로 가기");
		print("1. 상품 추가");
		print("2. 상품 검색");
		print("3. 전체 상품 조회");
		print("4. 문의 관리");
		printLine();
	}
	public static void adminItemAdd() {
		printLine();
		printTitle("1. 상품 추가");
		System.out.println("정보 입력");
	}
	public static void adminItemSearch() {
		printLine();
		printTitle("2. 상품 검색");
		
	}
	

	public static void itemMenu() {
		printLine();
		printTitle("4. 상품 조회");
		print("1. 컴퓨터");
		print("2. 노트북");
		print(".........");
	}

	public static void deliveryMenu() {
		printLine();
		printTitle("5. 배송 조회");
		print("0. 뒤로 가기");
		print("1. 배송 현환");
		printLine();
	}

	public static void leaveMemberMenu() {
		printLine();
		printTitle("6. 회원 탈퇴");
		print("!@#$");
		printLine();
	}

	private static void printLine(int num, String s) {

		for (int i = 0; i < num; i++) {
			System.out.printf("%s", s);
		}
		System.out.println();
	}

	private static void printLine(String s) {
		printLine(25, s);
	}

	private static void printLine() {
		printLine(25, "#");
	}

	private static void tap(int num) {
		for (int i = 0; i < num; i++) {
			System.out.printf("\t");
		}
	}

	private static void print(int num, String s) {
		tap(num);
		System.out.println(s);
	}

	private static void print(String s) {
		print(1, s);
	}

	private static void printTitle(int num, String s) {
		tap(num);
		System.out.printf("[%s]\r\n", s);
	}

	private static void printTitle(String s) {
		printTitle(1, s);
	}

}
