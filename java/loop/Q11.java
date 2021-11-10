package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q11 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 사용자가 입력한 범위의 숫자까지 369 게임의 결과를 출력하시오.
		int num =0;
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("숫자 입력 : ");
		num = Integer.parseInt(reader.readLine());
		for(int i =1;i<=num ;i++) {
			if(i%10==0) {
				if(i%3==0) System.out.print(" 짝 ");
				else       System.out.printf(" %2d ",i);
			}else if(i>10) {
				if((i-((i/10)*10))%3==0) System.out.print(" 짝 ");
				else       System.out.printf(" %2d ",i);
			}
		}
	}

}
