<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
</head>
<body>
	<h2>모든 회원들의 정보를 조회하는 페이지입니다. </h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>PASSWORD</th>
			<th>NAME</th>
			<th>JOINDATE</th>
		</tr>
	<%
		request.setCharacterEncoding("utf-8");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/my_login_ex1?serverTimezone=UTC";
			String dbId = "root";
			String dbPasswd = "1234";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPasswd);
			
			String sql = "SELECT * FROM MEMBER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String rId = rs.getString("id");
				String rPass = rs.getString("passwd");
				String rName = rs.getString("name");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String rDate = sdf.format(rs.getDate("joindate"));
				
	%>
				<tr align="center">
					<td><%=rId %></td>
					<td><%=rPass %></td>
					<td><%=rName %></td>
					<td><%=rDate %></td>
				</tr>
	<%
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
	%>	
	</table>

</body>
</html>