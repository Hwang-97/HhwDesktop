package test.java.projct;

import java.io.IOException;
import java.util.Scanner;

import com.github.lalyos.jfiglet.FigletFont;

public class figletTest {
	
	private static Scanner scan;
	
	static {
		scan = new Scanner(System.in);
	}

	public static void main(String[] args) throws IOException {

//		String asciiArt3 = FigletFont.convertOneLine(new File("font/cicket.flf"), "hello");
//		System.out.println(asciiArt3);
		
		String title = FigletFont.convertOneLine("hello");
		System.out.println(title);
		
		boolean loop = true;
		while(loop) {
			
			menu();
			System.out.print("선택:");
			String sel = scan.nextLine();
			
			if(sel.equals("1")) {
				add();
			}else if(sel.equals("2")) {
				list();
			}else {
				System.out.println("종료");
				break;
			}
			
		}


	}

	private static void list() {
		// TODO Auto-generated method stub
		
	}

	private static void add() {
		// TODO Auto-generated method stub
		
	}

	private static void menu() {


		System.out.println("[=======================");
		System.out.println("1. 회원 추가하기");
		System.out.println("2. 회원 목록하기");
		System.out.println("3. 종료");
		System.out.println("[=======================");
	}

}
