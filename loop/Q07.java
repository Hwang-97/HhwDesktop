package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q07 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int finalNumber = 0;
		int sum			= 0;
		System.out.print("연산이 종료되길 원하는 숫자를 입력하세요 : ");
		finalNumber = Integer.parseInt(reader.readLine());
		
		for(int i=1 ; i<=finalNumber ; i++) {
			if(sum<=finalNumber) {	
				System.out.printf("%d + ", i);
				sum+=i;
			}
		}
		System.out.printf("=%d", sum);
		
		
	}

}
