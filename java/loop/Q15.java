package com.test.question.loop;

public class Q15 {

	public static void main(String[] args) {
		int sum =0;
		int num=0;
		String answer ="";
		for(int i=1;i<=100;i+=num) {
			num++;					
			sum+=i;
			answer+="+"+i;
		}//for문
		System.out.printf("%s = %d",answer.substring(1,answer.length()),sum);
	}

}
