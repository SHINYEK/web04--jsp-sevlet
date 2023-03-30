<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>게시글</h1>

<div class="row justify-content-center my-2">
	<div class="col-md-8">
		<div id="posts"></div>
	</div>
</div>
<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center" id="pagination"></ul>
    </nav>
</div>
<script id="temp" type="text/x-handlebars-template">
	<span>전체게시물수: </span><span id="total"></span>
	<table class="table table-striped">
		<tr class="text-center">
			<td>id</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
	{{#each list}}
		<tr class="text-center">
			<td>{{id}}</td>
			<td class="text-start"><div class="ellipsis"><a href="/posts/read?id={{id}}">{{title}}</a></div></td>
			<td>{{writer}}</td>
			<td>{{date}}</td>
		</tr>
	{{/each}}
	</table>
</script>

<script>
	getList(1);
	
	function getList(page){
		let size = 5;
		
		$.ajax({
			type:"get",
			data:{page:page,pageSize:size},
			dataType:"json",
			url:"/posts.json",
			success:function(data){
				pagination(data.total, size);
				let temp = Handlebars.compile($("#temp").html());
				$("#posts").html(temp(data));
				$("#total").html(data.total);
			}
		})
	}
	

</script>