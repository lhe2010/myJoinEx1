<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 데이터 처리페이지</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String newName = request.getParameter("name");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String jdbcUrl = "jdbc:mysql://localhost:3306/my_login_ex1?serverTimezone=UTC";
			String dbId = "root";
			String dbPw = "1234";
			
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String sql = "SELECT * FROM MEMBER WHERE ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String rId = rs.getString("id");
				String rPass = rs.getString("passwd");
				
				if(rId.equals(id) && rPass.equals(passwd)){
	// 				sql = "UPDATE MEMBER SET NAME=?, joindate=now() WHERE ID=?";
					sql = "UPDATE MEMBER SET NAME=? WHERE ID=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, newName);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
	%>
					<script>
						alert("수정 완료!");
						location.href="00_main.jsp";
					</script>
	<%				
				} else {
	%>
					<script>
						alert("비밀번호를 확인하세요");
						history.go(-1);
					</script>
	<%	
				}
			} else {
	%>
				<script>
					alert("아이디를 확인하세요.");
					history.go(-1);
				</script>
	<%	
			}
			
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
	%>
</body>
</html>