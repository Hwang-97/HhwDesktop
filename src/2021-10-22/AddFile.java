package use;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public class AddFile {
	
	private static String path = "C:\\HHW\\class\\java\\test\\src";
	private static File file = new File (path);//기존
	
	private static Calendar c = Calendar.getInstance();
	private static String date = String.format("%tF", c);

	private static String path2 = "C:\\HHW\\HhwDesktop\\src\\"+date;
	private static File file2 = new File (path2); // 생성 날짜 확인 후 날짜 별 파일 을 생성하여 복사 git 주소
	
	public static void main(String[] args) {
		
		try {
			if(file.exists()) {
				
				File[] dir = file.listFiles();
				
				for(File f : dir) {
					if(f.isFile()) {
						file2.mkdir();
						String name = f.getName();
						File resultFile = new File(path2+"\\"+name);
						String txt = readFile(f);
						writFile(resultFile , txt);
					}
				}
				for(File subdir : dir) {
					if(subdir.isDirectory()) {
						foundFile(subdir);
					}
				}
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("완료");
	}
	private static void foundFile(File file) {
		//재귀함수로 내부 확인.
		File[] dir = file.listFiles();
		
		for(File f : dir) {
			if(f.isFile()) {
				file2.mkdir();
				String name = f.getName();
				File resultFile = new File(path2+"\\"+name);
				String txt = readFile(f);
				writFile(resultFile , txt);
			}
		}
		for(File subdir : dir) {
			if(subdir.isDirectory()) {
				foundFile(subdir);
			}
		}
	}
	
	private static void writFile(File resultFile, String txt) {
		//resultFile 에 txt값을 입력
		
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(resultFile));
			
			writer.write(txt);
			
			writer.close();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}


	public static String readFile(File file2) {
		//기존파일 읽어오기
		String txt = "";
		
		try {
			BufferedReader reader = new BufferedReader(new FileReader(file2));
			String line = null;
			while((line=reader.readLine())!=null) {
				txt+=line+"\r\n";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return txt;
	}

}
