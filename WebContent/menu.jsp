<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<nav class="navbar navbar-expand-lg bg-light py-3">
  <div class="container-fluid">
    <a class="navbar-brand" href="/posts">Logo</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">  
      <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">회사소개</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/posts">게시글</a>
        </li>
        <c:if test="${uid == null}">
        	<li class="nav-item">
         	 <a class="nav-link active" aria-current="page" href="/login">로그인</a>
        </li> 
        </c:if>  
        <c:if test="${uid != null}">
        	<li class="nav-item">
         	 <a class="nav-link active" aria-current="page" href="/logout">로그아웃</a>
        </li> 
        </c:if>  
        <c:if test="${uname != null}">
        	<li class="nav-item">
         	 <a class="nav-link active" aria-current="page" href="/mypage">${uname}님</a>
        </li> 
        </c:if> 
      </ul>
    </div>
  </div>
</nav>