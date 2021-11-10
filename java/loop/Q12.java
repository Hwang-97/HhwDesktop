package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q12 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 숫자를 10개 입력받아 한글로 변환 후 출력하시오.	
		boolean b =true;
		for(int i=0;i<10;i++) {
			if(b==false) break; 
			else b=numberChange(b);
		}
		if(b)System.out.printf("결과: %s",changeNumbers);
	}
	
	static String changeNumbers = "";

	private static boolean numberChange(boolean b) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int num =0;
		System.out.print("숫자 : ");
		num = Integer.parseInt(reader.readLine());
		
		if(num<10) {
			switch(num) {
				case 1 :
					changeNumbers += "일";
					b= true;
					break;
				case 2 :
					changeNumbers += "이";
					b= true;
					break;
				case 3 :
					changeNumbers += "삼";
					b= true;
					break;
				case 4 :
					changeNumbers += "사";
					b= true;
					break;
				case 5 :
					changeNumbers += "오";
					b= true;
					break;
				case 6 :
					changeNumbers += "육";
					b= true;
					break;
				case 7 :
					changeNumbers += "칠";
					b= true;
					break;
				case 8 :
					changeNumbers += "팔";
					b= true;
					break;
				case 9 :
					changeNumbers += "구";
					b= true;
					break;
			}	
		}
		else if(num>=10) b=false;
		
		return b ;
	}

}
