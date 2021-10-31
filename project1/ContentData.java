// 이상승님 코드
package project1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Random;

public class ContentData
{		
	public static ArrayList<Query> queryList;
	public static ArrayList<Review> reviewList;
	
	static
	{
		try
		{	
			queryList = new ArrayList<Query>();
			
			BufferedReader reader = new BufferedReader(new FileReader(".\\src\\project1\\상품 문의.txt"));
			String line;
			while((line = reader.readLine()) != null)
			{
				String[] temp = line.split("▶");
				
				queryList.add(new Query(Integer.parseInt(temp[0]), temp[1], temp[1], temp[2]));
			}
			reader.close();
			
			reviewList = new ArrayList<Review>();
			
			reader = new BufferedReader(new FileReader(".\\src\\project1\\상품 리뷰.txt"));
		
			while((line = reader.readLine()) != null)
			{
				String[] temp = line.split("▶");
				
				reviewList.add(new Review(Integer.parseInt(temp[0]), temp[1], Integer.parseInt(temp[2]), temp[3]));
			}
			reader.close();
		} 
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void makeQuery() throws Exception
	{
		String path = ".\\src\\project1\\";
		
		BufferedWriter writer = new BufferedWriter(new FileWriter(path + "상품 문의.txt"));
			
		ArrayList<Query> queryList = new ArrayList<Query>();
		
		Random rnd = new Random();
		
		String[] queryContentList = {"문의 내용1", "문의 내용2", "문의 내용3", "문의 내용4", "문의 내용5", "문의 내용6", "문의 내용7", "문의 내용8", "문의 내용9", "문의 내용10"};
		String[] answerContentList = {"답변 내용1", "답변 내용2", "답변 내용3", "답변 내용4", "답변 내용5", "답변 내용6", "답변 내용7", "답변 내용8", "답변 내용9", "답변 내용10"};
		
		for(int i=0; i<50; i++)
		{
			queryList.add(new Query(i+1, ProductList.productList.get(i).getProductCode(), queryContentList[rnd.nextInt(10)], answerContentList[rnd.nextInt(10)]));
		}
		for(int i=0; i<queryList.size(); i++)
		{
			writer.write(String.format("%d▶%s▶%s▶%s\r\n", queryList.get(i).getMemberNum(), queryList.get(i).getItemCode(), queryList.get(i).getQueryContent(), queryList.get(i).getAnswerContent()));
		}
		writer.close();
	}
	public static void makeReview() throws Exception
	{
		String path = ".\\src\\project1\\";
		
		BufferedWriter writer = new BufferedWriter(new FileWriter(path + "상품 리뷰.txt"));
		
		ArrayList<Review> reviewList = new ArrayList<Review>();
		
		Random rnd = new Random();
		
		String[] reviewContentList = {"최고에요", "좋아요", "그저 그래요", "별로에요", "최악이에요"};
		
		for(int i=0; i<50; i++)
		{
			reviewList.add(new Review(i+1, ProductList.productList.get(i).getProductCode(), rnd.nextInt(5)+1, reviewContentList[rnd.nextInt(4)]));
		}
		for(int i=0; i<reviewList.size(); i++)
		{
			writer.write(String.format("%d▶%s▶%d▶%s\r\n", reviewList.get(i).getMemberNum(), reviewList.get(i).getItemCode(), reviewList.get(i).getItemScore(), reviewList.get(i).getReviewContent()));
		}
		writer.close();
	}
}