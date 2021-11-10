package com.test.question.loop;

public class Q05 {

	public static void main(String[] args) {
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			if (i == 10) {
				System.out.printf(" %d = ", i);
				sum += i;
			} else if (i < 10) {
				System.out.printf(" %d +", i);
				sum += i;
			}
		}
		System.out.print(sum);
	}
}
