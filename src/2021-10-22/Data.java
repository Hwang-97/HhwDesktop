package test.java.projct;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Random;

public class Data {

	public static void main(String[] args) throws Exception {
		// Data.java
		//-javaTst> data
		//-���� : ��ȣ, �̸� ,����, ���� ,����ó,�ּ�
		
		//ȸ�� > 100�� �߰��ϱ�
		
		Random rnd = new Random();
		String[] name1 = {"��","��","��","��","Ȳ","��","��","��","��","��","��","��","��"};
		String[] name2 = {"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"};
		
		String[] address1 = {"�����","��õ��","�λ��","������","���ֽ�"};
		String[] address2 = {"�߱�","�ϱ�","����","����","����"};
		String[] address3 = {"���ﵿ","��ġ��","õȣ��","���̵�","ǳ����"};
		
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
					address2[rnd.nextInt(address2.length)]+" "+(rnd.nextBoolean()?(rnd.nextInt(30)+10)+"����":""));
			writer.write(member);
			writer.newLine();
		}
		
		writer.close();
		System.out.println("���� �ϼ�");
		
		
		
		
		
	}//main

}
