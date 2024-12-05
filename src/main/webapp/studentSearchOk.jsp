<%@page import="java.sql.ResultSet"%>
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
		String shakbun = request.getParameter("hakbun");  //이름

		
		String driverName = "com.mysql.jdbc.Driver"; //MySQL JDBC 드라이버 이름 (고정값)
		String url = "jdbc:mysql://localhost:3306/abc_school"; // MySQL이 설치된 주소와 연결할 DB(스키마)이름
		String username = "root"; //계정이름 -> 관리자 계정이름인 root로 설정(변경가능)
		String password = "12345"; //계정비번 -> 관리자 계정 비밀번호 설정(변경가능)

		String sql = "select * from student where hakbun='"+shakbun+"'";	
		
		Connection conn = null;
		Statement stmt = null;  // SQL문을 실행을 위한 객체 선언 
		ResultSet rs = null; //select문 실행시 DB에서 반환해주는 결과 레코드를 받아주는 자료타입 
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url,username,password);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql); // ResultSet 객체(rs)로 반환되는 값을 받아야 함. 
			
			while(rs.next()) {
				int hakbun = rs.getInt("hakbun");
				String name = rs.getString("name");
				String addr = rs.getString("address");				
				int grade = rs.getInt("grade");					
				if(name.equals(null)) {// 참이면 해당 학번 없음
					out.println("검색하신 학번은 없는 학번입니다.");
				} else {
					out.println(hakbun+"/"+name+"/"+addr+"/"+grade);
				}				
			}
			

		} catch (Exception e) {
			out.println("DB 에러 발생! 회원 조회 실패!!");
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) {
					rs.close();
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