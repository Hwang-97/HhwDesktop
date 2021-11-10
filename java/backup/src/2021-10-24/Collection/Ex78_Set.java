package com.test.java.obj.Collection;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class Ex78_Set {

	public static void main(String[] args) {


//		m1();
//		m2();
		m3();
		m4();

	}

	private static void m4() {

		Person p1 = new Person("ȫ�浿",20);
		Person p2 = new Person("�ƹ���",40);
		Person p3 = new Person("ȫ�浿",20);
		
		System.out.println(p1.hashCode());
		System.out.println(p2.hashCode());
		System.out.println(p3.hashCode());
		
		//�ּҰ� ��
		System.out.println(p1.equals(p2));
		System.out.println(p1.equals(p3));
		
		
	}

	private static void m3() {

		List<Person> alist = new ArrayList<Person>();
		Set<Person> slist = new HashSet<Person>();
		
		alist.add(new Person("ȫ�浿",20));
		alist.add(new Person("�ƹ���",25));
		alist.add(new Person("������",27));
		alist.add(new Person("ȫ�浿",20));

		//set�� ������ü�� ������ �Ͼ�� ��
		//���� �ٸ��ٰ� �Ǵ�.
		slist.add(new Person("ȫ�浿",20));
		slist.add(new Person("�ƹ���",25));
		slist.add(new Person("������",27));
		slist.add(new Person("ȫ�浿",20));

		
		System.out.println(alist);
		System.out.println(slist);
		
		
		
		
	}

	private static void m2() {
		// ���� �ٻ�> �ߺ����� ����!
		//�ζǹ�ȣ6��(1~45)
		
		Random rnd = new Random();	
		ArrayList <Integer> lotto	= new ArrayList<Integer>();
		
//		for(int i =0 ; i<6 ; i++) {
//			int n= rnd.nextInt(45)+1;
//			if(!lotto.contains(n)) {
//				lotto.add(n);
//			}
//		}
		
		for(int i =0 ; i<6 ; i++) {
			boolean flag = false;
			int n= rnd.nextInt(45)+1;
			for(int j=0;j<i;j++) {
				if(n==lotto.get(j)) {
					flag= true;
					break;
				}
			}
			if(flag) {
				i--;
			}else {
				lotto.add(n);
			}
		}
		System.out.println("list : "+lotto);
		
		Set<Integer> lotto2 = new HashSet<Integer>();
		
		while(lotto2.size()<6) {
			int n = rnd.nextInt(45)+1;
			lotto2.add(n);
		}
		
		System.out.println("set  : "+lotto2);
		
		
		System.out.println();
		
		//��� 1��� �ߺ� ��÷ ���� > List
		//��� 1��� �ߺ� ��÷ �Ұ��� > set
		
		List<String> box = new ArrayList<String>();
		
		box.add("ȫ�浿");
		box.add("�ƹ���");
		box.add("������");
		box.add("ȣȣȣ");
		box.add("������");
		
		List<String> result = new ArrayList<String>();
		
		for(int i =0; i<3 ; i++) {
			result.add(box.get(rnd.nextInt(box.size())));
		}
		
		System.out.println(result);
		
		Set<String>result2 = new HashSet<String>();
		
		for(;result2.size()<3 ;) {
			result2.add(box.get(rnd.nextInt(box.size())));
		}
		
		System.out.println(result2);
		
		
	}

	private static void m1() {
		
//		ArrayList<String> list = new ArrayList<String>();
//		HashSet<String> set = new HashSet<String>();
		
		List<String> list = new ArrayList<String>();
		Set<String> set = new HashSet<String>();
		
		list.add("���");
		list.add("�ٳ���");
		list.add("����");
		list.add("����");
		
		// list & set ��� collection�� �ҙ��Ǿ� �ֱ⿡ ��ɾ ����
		set.add("����");
		set.add("����");
		set.add("����");
		set.add("����");
		
		System.out.println(list.size());
		System.out.println(set.size());
		
		System.out.println(list);
		System.out.println(set);
		
		for(String s : set) {
			System.out.println(s);
		}
		
		
	}

}


class Person{
	
	private String name;
	private int age;
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	public Person() {
		this("",0);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + "]";
	}
	
	@Override
	public int hashCode() {
		return (this.name+this.age).hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		
		return this.hashCode() == obj.hashCode();
	}
}




















