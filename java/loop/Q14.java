package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q14 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 최대 9자리 정수(long)를 입력받아 각자리의 홀수 숫자합과 짝수 숫자합을 구하시오.
		// 1. 입력받은 변수를 Math.pow(10, 9) 로 나눈뒤 0이상이면 중지
		// 2. Math.pow(10, i) i값을 1 빼며 각 자리가 홀수인지 짝수인지 확인하여 연산.
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int oddCount  =0;
		int evenCount =0;
		int num 	  =0;
		System.out.print("최대 9자리의 숫자를 입력하세요 : ");
		num = Integer.parseInt(reader.readLine());
		if(num/(int)Math.pow(10,9)<=0) {
			int i=8; // => 100,000,000
			for(;i>=0;i--) {
//				System.out.println(num);
//				System.out.println((int)Math.pow(10, i));
				int mathNumber = num/(int)Math.pow(10, i);// 입력받은 num을 ex) Math.pow(10,8) 100,000,000 에서 순차적으로 나누며 연산한다. 
				if(mathNumber%2==0) {
					evenCount+=mathNumber;
				}else{
					oddCount+=mathNumber; 
				}
				num -=(num/(int)Math.pow(10, i))*Math.pow(10, i);// 연산하고 싶은 자리의 윗자리를 제거한다.
			}
		System.out.printf("짝수의 합 : %d\r\n"
				        + "홀수의 합 : %d",evenCount, oddCount);
		}

	}

}
