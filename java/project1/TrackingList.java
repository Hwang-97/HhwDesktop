package project1;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;


public class TrackingList{
	
	private static ArrayList<Tracking> list;
	private static String path =".\\src\\project1\\tracking.txt";					//tracking
	
	static {
		list = new ArrayList<Tracking>();
		File trackingFile = new File(path);
		if(trackingFile.exists()) {
			try {
				BufferedReader reader = new BufferedReader(new FileReader(path));
				String line = null;
				while((line=reader.readLine())!=null) {
					String[] temp = line.split("▶");
					if(!temp[0].equals("주문번호")) {
						Tracking t = new Tracking();
						t.setOrderNumber(Integer.parseInt(temp[0]));
						t.setDeliveryStatus(temp[1]);
						list.add(t);
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public static ArrayList<Tracking> getList() {
		return list;
	}

	public static void setList(ArrayList<Tracking> list) {
		TrackingList.list = list;
	}
	
}


class Tracking{
	private int orderNumber=0;
	private String deliveryStatus="";
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	
}