package copyTodayFile;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class CopyTodayFile {

	private static String path = ""; // C:\\HHW\\class\\java\\test\\src
	private static File file;// ����
	
	private static Calendar c = Calendar.getInstance();
	private static String date = String.format("%tF", c);
	
	private static String path2 = ""; //C:\\HHW\\HhwDesktop\\src
	private static File file2;// ���� ��¥ Ȯ�� �� ��¥ �� ���� �� �����Ͽ� ���� git �ּ�
	
	private static String selctExtension ="";

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		System.out.print("( From )복사하고 싶은 파일이 있는 경로 : ");
		path = scan.nextLine();
		
		System.out.print("( To )복사하고 싶은 파일 경로 : ");
		path2 = scan.nextLine()+"\\" + date;
		
		System.out.print("복사하고 싶은 파일 확장명 : ");
		selctExtension = scan.nextLine();
		selctExtension.toLowerCase();
		
		file = new File(path);
		file2 = new File(path2);
		
		try {
			if (file.exists()) {

				File[] dir = file.listFiles();

				for (File f : dir) {
					String extension = f.getName().substring(f.getName().lastIndexOf(".")+1);
					extension.toLowerCase();
					if (f.isFile()
							&& extension.equals(selctExtension)) {
						Date d = new Date(f.lastModified());
						String date2 = String.format("%tF", d);// 찾은 파일의 마지막 수정 날짜 확인하여 현제 날짜와 같다면 복사
						String parent = f.getParent().substring(f.getParent().lastIndexOf("\\") + 1);
						if (date.equals(date2)) {
							file2.mkdir();
							File resultFile1 = new File(path2 + "\\" + parent);
							resultFile1.mkdirs();
							String name = f.getName();
							File resultFile2 = new File(path2 + "\\" + parent + "\\" + name);
							String txt = readFile(f);
							writFile(resultFile2, txt);
						}
					}
				}
				for (File subdir : dir) {
					if (subdir.isDirectory()) {
						foundFile(subdir);
					}
				}
				System.out.println("success!!");
				System.out.println("프로그램을 종료하려면 Enter");
				scan.nextLine();
				scan.close();
			}
		} catch (Exception e) {
			System.out.println("fall...[ check your addess OR extension !! ]");
			System.out.println("프로그램을 종료하려면 Enter");
			scan.nextLine();
			scan.close();
			e.printStackTrace();
		}
	}
	

	private static void foundFile(File file) {
		// ����Լ��� ���� Ȯ��.
		File[] dir = file.listFiles();

		for (File f : dir) {
			String extension = f.getName().substring(f.getName().lastIndexOf(".")+1);
			extension.toLowerCase();
			extension.equals(selctExtension);
			if (f.isFile()
					&& extension.equals(selctExtension)) {
				Date d = new Date(f.lastModified());
				String date2 = String.format("%tF", d);// 찾은 파일의 마지막 수정 날짜 확인하여 현제 날짜와 같다면 복사
				String parent = f.getParent().substring(f.getParent().lastIndexOf("\\") + 1);
				if (date.equals(date2)) {
					file2.mkdir();
					File resultFile1 = new File(path2 + "\\" + parent);
					resultFile1.mkdirs();
					String name = f.getName();
					File resultFile2 = new File(path2 + "\\" + parent + "\\" + name);
					String txt = readFile(f);
					writFile(resultFile2, txt);
				}
			}
		}
		for (File subdir : dir) {
			if (subdir.isDirectory()) {
				foundFile(subdir);
			}
		}
	}

	private static void writFile(File resultFile, String txt) {
		// resultFile �� txt���� �Է�

		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(resultFile));

			writer.write(txt);

			writer.close();

		} catch (IOException e) {

			e.printStackTrace();
		}

	}

	public static String readFile(File file2) {
		// �������� �о����
		String txt = "";

		try {
			BufferedReader reader = new BufferedReader(new FileReader(file2));
			String line = null;
			while ((line = reader.readLine()) != null) {
				txt += line + "\r\n";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return txt;
	}

}
