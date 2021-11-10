package com.test.question.loop;

public class Q18 {

	public static void main(String[] args) {
		// 1부터 100사이의 완전수를 구하시오.
		/*
			6 = [1, 2, 3]
		   28 = [1, 2, 4, 7, 14]
			약수 : 어떤 수나 식을 나누어 나머지가 없이 떨어지는 수
		  완전수 : 자기 자신을 제외한 나머지 약수들의 합이 자신과 동일한 수
		*/
		int sum =0;
		String answer ="";
			
		for(int i=1;i<=100;i++) {
			sum=0;
			answer="";
			for(int j=1;j<i;j++) {
				if(i%j==0) {
					sum+=j;
					answer+="["+j+"]";
				}
			}
			if(i==sum) System.out.printf("%3d = %s\n", sum,answer);
		}
		
		
		
		
		
	}

}
