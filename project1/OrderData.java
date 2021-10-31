package project1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class OrderData {
	private static List<OrderData> orderList;
	private static String path;
	private int orderNumber;
	private int goodsNumber;
	private int memberNumber;
	private int usePoint;
	private int accumulatePoint;
	private String Name;
	private String address;
	private String phoneNumber;
	private String selectPayment;
	private boolean cancelCheck;
	private Calendar orderDate;
	private String invoiceNumber;
	
	static {
		path = ".\\src\\project1\\주문데이터.txt";
		
		orderList = new ArrayList<OrderData>();
		try {
			// 현재까지의 주문 ArrayList에 저장
			BufferedReader reader = new BufferedReader(new FileReader(path));
			String line =null;
			while((line=reader.readLine())!=null) {
				String[] temp = line.split("▶");
				OrderData d = new OrderData();
				d.setOrderNumber(Integer.parseInt(temp[0]));
				d.setGoodsNumber(Integer.parseInt(temp[1]));
				d.setMemberNumber(Integer.parseInt(temp[2]));
				d.setUsePoint(Integer.parseInt(temp[3]));
				d.setAccumulatePoint(Integer.parseInt(temp[4]));
				d.setName(temp[5]);
				d.setAddress(temp[6]);
				d.setPhoneNumber(temp[7]);
				d.setSelectPayment(temp[8]);
				d.setCancelCheck(temp[9].equals("true"));
				d.setOrderDate(temp[10]);
				d.setInvoiceNumber(temp[11]);
				orderList.add(d);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//생성자
	public OrderData(int orderNumber, int goodsNumber, int memberNumber, int usePoint, int accumulatePoint, String name,
			String address, String phoneNumber, String selectPayment, boolean cancelCheck, Calendar orderDate) {
		super();
		this.orderNumber = orderNumber;
		this.goodsNumber = goodsNumber;
		this.memberNumber = memberNumber;
		this.usePoint = usePoint;
		this.accumulatePoint = accumulatePoint;
		Name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.selectPayment = selectPayment;
		this.cancelCheck = cancelCheck;
		this.orderDate = orderDate;
	}
	public OrderData() {
		this(0,0,0,0,0,"","","","",false,null);
	}
	//생성자
	public static void save() {
		try {
			// 현재까지의 주문 ArrayList에 저장
			BufferedWriter writer = new BufferedWriter(new FileWriter(path));
			StringBuilder txt =new  StringBuilder();
			for(int i=0; i<orderList.size();i++) {
				txt.append(orderList.get(i).getOrderNumber());
				txt.append("▶");
				txt.append(orderList.get(i).getGoodsNumber());
				txt.append("▶");
				txt.append(orderList.get(i).getMemberNumber());
				txt.append("▶");
				txt.append(orderList.get(i).getUsePoint());
				txt.append("▶");
				txt.append(orderList.get(i).getAccumulatePoint());
				txt.append("▶");
				txt.append(orderList.get(i).getName());
				txt.append("▶");
				txt.append(orderList.get(i).getAddress());
				txt.append("▶");
				txt.append(orderList.get(i).getPhoneNumber());
				txt.append("▶");
				txt.append(orderList.get(i).getSelectPayment());
				txt.append("▶");
				txt.append(orderList.get(i).isCancelCheck());
				txt.append("▶");
				txt.append(String.format("%tF", orderList.get(i).getOrderDate()));
				txt.append("▶");
				txt.append(orderList.get(i).getInvoiceNumber());
				txt.append("\r\n");
			}
			writer.write(txt.toString());
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static List<OrderData> getOrderList() {
		return orderList;
	}
	public String getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public static void setOrderList(List<OrderData> oderList) {
		OrderData.orderList = oderList;
	}
	//list getter setter
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public int getGoodsNumber() {
		return goodsNumber;
	}
	public void setGoodsNumber(int goodsNumber) {
		this.goodsNumber = goodsNumber;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public int getAccumulatePoint() {
		return accumulatePoint;
	}
	public void setAccumulatePoint(int accumulatePoint) {
		this.accumulatePoint = accumulatePoint;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getSelectPayment() {
		return selectPayment;
	}
	public void setSelectPayment(String selectPayment) {
		this.selectPayment = selectPayment;
	}
	public boolean isCancelCheck() {
		return cancelCheck;
	}
	public void setCancelCheck(boolean cancelCheck) {
		this.cancelCheck = cancelCheck;
	}
	public Calendar getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String d) {
		d=d.replace("-", "");
		d.trim();
		int year = Integer.parseInt(d.substring(0,4));
		int month = Integer.parseInt(d.substring(4,6));
		int date = Integer.parseInt(d.substring(6));
		
		Calendar c = Calendar.getInstance();
		c.set(year,month-1,date);
		this.orderDate = c;
	}
	@Override
	public String toString() {
		return "Data [orderNumber=" + orderNumber + ", goodsNumber=" + goodsNumber + ", memberNumber=" + memberNumber
				+ ", usePoint=" + usePoint + ", accumulatePoint=" + accumulatePoint + ", Name=" + Name + ", address="
				+ address + ", phoneNumber=" + phoneNumber + ", selectPayment=" + selectPayment + ", cancelCheck="
				+ cancelCheck + ", orderDate=" + String.format("%tF",orderDate) + ", invoiceNumber="+this.invoiceNumber+ "]";
	}
	
	
}

