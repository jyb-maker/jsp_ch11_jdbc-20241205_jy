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
<title>회원 가입 성공 여부</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String shakbun = request.getParameter("hakbun");//학번		
		
		String driverName = "com.mysql.jdbc.Driver";//MySQL JDBC 드라이버 이름
		String url = "jdbc:mysql://localhost:3306/abc_school";//MySQL이 설치된 주소와 연결할 DB(스키마)이름		
		String username = "root";//계정 이름->관리자 계정 이름
		String password = "12345";//계정 비밀번호->관리자 계정 비밀번호
		
		String sql = "SELECT * FROM student WHERE hakbun='"+shakbun+"'";
		
		Connection conn = null;
		Statement stmt = null;//sql문을 실행시켜주는 객체
		ResultSet rs = null;//select문 실행 시 DB에서 반환해주는 결과 레코드를 받아 주는 자료타입
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);//ResultSet 객체(rs)로 반환되는 값을 받아야 함
			// 초기 값 설정 ↓ : while문 밖에 선언
			int hakbun = 0;
			String name = "";
			String addr = "";
			int grade = 0;
			
			while(rs.next()) { // (→): next: DB로 부터 반환 받은 레코드의 개수 만큼 반복된다.  
				hakbun = rs.getInt("hakbun");//학번
				name = rs.getString("name");//이름				
				addr = rs.getString("address");//주소
				grade = rs.getInt("grade");//학년				
				out.println("---- 학생 정보 조회 결과 ----"+"<br><br>");
				out.println(hakbun+"/"+name+"/"+grade+"/"+addr);				
			}
			if(hakbun==0) {
				out.println("입력하신 학번은 없는 학번입니다.");
			}
			
		}catch (Exception e) {
			out.println("DB 에러 발생!! 회원조회실패!!");
			e.printStackTrace();			
		}finally{
			try{
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
	%>
</body>
</html>