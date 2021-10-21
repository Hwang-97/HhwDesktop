package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q02 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 숫자 2개를 입력 받아 시작 숫자에서 종료 숫자까지 1씩 증가하며 출력하시오.
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int num1=0;
		int num2=0;
		System.out.print("시작 숫자 :");
		num1 = Integer.parseInt(reader.readLine());
		System.out.print("종료 숫자 :");
		num2 = Integer.parseInt(reader.readLine());
		for(int i = num1;i<=num2;i++) {
			System.out.println(i);
		}
		
	}

}
