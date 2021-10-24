package test.java.projct;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

import com.github.lalyos.jfiglet.FigletFont;

public class Main {

	private static Scanner scan;

	static {
		scan = new Scanner(System.in);
	}

	private static ArrayList<Member> list = new ArrayList<Member>();

	public static void main(String[] args) throws IOException {
		
		load();

//		String asciiArt3 = FigletFont.convertOneLine(new File("font/cicket.flf"), "hello");
//		System.out.println(asciiArt3);

		String title = FigletFont.convertOneLine("hello");
		System.out.println(title);

		boolean loop = true;
		while (loop) {

			menu();
			System.out.print("선택:");
			String sel = scan.nextLine();

			if (sel.equals("1")) {
				add();
			} else if (sel.equals("2")) {
				list();
			} else {
				System.out.println("종료");
				break;
			}
		}
		save();

	}

	private static void save() throws IOException {
		
		BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\HHW\\class\\java\\test\\member.dat"));
		
		for(Member m : list) {
			
			String line = String.format("%S,%S,%S,%S,%S,%S"
					,m.getSeq()
					,m.getName()
					,m.getAge()
					,m.getGender()
					,m.getTel()
					,m.getAddress());
			writer.write(line);
			writer.newLine();
		}
		writer.close();
		
	}

	private static void load() throws IOException {
		try {

			BufferedReader reader = new BufferedReader(new FileReader("C:\\HHW\\class\\java\\test\\member.dat"));

			String line = null;

			while ((line = reader.readLine()) != null) {

				String[] temp = line.split(",");
				//// 1,김성범,34,남자,010-9834-3492, 서울시 강남구 역삼동 34번지

				Member m = new Member();
				m.setSeq(temp[0]);
				m.setName(temp[1]);
				m.setAge(temp[2]);
				m.setGender(temp[3]);
				m.setTel(temp[4]);
				m.setAddress(temp[5]);

				list.add(m);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

	}

	private static void list() {

		for (Member m : list) {
			System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t\r\n", m.getSeq(), m.getName(), m.getAge(), m.getGender(),
					m.getTel(), m.getAddress());
		}

	}

	private static void add() {
		
		String seq = getSeq();
		System.out.print("이름 입력 : ");
		String name = scan.nextLine();
		System.out.print("나이 입력 : ");
		String age = scan.nextLine();
		System.out.print("성별 입력 : ");
		String gender = scan.nextLine();
		System.out.print("전화번호 입력 : ");
		String tel = scan.nextLine();
		System.out.print("주소 입력 : ");
		String address = scan.nextLine();
		
		Member m = new Member();
		m.setSeq(seq);
		m.setName(name);
		m.setAge(age);
		m.setGender(gender);
		m.setTel(tel);
		m.setAddress(address);
		list.add(m);

	}

	private static String getSeq() {
		return Integer.parseInt(list.get(list.size() - 1).getSeq()) + 1 + "";
	}

	private static void menu() {

		System.out.println("[=======================");
		System.out.println("1. 회원 추가하기");
		System.out.println("2. 회원 목록확인");
		System.out.println("3. 종료");
		System.out.println("[=======================");
	}

}
