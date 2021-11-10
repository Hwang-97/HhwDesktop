package project1;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

public class TrackingDump {
/*
	1. 주문데이터와 사이즈는 동일하게 돌림.
	2. 주문번호에 맞는 주문데이터 불러오기
	3. 송장번호 확인 후 같음면 배송현황도 같아야됨
	
	
*/
	private static String path = ".\\src\\project1\\tracking.txt";
	public static void dump() {
		Random rnd = new Random();
		String[] arr = { "배송중", "배송완료", "출고준비" };
		HashMap<String,String> m = new HashMap<String,String>(); // 키 송장 value 현황
		List<OrderData> list = new ArrayList<OrderData>();
		list = OrderData.getOrderList();
		StringBuilder txt= new StringBuilder();
		for(int i=0;i<list.size();i++) {
			txt.append(i+1);
			txt.append("▶");
			if(m.containsKey(list.get(i).getInvoiceNumber())) {// 존재
				txt.append(m.get(list.get(i).getInvoiceNumber()));
				txt.append("\r\n");
			}else {
				String s=arr[rnd.nextInt(arr.length)];
				m.put(list.get(i).getInvoiceNumber(), s);
				txt.append(s);
				txt.append("\r\n");
			}
		}
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(path));
			writer.write(txt.toString());
			writer.close();
			System.out.println("덤프 완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
