// 이상승님 코드
package project1;

public class Query
{
	private int memberNum; // 회원 번호
	private String itemCode; // 상품 코드
	private String queryContent; // 문의 내용
	private String answerContent; // 답변 내용
	
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
	public String getQueryContent() 
	{
		return queryContent;
	}
	public void setQueryContent(String queryContent)
	{
		this.queryContent = queryContent;
	}
	public String getAnswerContent()
	{
		return answerContent;
	}
	public void setAnswerContent(String answerContent)
	{
		this.answerContent = answerContent;
	}
	public Query() 
	{
		this(0, null, null, null);
	}
	public Query(int memberNum, String itemCode, String queryContent, String answerContent)
	{
		this.memberNum = memberNum;
		this.itemCode = itemCode;
		this.queryContent = queryContent;
		this.answerContent = answerContent;
	}
}