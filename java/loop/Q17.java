package com.test.question.loop;

public class Q17 {

	public static void main(String[] args) {
		// 2부터 100사이의 소수를 구하시오.
		/*
			2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41
			, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97
			소수 : 1과 자기자신으로밖에 나눠지지 않는 수
		*/
		String answer="";
		int count =0;
		for(int i=2;i<=100;i++) {
			count =0;
			for(int j=1;j<i;j++) {
				if(i%j==0) {
					count++;
				}
			}//내부 for
			if(count==1) answer+="["+i+"]";
		}
		
		System.out.println(answer);
	}
}
