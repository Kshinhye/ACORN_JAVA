<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/test_jstl/navbar.jsp"></jsp:include>
	<div class="container">
<%-- 	//아래 c:choose를 자바 코드로 작성한다면 아래와 같다
		<%
			//세션 영역에 id라는 키갑스로 저장된 값이 있는지 읽어와본다. (없으면 null)
			String id=(String)session.getAttribute("id");
		%>
		<%if(id!=null){ %>
			<p>
				<a href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id%></a> 님 로그인중...
				<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
			</p>
		<%}else{ %>
			<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
		<%} %>
--%>
		<!-- JSTL: 클라이언트한테 그대로 노출되는게 아니라 결과만 보여줌. -->
		<c:choose> 
			<c:when test="${not empty sessionScope.id }">
				<p>
					<a href="${pageContext.request.contextPath }/users/private/info.jsp">${id }</a> 님 로그인중...
					<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
					<!-- 
					 context경로 필요에따라 바뀌거나 제거될 수 있다. 그래서 하드코딩이 context경로를 사용해야한다.
					 방법1(JSP): html영역에 el을 이용 => ${pageContext.request.contextPath}
					 방법2(JAVA): HttpServletRequest 객체의 .getContextPath()메소드로 호출하면 context path가 문자열로 리턴됨-->
				</p>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
			</c:otherwise>
		</c:choose>
		
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath }/private/study.jsp">회원전용공간(공부)</a></li>
			<li><a href="${pageContext.request.contextPath }/private/game.jsp">회원전용공간(게임)</a></li>
			<li><a href="${pageContext.request.contextPath }/file/list.jsp">자료실</a></li>
			<li><a href="${pageContext.request.contextPath }/cafe/list.jsp">글 목록보기</a></li>
		</ul>
	</div>
</body>
</html>








