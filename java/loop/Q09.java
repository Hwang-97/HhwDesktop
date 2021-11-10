package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q09 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 컴퓨터가 1~10 사이의 숫자 1개를 생각하면 사용자가 맞추는 프로그램을 구현하시오.
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int random = 0; 
		int count  = 0;
		random = (int)(Math.random()*10)+1;
		for(;;) {
			System.out.print("숫자 : ");
			int num =Integer.parseInt(reader.readLine());
			count++;
			if(num!=random) {
				System.out.println("틀렸습니다."); 
				continue;
			}else if(num==random) {
				System.out.println("맞았습니다.");
				break;
			}
		}
		System.out.printf("컴퓨터가 생각한 숫자는 %d입니다.\r\n"
				+"정답을 맞추는데 시도한 횟수는 %d회입니다.\r\n"
				+"프로그램을 종료합니다."
				 , random,count);
		
	}

}
