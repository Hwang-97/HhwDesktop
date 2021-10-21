package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q03 {
	
	public static void main(String[] args) throws NumberFormatException, IOException {
		// 숫자 1개를 입력받아 1부터 입력한 숫자까지의 합을 출력하시오.
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int num =0;
		int sum =0;
		System.out.print("숫자 :");
		num = Integer.parseInt(reader.readLine());
		for(int i=1;i<=num;i++) {
			sum+=i;
		}
		System.out.printf("1 ~ %d = %d" , num,sum);
	}

}
