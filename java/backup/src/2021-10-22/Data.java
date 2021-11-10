package test.java.projct;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Random;

public class Data {

	public static void main(String[] args) throws Exception {
		// Data.java
		//-javaTst> data
		//-형식 : 번호, 이름 ,성별, 나이 ,연락처,주소
		
		//회원 > 100명 추가하기
		
		Random rnd = new Random();
		String[] name1 = {"김","이","박","하","황","국","최","정","강","주","한","심","유"};
		String[] name2 = {"수","준","선","희","하","연","현","연","경","성","재","경","현","우","형","석","재","유"};
		
		String[] address1 = {"서울시","인천시","부산시","대전시","광주시"};
		String[] address2 = {"중구","북구","남구","서구","동구"};
		String[] address3 = {"역삼동","대치동","천호동","둔촌동","풍납동"};
		
		BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\HHW\\class\\java\\test\\member.dat"));
		
		for(int i=0; i<100; i++) {
			
			String member = String .format("%3d,%s,%d,%s,%s,%s"
					, i+1
					, name1[rnd.nextInt(name1.length)]+name2[rnd.nextInt(name2.length)]+name2[rnd.nextInt(name2.length)]
					,rnd.nextInt(80)+20
					,rnd.nextBoolean()?"M":"F"
					,"010-"+(rnd.nextInt(9000)+1000)+"-"+(rnd.nextInt(9000)+1000)
					,address1[rnd.nextInt(address1.length)]+" "+
					address2[rnd.nextInt(address2.length)]+" "+
					address2[rnd.nextInt(address2.length)]+" "+(rnd.nextBoolean()?(rnd.nextInt(30)+10)+"번지":""));
			writer.write(member);
			writer.newLine();
		}
		
		writer.close();
		System.out.println("더미 완성");
		
		
		
		
		
	}//main

}
