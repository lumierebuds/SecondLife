<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<br>
	<div align="center">
		
		<%-- <br><br>
		<h1 style="font-weight:bold;">${alertMsg}</h1> --%>
	</div>
	
	<script>
	${alertMsg}
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>