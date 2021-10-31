package project1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MemberList {
	private static String path = ".\\src\\project1\\회원데이터.txt";
	
	public static List<Member> load() throws Exception {
		BufferedReader reader = new BufferedReader(new FileReader(path));
		String line = null;
		List<Member> memberList = new ArrayList<Member>();

		while ((line = reader.readLine()) != null) {
			String[] temp = line.split("▶");

			Member m = new Member();
			m.setMemberNumber(Integer.parseInt(temp[0]));
			m.setName(temp[1]);
			m.setId(temp[2]);
			m.setPw(temp[3]);
			m.setTel(temp[4]);
			m.setGender(temp[5]);
			m.setAddress(temp[6]);
			m.setBirthday(temp[7].split("-")[0]);
			m.setRegistrationNumber(temp[7]);
			m.setMail(temp[8]);
			m.setTotalMoney(Integer.parseInt(temp[9]));
			m.setCurrentPoint(Integer.parseInt(temp[10]));
			m.setTotalPoint(Integer.parseInt(temp[11]));
			m.setSignUp(temp[12]);
			m.setLeave(temp[13]);
			m.setAdmin(temp[14]);
			m.setQuit(temp[15]);
			memberList.add(m);

		}
		reader.close();

		return memberList;
	}
	

	public static void save(List<Member> memberList) throws Exception {
		BufferedWriter writer = new BufferedWriter(new FileWriter(path));
		String temp = "";
		for (Member m : memberList) {
			// 1▶정희연▶qdjp5532▶dq35▶010-2553-2195▶M▶수원시
			// 마마동▶870561-8461357▶qdjp5532gmail.com▶90392▶149▶39419▶22-2-20▶21-10-17▶0▶1▶
			// writer.write("회원번호▶이름▶아이디▶비밀번호▶전화번호▶성별▶주소▶주민번호▶이메일▶누적결제금액▶남은포인트▶누적포인트▶가입일자▶탈퇴일자▶관리자여부▶탈퇴여부\r\n");
			temp += m.getMemberNumber() + "▶" + m.getName() + "▶" + m.getId() + "▶" + m.getPw() + "▶" + m.getTel() + "▶"
					+ m.getGender() + "▶" + m.getAddress() + "▶" + m.getRegistrationNumber() + "▶" + m.getMail() + "▶"
					+ m.getTotalMoney() + "▶" + m.getCurrentPoint() + "▶" + m.getTotalPoint() + "▶" + m.getSignUp()
					+ "▶" + m.getLeave() + "▶" + m.getIsAdmin() + "▶" + m.getisQuit();

			temp += "\r\n";
		}

		writer.write(temp);
		writer.close();
	}

	public static void getMemberDump() throws Exception {
		String path = ".\\src\\project1\\회원데이터.txt";
		BufferedWriter writer = new BufferedWriter(new FileWriter(path));
		String[] name1 = { "김", "이", "박", "최", "정", "강", "주" };
		String[] name2 = { "수", "준", "선", "희", "하", "연", "현" };

		String[] ch = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
				"t", "u", "v", "w", "x", "y", "z" };

		String[] nums = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
		String[] gender = { "M", "F" };
		String[] address1 = { "서울시", "부산", "인천", "대구", "대전", "안산시", "안양시", "수원시", "성남시", "용인시" };
		String[] address2 = { "가가동", "나나동", "다다동", "라라동", "마마동", "바바동", "사사동", "아아동", "자자동" };
		String[] months = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };
		String[] dates = { "" };

		String[] mail = { "naver.com", "gmail.com", "test.com", "dump.com", "java.com" };

		Random rnd = new Random();
		// writer.write("회원번호▶이름▶아이디▶비밀번호▶전화번호▶성별▶주소▶주민번호▶이메일▶누적결제금액▶남은포인트▶누적포인트▶가입일자▶탈퇴일자▶관리자여부▶탈퇴여부\r\n");
		for (int i = 0; i < 50; i++) {
			String temp = "";
			String num = Integer.toString(i + 1) + "▶";
			String name = "" + name1[rnd.nextInt(name1.length)] + name2[rnd.nextInt(name2.length)]
					+ name2[rnd.nextInt(name2.length)] + "▶";
			String id = "" + ch[rnd.nextInt(ch.length)] + ch[rnd.nextInt(ch.length)] + ch[rnd.nextInt(ch.length)]
					+ ch[rnd.nextInt(ch.length)] + nums[rnd.nextInt(nums.length)] + nums[rnd.nextInt(nums.length)]
					+ nums[rnd.nextInt(nums.length)] + nums[rnd.nextInt(nums.length)];

			String pw = "" + ch[rnd.nextInt(ch.length)] + ch[rnd.nextInt(ch.length)] + nums[rnd.nextInt(nums.length)]
					+ nums[rnd.nextInt(nums.length)] + "▶";
			String tel = "010-" + rnd.nextInt(10) + rnd.nextInt(10) + rnd.nextInt(10) + rnd.nextInt(10) + "-"
					+ rnd.nextInt(10) + rnd.nextInt(10) + rnd.nextInt(10) + rnd.nextInt(10) + "▶";
			String gen = gender[rnd.nextInt(gender.length)] + "▶";
			String address = address1[rnd.nextInt(address1.length)] + " " + address2[rnd.nextInt(address2.length)]
					+ (rnd.nextBoolean() ? rnd.nextInt(30) + "번지" : "") + "▶";
			int birthnum = rnd.nextInt(12);
			String registNum = "" + rnd.nextInt(100) + months[birthnum] + rnd.nextInt(27) + 1 + "-" + rnd.nextInt(10)
					+ rnd.nextInt(10) + rnd.nextInt(10) + rnd.nextInt(10) + rnd.nextInt(10) + rnd.nextInt(10)
					+ rnd.nextInt(10) + "▶";
			String email = id + mail[rnd.nextInt(mail.length)] + "▶";
			String money = rnd.nextInt(100000) + "▶";
			boolean flag = rnd.nextBoolean();
			// Calendar c = Calendar.getInstance();

			//
			temp += num;
			temp += name;
			temp += id + "▶";
			temp += pw;
			temp += tel;
			temp += gen;
			temp += address;
			temp += registNum;
			temp += email;
			temp += money;
			temp += rnd.nextInt(1000) + "▶";
			temp += rnd.nextInt(50000) + "▶";
			temp += MemberRandomCalendar() + "▶";
			temp += (flag ? MemberRandomCalendar() : "") + "▶";
			temp += (rnd.nextBoolean() ? "1" : "0") + "▶";
			temp += (flag ? "1" : "0") + "▶";
			temp += "\r\n";
			//
			writer.write(temp);
		}
		writer.close();
		System.out.println("완료");

	}

	private static String MemberRandomCalendar() {
		Random rnd = new Random();
		return (rnd.nextInt(10) + 21) + "-" + (rnd.nextInt(12) + 1) + "-" + (rnd.nextInt(27) + 1);
	}

}
