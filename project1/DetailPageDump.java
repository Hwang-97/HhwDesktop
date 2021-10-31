package project1;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

public class DetailPageDump {
	// 상세 페이지 상품 명으로 덤프
	private static String path = ".\\src\\project1\\product";
	public static void dump() {
		File file = new File(path);
		if(file.exists()) {
			try {
				for(int i=1;i<=300;i++) {
					String s= "상품번호 : "+i+"번 상품의 상세정보 입니다."
							+ "blah blah blah";
					BufferedWriter writer = new BufferedWriter(new FileWriter(path+"\\"+i+".txt"));
					writer.write(s);
					writer.close();
				}
				System.out.println("덤프 완료");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			file.mkdir();// 폴더가 없을시 폴더 생성후 다시 실행
			System.out.println("폴더 생성");
			dump();
		}
	}
}
