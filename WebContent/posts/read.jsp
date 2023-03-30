<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <style>
 
 </style>
<h1>게시글정보</h1>
<div class="row justify-content-center my-3">
	<div class="col-md-6">
		<div class="card">
			<div class="card-body">
				<h5><b>📌 ${post.id} | ${post.title}</b></h5>
				<hr/>
				<p class="pt-2">${post.body}</p>
			</div>
			<div class="card-footer text-muted">
				Posted on ${post.date} by ${post.writer}
			</div>
		</div>
		<h1>댓글등록</h1>
		<div class="card">
			<c:if test="${uid != null}">
				<div class="card-body">
					<form name="frm">
						<textarea rows="3" name="body" class="form-control" placeholder="내용을 입력하세요!"></textarea>
						<button class="btn btn-primary btn-sm" type="submit">등록</button>
					</form>
				</div>
			</c:if>
			</div>
		
				<h1>댓글목록</h1>
				<div id="comments"></div>
		</div>
		<script id="temp" type="text/x-handlebars-template">
			{{#each list}}
				<div class="card mb-2">
					<div class="card-body">
						<p>[{{id}}] {{body}}</p>
					</div>
						<div class="text-end my-2 mb-2" style={{show writer}}>
							<button class="btn btn-danger btn-sm delete" cid={{id}}>삭제</button>						
						</div>
					<div class="card-footer muted">
						Posted on {{date}} by {{writer}}
					</div>
				</div>
			{{/each}}
		</script>
		
		<script>
		Handlebars.registerHelper("show", function(writer) {
		    let uid = "${uid}";
		    if(writer != uid) return "display:none";
		});
		</script>
		
		<div class="container">
		    <nav aria-label="Page navigation">
		        <ul class="pagination justify-content-center" id="pagination"></ul>
		    </nav>
		</div>
	<jsp:include page="/modal.jsp"/>
</div>

<script>
	let page = 1;
	let postid = "${post.id}";
	let uid = "${uid}"
	getList(page);
	
	$("#comments").on("click",".delete",function(){
		let id = $(this).attr("cid");
		if(!confirm(id+"번 댓글을 삭제하시겠습니까?"))return;
		$.ajax({
			type:"post",
			url:"/comments/delete",
			data:{id:id},
			success:function(){
				getList(1);
			}
		})
		
	})
		
	
	$(frm).on("submit",function(e){
		e.preventDefault();
		let body = $(frm.body).val();
		if(body==""){
			$("#alert").modal("show");
			$("#alert .modal-body").html("댓글내용을 입력하세요!");
		}else{
			$.ajax({
				type:"post",
				url:"/comments/insert",
				data:{body:body,postid:postid,writer:uid},
				success:function(){
					$(frm.body).val("");
					getList(1);
				}
			})
		}
	})

	
	function getList(page){
		let size = 3;
		$.ajax({
			type:"get",
			data:{postid:postid,page:page,size:size},
			dataType:"json",
			url:"/comments.json",
			success:function(data){				
				let temp = Handlebars.compile($("#temp").html());
				$("#comments").html(temp(data));
			}
		})
	}
	

		
	
	

</script>