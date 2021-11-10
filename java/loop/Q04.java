package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q04 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 숫자 10개를 입력받아 짝수의 합과 홀수의 합을 각각 출력하시오.
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int oddCount 	= 0;
		int evenCount 	= 0;
		int numCount		= 0;
		for(int i =0;i<10;i++) {
			int num=0;
			System.out.printf("%d 번째 숫자 입력:",i+1);
			num=Integer.parseInt(reader.readLine());
			numCount++;
			if(num%2!=0) 		oddCount+=num;
			else if(num%2==0)   evenCount+=num;
		}
		
		System.out.printf("짝수의 합 : %d\r\n"
				        + "홀수의 합 : %d\r\n"
				        + "입력받은 숫자 : %d 개", evenCount,oddCount,numCount);
		
	}

}
