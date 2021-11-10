package project1;

public class Review
{
	private int memberNum; // 회원 번호
	private String itemCode; // 상품 코드
	private int itemScore; // 상품 평점
	private String reviewContent; // 리뷰 내용
	
	public int getMemberNum() 
	{
		return memberNum;
	}
	public void setMemberNum(int memberNum) 
	{
		this.memberNum = memberNum;
	}
	public String getItemCode() 
	{
		return itemCode;
	}
	public void setItemCode(String itemCode)
	{
		this.itemCode = itemCode;
	}
	public int getItemScore()
	{
		return itemScore;
	}
	public void setItemScore(int itemScore)
	{
		this.itemScore = itemScore;
	}
	public String getReviewContent() 
	{
		return reviewContent;
	}
	public void setReviewContent(String reviewContent)
	{
		this.reviewContent = reviewContent;
	}
	public Review()
	{
		this(0, null, 0, null);
	}
	public Review(int memberNum, String itemCode, int itemScore, String reviewContent)
	{
		this.memberNum = memberNum;
		this.itemCode = itemCode;
		this.itemScore = itemScore;
		this.reviewContent = reviewContent;
	}
	@Override
	public String toString() {
		return "Review [memberNum=" + memberNum + ", itemCode=" + itemCode + ", itemScore=" + itemScore
				+ ", reviewContent=" + reviewContent + "]";
	}
	
}