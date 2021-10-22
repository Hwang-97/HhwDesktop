package use;

import java.io.File;

public class AddFile {
	
	private static File file = new File ("C:\\HHW\\HhwDesktop");//git 주소
	private static File file2 = new File ("C:\\HHW\\class\\java\\test\\src"); // 생성 날짜 확인 후 나짜 별 파일 을 생성하여 복사
	
	public static void main(String[] args) {

		try {
			if(file.exists()) {
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		

	}

}
