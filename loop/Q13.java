package com.test.question.loop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q13 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		// 자판기 프로그램을 구현하시오..
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		int cola = 700;
		int sida = 600;
		int bita = 500;
		vendingMachine(reader, cola, sida, bita);
	
	}//main
	

	public static void vendingMachine(BufferedReader reader, int cola, int sida, int bita) throws IOException {
		vendingMachineInput(reader, cola, sida, bita);
	}

	public static void vendingMachineInput(BufferedReader reader, int cola, int sida, int bita) throws IOException {
		int money = 0;
		for (;;) {
			System.out.println("====================");
			System.out.println("\t 자판기 \t");
			System.out.println("====================");
			System.out.printf("1. 콜라 \t:%,d원\n", cola);
			System.out.printf("2. 사이다 \t:%,d원\n", sida);
			System.out.printf("3. 비타500 \t:%,d원\n", bita);
			System.out.println("--------------------");
			System.out.print("금액 투입(원) \t:");
			money = Integer.parseInt(reader.readLine());
			System.out.println("--------------------");
			System.out.print("음료 선택(번호) :");
			int num = Integer.parseInt(reader.readLine());
			vendingMachineOutput(cola, sida, bita, money, num);
			pause(reader);
		}
	}

	public static void vendingMachineOutput(int cola, int sida, int bita, int money, int num) {
		switch (num) {
		case 1:
			if (money < cola)
				System.out.printf("+금액이 부족합니다.\n" + "+잔돈 %,d원을 제공합니다.", money);
			else
				System.out.printf("+콜라를 제공합니다.\n" + "+잔돈 %,d원을 제공합니다.", money - cola);
			break;
		case 2:
			if (money < sida)
				System.out.printf("+금액이 부족합니다.\n" + "+잔돈 %,d원을 제공합니다.", money);
			else
				System.out.printf("+사이다를 제공합니다.\n" + "+잔돈 %,d원을 제공합니다.", money - sida);
			break;
		case 3:
			if (money < bita)
				System.out.printf("+금액이 부족합니다.\n" + "+잔돈 %,d원을 제공합니다.", money);
			else
				System.out.printf("+비타500를 제공합니다.\n" + "+잔돈 %,d원을 제공합니다.", money - bita);
			break;
		default:
			System.out.printf("+판매 불가능합니다.\n" + "+잔돈 %,d원을 제공합니다.", money);
			break;
		}
	}

	public static void pause(BufferedReader reader) throws IOException {
		System.out.println();
		System.out.print("계속하시려면 'Enter'를 입력하세요.");
		reader.readLine();
	}

}
