package com.test.question.loop;

public class Q16 {

	public static void main(String[] args) {
		// 1 + 1 + 2 + 3 + 5 + 8 + 13 + 21 + 34 + 55 + 89 = 232
		// N이 100이 넘기 전까지 출력하시오.
		int sum=0;
		int num1=1;
		int num2=1;
		int num=0;
		String answer = "";	
		answer+="+"+num1;
		answer+="+"+num2;
		for(int i=1;i<=100;i++) {
			num =num1+num2;//now
			if(num<100) {
				answer+="+"+num;
				sum+=num;
				num2=num1; //전전항 => 전항
				num1=num;//
			}
			
		}
		System.out.printf("%s = %d",answer.subSequence(1, answer.length()),sum+2);//초기 1+1 을 임의로 더해줌
	}
	
}
