<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<script src="/js/home.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/home.css"/>
<title>쇼핑몰</title>
</head>
<body>
	<div class="div_page">
		<div class="div_header">
			<img src="/image/back.jpg"/>
			<jsp:include page="/menu.jsp"></jsp:include>
		</div>
		<div class="div_content">
			<jsp:include page="${pageName}"></jsp:include>
		</div>
		<div class="div_footer">
			<h5>Copyright 2023 인천일보아카데미 All Right Reserverd</h5>
		</div>
	</div>
</body>
</html>