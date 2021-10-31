// 데이터 테스트
package project1;

import java.util.Scanner;

public class test 
{
	public static void main(String[] args) throws Exception
	{
//		ContentData.makeReview();
//		ContentData.makeQuery();
//		
//		System.out.println(ContentData.queryList.get(1).getItemCode());
//		ContentData.queryList.get(1).setItemCode("LG");;
//		System.out.println(ContentData.queryList.get(1).getItemCode());
		
		//System.out.println("==================");

		//ProductList.createProductDump();
		
		//System.out.println(ProductList.productList.get(0).getProductModel());
		//ProductList.productList.get(0).setProductModel("B모델");
		//System.out.println(ProductList.productList.get(0).getProductModel());
		
		//System.out.println("==================");
		
		//MemberList.getMemberDump();
		
		//System.out.println(MemberList.getMemberList().get(0).getPw());
		//MemberList.getMemberList().get(0).setPw("1234");
		//MemberList.getMemberList().remove(0);
		//System.out.println(MemberList.getMemberList().get(0).getPw());
		
		//System.out.println("==================");
		
		//OrderDump.writeDump();
		
		//System.out.println(OrderData.getOderList().get(0).getName());
		//OrderData.getOderList().get(0).setName("유재석");
		//System.out.println(OrderData.getOderList().get(0).getName());
		
		//System.out.println("==================");
		
		//System.out.println(DeliveryTest.list.get(0).getDeliveryState());
		//DeliveryTest.list.get(0).setDeliveryState("배송완료");
		//System.out.println(DeliveryTest.list.get(0).getDeliveryState());
		
//		ContentData c = new ContentData();
//		c.makeQuery();
//		c.makeReview();
//		
//		ProductList pl = new ProductList();
//		pl.createProductDump();
//		
//		MemberList m =new MemberList();
//		m.getMemberDump();
//		System.out.println("완료");
		
//		jangOrder j = new jangOrder();
//		j.main(args);
//		
		OrderDump o = new OrderDump();
		o.writeDump();
		o.writeDump();
		o.writeDump();
		
//		OrderData.getOrderList().stream()
//		.filter(o->o.getOrderNumber()>50)
//		.forEach(o->o.setName("수정됨"));
//		Scanner scan = new Scanner(System.in);
//		scan.nextLine(); // 데이터 삭제 후 되돌아 오는지 확인용
//		OrderData.save();
		
//		DetailPageDump.dump();
		TrackingDump.dump();
	}
}