package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q19 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 숫자를 2개 입력받아 각각의 약수와 두 숫자의 공약수를 구하시오.
		/*
		입력
			첫번째 숫자 : 12 
			두번째 숫자 : 8 
		출력
			12의 약수 : 1, 2, 3, 4, 6, 12 	// 즉시 출력
			8의 약수 : 1, 2, 4, 8			//즉시 출력
			12와 8의 공약수 : 1, 2, 4  		//연산 후 출력
		공약수 : 둘 이상의 정수에 공통된 약수
		*/
		int num1,num2 =0;
		num1 = getNumber();
		num2 = getNumber();
		
		getdivisor(num1);
		getdivisor(num2);
		commonDivisor(num1,num2);
		
		
	}

	private static int getNumber() throws NumberFormatException, IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("숫자 : ");
		return Integer.parseInt(reader.readLine());
	}

	private static void commonDivisor(int num1, int num2) {
		String commonDivisor= "";//공약수
		if(num1<=num2) {//크기비교.. 약수이기때문
			for(int i=1 ; i<=num1 ;i++) {
				if(num1%i==0 && num2%i==0) {
					commonDivisor+="["+i+"]";
				}
			}
			System.out.printf("%3d와 %3d의 공약수 :%s", num1,num2,commonDivisor);
		}
		else if(num1>=num2) {
			for(int i=1 ; i<=num2 ;i++) {
				if(num1%i==0 && num2%i==0) {
					commonDivisor+="["+i+"]";
				}
			}
			System.out.printf("%3d와 %3d의 공약수 :%s", num1,num2,commonDivisor);
		}
		
	}

	public static void getdivisor(int num2) {
		String divisor= "";		//약수
		divisor= "";
		for(int i=1;i<=num2;i++) {
			if(num2%i==0) {
				divisor+="["+i+"]";
			}
		}
		System.out.printf("%3d의\t약수\t   :%s\n", num2,divisor);
	}

}
