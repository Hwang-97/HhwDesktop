package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q10 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 숫자를 N개 입력받아 아래와 같이 출력하시오.
		int finalNumber = 0;
		int sum 		= 0;
	    String answer ="";
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("종료할 누적값 :");
		finalNumber = Integer.parseInt(reader.readLine());
		for(;;) {
			if(sum>=finalNumber) break;
			else {
				int num = 0;
				System.out.print("숫자 :");
				num = Integer.parseInt(reader.readLine());
				
				if (num%2==0) 
				{
					answer+="+"+num;
					sum+=num; 
				}
				else if (num%2!=0) 
				{
					answer+="-"+num;
					sum-=num;
				}
			}
			
		}
		
		System.out.printf("%s = %d",answer,sum);
		
	}

}
