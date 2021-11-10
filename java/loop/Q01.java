package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q01 {

	public static void main(String[] args) throws IOException {
		// 사용자의 이름과 인사할 횟수를 입력 받아 출력하시오.
		String name ="";
		int count	= 0;
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));	
		System.out.print("이름:");
		name = reader.readLine();
		System.out.print("횟수:");
		count = Integer.parseInt(reader.readLine());
		
		for(int i=0;i<count;i++) {
			System.out.printf("%s님 안녕하세요~\n",name);
		}
	}

}
