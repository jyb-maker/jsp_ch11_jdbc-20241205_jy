<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공여부</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String sname = request.getParameter("sname");  //이름
		String sgrade = request.getParameter("sgrade"); //학년
		String saddr = request.getParameter("saddr"); //주소
		
		String driverName = "com.mysql.jdbc.Driver"; //MySQL JDBC 드라이버 이름 (고정값)
		String url = "jdbc:mysql://localhost:3306/abc_school"; // MySQL이 설치된 주소와 연결할 DB(스키마)이름
		String username = "root"; //계정이름 -> 관리자 계정이름인 root로 설정(변경가능)
		String password = "12345"; //계정비번 -> 관리자 계정 비밀번호 설정(변경가능)

		String sql = "INSERT INTO student(name,grade,address) VALUES ('"+sname+"','"+sgrade+"','"+saddr+"')";	
		
		Connection conn = null;
		Statement stmt = null;  // SQL문을 실행을 위한 객체 선언 
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url,username,password);
			stmt = conn.createStatement();
			
			int resultNum = stmt.executeUpdate(sql); // SQL문 DB에서 실행 -> 성공하면 1이 반환, 1이 아니면 실패
			
			if (resultNum == 1) {
				out.println("회원가입 성공!");
			} else {
				out.println("회원가입 실패 ㅜㅜ");				
			}
			
		} catch (Exception e) {
			out.println("DB 에러 발생! 회원 가입 실패!!");
			e.printStackTrace();
		}finally{
			try{
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				
			} catch(Exception e){
				e.printStackTrace();
			}
		}		
	%>	
</body>
</html>