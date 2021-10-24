package test.java.projct;
//1,김성범,34,남자,010-9834-3492, 서울시 강남구 역삼동 34번지

public class Member {
	
	private String seq;
	private String name;
	private String age;
	private String gender;
	private String tel;
	private String address;
	
	public Member() {
		this("","","","","","");
	}
	public Member(String seq, String name, String age, String gender, String tel, String address) {
		this.seq = seq;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.tel = tel;
		this.address = address;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "[seq=" + seq + ", name=" + name + ", age=" + age + ", gender=" + gender + ", tel=" + tel
				+ ", address=" + address + "]";
	}
}
