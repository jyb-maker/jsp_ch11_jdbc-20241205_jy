<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연결 테스트</title>
</head>
<body>
	<%
		String driverName = "com.mysql.jdbc.Driver"; //MySQL JDBC 드라이버 이름 (고정값)
		String url = "jdbc:mysql://localhost:3306/abc_school"; // MySQL이 설치된 주소와 연결할 DB(스키마)이름
		String username = "root"; //계정이름 -> 관리자 계정이름인 root로 설정(변경가능)
		String password = "12345"; //계정비번 -> 관리자 계정 비밀번호 설정(변경가능)

		Connection conn = null;  // DB와의 커넥션을 초기값 null로 해서 생성
		
		try {
			Class.forName(driverName); // MySQL 드라이버 불러오기 
			conn = DriverManager.getConnection(url,username,password); // DB와 프로젝트간의 커넥션 생성
			out.println(conn); //커넥션을 웹으로 출력	
		} catch(Exception e) {
			out.println("DB 연결 실패!");
			e.printStackTrace(); // 에러 발생 시 에러의 내용을 콘솔창에 출력 됨 
		} finally { //에러의 발생여부와 상관없이 무조건 실행 -> Connection 닫기 
			try {
				if(conn != null) {  //connection이 null이 아닐 때만 닫기 
					conn.close();   
				}
			} catch (Exception e) {	
				e.printStackTrace(); // 에러 발생 시 에러의 내용을 콘솔창에 출력 됨				
			}	
		}
	%>
</body>
</html>