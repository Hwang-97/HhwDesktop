package project1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class OrderDump {

	private static Random rd;
	private static String path;
	private static int sequence;
	
	static {
		rd = new Random();
		path = ".\\src\\project1\\주문데이터.txt";
		
		sequence=0;
		try {
			// 현재까지의 주문번호를 확인 후 swquence && ArrayList에 저장
			BufferedReader reader = new BufferedReader(new FileReader(path));
			String line =null;
			while((line=reader.readLine())!=null) {
				String[] temp = line.split("▶");
				sequence=Integer.parseInt(temp[0]);
			}
			sequence++;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void writeDump() throws IOException {
		File file = new File(path);
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(path,true));
			if(file.exists()) {
				int count = inputDump();
				String date = inputDate();
				//각각 데이터 입력
				for(int i=0;i<count;i++) {
					int memberNumber =0;
					memberNumber=memberNumber();
					String data = String.format("%d▶%d▶%d▶%d▶%d▶%s▶%s▶%s▶%s▶%b▶%s▶%s"
							, getOrderNumber()
							, getGoodsNumber()
							, memberNumber
							, usePoint()
							, accumulatePoint()
							, getName()
							, getAddress()
							, getPhoneNumber()
							, getSelectPayment()
							, getCancelCheck()
							, String.format("%tF", getDate(date))
							, getInvoiceNumber(memberNumber,String.format("%tF", getDate(date))));
					writer.write(data+"\r\n");
				}
				writer.close();
				System.out.println("완료");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getInvoiceNumber(int memberNumber, String format) {
		String invoice = format.replace("-", "")+String.format("%02d", memberNumber);
		return invoice;
	}

	private static String inputDate() {
		//구매 날짜를 지정
		Scanner scan = new Scanner(System.in);
		System.out.print("구매일 : ");
		String date= scan.nextLine();
		return date;
	}

	private static int inputDump() {
		// 더미데이터의 갯수를 지정
		Scanner scan = new Scanner(System.in);
		System.out.print("dump 갯수 : ");
		int count = Integer.parseInt(scan.nextLine());
		return count;
	}
	
	private static Calendar getDate(String d) {
		// 통계때문에 날짜를 여러가지 입력해야 돼서 입력 받은 날짜를 캘린더 형태로 반환
		d=d.replace("-", "");
		d.trim();
		int year = Integer.parseInt(d.substring(0,4));
		int month = Integer.parseInt(d.substring(4,6));
		int date = Integer.parseInt(d.substring(6));
		
		Calendar c = Calendar.getInstance();
		c.set(year,month-1,date);
		return c;
	}

	private static boolean getCancelCheck() {
		//취소 여부를 boolean으로 반환
		return rd.nextBoolean();
	}

	private static String getSelectPayment() {
		//결제방식을 랜덤으로 출력
		String payment = "";
		String[] paymentArr = {"카드","무통장","핸드폰"};
		payment=paymentArr[rd.nextInt(paymentArr.length)];
		return payment;
	}

	private static String getPhoneNumber() {
		HashSet<String> set = new HashSet<String>();
		//전화번호 set 을 이용하여 동일한 번호가 나오지 않게 설계
		String number = "010-";
		number+=String.format("%04d", rd.nextInt(10000))+"-";
		number+=String.format("%04d", rd.nextInt(10000));
		if(!set.contains(number)) {
			set.add(number);
			return number;
		}else {
			return getPhoneNumber();
		}
	}

	private static String getAddress() {
		//랜덤 주소
		String totalAddress="";
		String[] address1 = {"서울시","제주도","인천시","세종시","광주시","대전시","춘천시"
				,"원주시","강릉시","철원시","화천시","청주시","부산시","대구시","여수시","해남시","울산시","순천시","익산시","군산시","목포시"};
		String[] address2 = {"북구","남구","동구","서구","중구"};
		String[] address3 = {"효자동","교동","후평동","남현동","북동","삼성동","신대방동","청담동"};
		
		totalAddress = address1[rd.nextInt(address1.length)]+" "+address2[rd.nextInt(address2.length)]+" "+address3[rd.nextInt(address3.length)];
		
		if(rd.nextBoolean()) {
			return totalAddress+" "+(rd.nextInt(20)+1)+"번지";
		}else {
			return totalAddress;
		}
	}

	private static String getName() {
		//랜덤 이름
		String name ="";
		char[] nameArr = {'김','이','박','나','곽','황','하','송','최'};
		String[] nameArr2 = {"현수","나연","현우","태은","유선","호연","기태","기호","상범","성경","불경","누리","하늘"};
		name+=nameArr[rd.nextInt(nameArr.length)];
		name+=nameArr2[rd.nextInt(nameArr2.length)];
		return name;
	}
	
	private static int getOrderNumber() {
		//주문 번호
		return sequence++;
	}

	private static int accumulatePoint() {
		//적립 포인트
		return rd.nextInt(50)*100;
	}

	private static int usePoint() {
		//사용한 포인트
		return rd.nextInt(50)*100;
	}
	private static int memberNumber() { 
		// 회원번호를 1~50
		return rd.nextInt(50)+1;
	}
	private static int getGoodsNumber() { 
		// 상품번호를 1~300
		return rd.nextInt(300)+1;
	}
	
	
}

