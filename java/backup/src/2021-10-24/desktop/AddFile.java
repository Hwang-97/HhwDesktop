package use.desktop;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

public class AddFile {
	
	private static String path = "C:\\HHW\\class\\java\\test\\src";
	private static File file = new File (path);//����
	
	private static Calendar c = Calendar.getInstance();
	private static String date = String.format("%tF", c);

	private static String path2 = "C:\\HHW\\HhwDesktop\\src\\"+date;
	private static File file2 = new File (path2); // ���� ��¥ Ȯ�� �� ��¥ �� ���� �� �����Ͽ� ���� git �ּ�
	
	public static void main(String[] args) {
		
		try {
			if(file.exists()) {
				
				File[] dir = file.listFiles();
				
				for(File f : dir) {
					if(f.isFile()) {
						Date d=new Date(f.lastModified());
						String date2 =String.format("%tF", d);// 찾은 파일의 마지막 수정 날짜 확인하여 현제 날짜와 같다면 복사
						String parent = f.getParent().substring(f.getParent().lastIndexOf("\\")+1);
						if(date.equals(date2)) {
							file2.mkdir();
							String name = f.getName();
							File resultFile = new File(path2+"\\"+parent+"\\"+name);
							String txt = readFile(f);
							writFile(resultFile , txt);
						}
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
		System.out.println("�Ϸ�");
	}
	private static void foundFile(File file) {
		//����Լ��� ���� Ȯ��.
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
		//resultFile �� txt���� �Է�
		
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(resultFile));
			
			writer.write(txt);
			
			writer.close();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}


	public static String readFile(File file2) {
		//�������� �о����
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
