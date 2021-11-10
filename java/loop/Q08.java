package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q08 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 서기 1년 1월 1일부터 오늘까지 며칠째인지 합을 구하시오.
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int nowYear = 0;
		int nowMonth = 0;
		int nowDate = 0;
		int sumDate = 0;
		System.out.print("현재 년도 입력:");
		nowYear = Integer.parseInt(reader.readLine());
		System.out.print("현재 월 입력:");
		nowMonth = Integer.parseInt(reader.readLine());
		System.out.print("현재 날짜 입력:");
		nowDate = Integer.parseInt(reader.readLine());
		// 윤년 366 => 2월 29
		// 평년 365 => 2월 28
		// if(i%4==0 && i%100!=0 || i%400==0)
		for (int i = 1; i < nowYear; i++) {// 현재 1월 1일 이전까지의 합
			if (isLeapYear(i))
				sumDate += 366;
			else
				sumDate += 365;
		}
		sumDate = extracted(nowMonth, sumDate);
		System.out.printf("%d년 %d월 %d일은 서기 1년 1월 1일 부터 %,d일째 되는 날입니다.\n", nowYear, nowMonth, nowDate,
				(sumDate + nowDate));
		System.out.println(sumDate%7);//738057 =? 검증
	}

	public static int extracted(int nowMonth, int sumDate) {
		for (int i = 1; i < nowMonth; i++) { // 현재 달 까지의 일수 누적
			switch (i) {
			case 1: case 3: case 5: case 7: case 8: case 10: case 12:
				sumDate += 31;
				break;
			case 4: case 6: case 9: case 11:
				sumDate += 30;
				break;
			case 2:
				if (isLeapYear(i))
					sumDate += 29;
				else
					sumDate += 28;
				break;
			}
		}
		return sumDate;
	}

	public static boolean isLeapYear(int i) {
		return i % 4 == 0 && i % 100 != 0 || i % 400 == 0;
	}
}
