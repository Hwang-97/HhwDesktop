package com.test.question.loop;

public class Q06 {

	public static void main(String[] args) {
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			if (i == 1) {
				System.out.printf(" %d", i);
				sum += i;
			} else if (i % 2 == 0) {
				System.out.printf(" - %d", i);
				sum += (i * -1);
			} else if (i % 2 != 0) {
				System.out.printf(" + %d", i);
				sum += (i * 1);// => sum-i; 동일
			}
		}

		System.out.printf(" = %d", sum);

	}

}
