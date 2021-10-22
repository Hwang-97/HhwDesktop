package test.java.collection;

import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class Ex79_Set {

	public static void main(String[] args) {


		Set<Integer> set = new TreeSet<Integer>();
		
		set.add(100);
		set.add(400);
		set.add(200);
		set.add(500);
		set.add(300);
		
		System.out.println(set.size());
		
		System.out.println(set);
		
		Iterator<Integer> iter = set.iterator();
		
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
		System.out.println();
		
		TreeSet<Integer> tree = (TreeSet<Integer>)set;
		
		System.out.println(tree.first());
		System.out.println(tree.last());
		System.out.println(tree.headSet(300));
		System.out.println(tree.tailSet(300));
		System.out.println(tree.subSet(200,400));

	}

}
