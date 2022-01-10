package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02ok extends HttpServlet {
	
	public void doGet(HttpServletRequest request , HttpServletResponse response) throws IOException, ServletException{
		
		System.out.println("Get 요청을 감지했습니다.");
		
	}
	
	public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException, ServletException{
		
		System.out.println("Post 요청을 감지했습니다.");
		
		String data = request.getParameter("data");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset = charset ='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>결과</h1>");
		writer.println("data:"+data);
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}

}
