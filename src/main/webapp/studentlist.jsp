<%@page import="java.util.ArrayList"%>
<%@page import="com.jybmaker.dto.studentDto"%>
<%@page import="java.util.List"%>
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
<title>Insert title here</title>
</head>
<body>
	<%
		String sql="SELECT * FROM student";//모든 학생 레코드 가져오기
		
		String driverName = "com.mysql.jdbc.Driver";//MySQL JDBC 드라이버 이름
		String url = "jdbc:mysql://localhost:3306/abc_school";//MySQL이 설치된 주소와 연결할 DB(스키마)이름		
		String username = "root";//계정 이름->관리자 계정 이름
		String password = "12345";//계정 비밀번호->관리자 계정 비밀번호		
		
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
			List<studentDto> studentList = new ArrayList<studentDto>();
			
			
			out.println("---- 학생 전체 리스트 ----"+"<br><br>");			
			while(rs.next()) { // (→): next: DB로 부터 반환 받은 레코드의 개수 만큼 반복된다.  
				hakbun = rs.getInt("hakbun");//학번
				name = rs.getString("name");//이름				
				addr = rs.getString("address");//주소
				grade = rs.getInt("grade");//학년				
	
//				studentDto studentDto = new studentDto(hakbun,name,grade,addr);
				studentDto studentDto = new studentDto();
				studentDto.setHakbun(hakbun);
				studentDto.setName(name);
				studentDto.setGrade(grade);
				studentDto.setAddress(addr);
				
				studentList.add(studentDto);
				
				
				
				
//				out.println(hakbun+"/"+name+"/"+grade+"/"+addr+"<br>");				
			}
			
			for(int i=0;i<studentList.size();i++) {
				out.println(studentList.get(i).getHakbun()+"/"); //회원의 학번	
				out.println(studentList.get(i).getName()+"/"); //회원의 이름	
				out.println(studentList.get(i).getGrade()+"/"); //회원의 학년	
				out.println(studentList.get(i).getAddress()+"/"+"<br>"); //회원의 주소	
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