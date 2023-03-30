<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>로그인🔒</h1>
<div class="row justify-content-center">
	<div class="col-md-4">
		<div class="card">
			<div class="card.body p-3">
				<form name="frm">
					<input class="form-control mb-2" placeholder="아이디" name="uid" />
					<input class="form-control mb-2" type="password" placeholder="비밀번호" name="upass" />
					<button class="btn btn-primary mb-2" style="width:100%">로그인</button>
				</form>
			</div>
		</div>
	</div>	
</div>
<jsp:include page="/modal.jsp"/>

<script>
	$(frm).on("submit",function(e){
		e.preventDefault();
		let uid = $(frm.uid).val();
		let upass = $(frm.upass).val();
		if(uid==""){
			$("#alert").modal("show");
			$("#alert .modal-body").html("아이디를 입력하세요!");
		}else if(upass==""){
			$("#alert").modal("show");
			$("#alert .modal-body").html("비밀번호를 입력하세요!");
		}else{
			$.ajax({
				type:"post",
				url:"/login",
				data:{uid:uid,upass:upass},
				success:function(data){
					if(data==0){
						$("#alert").modal("show");
						$("#alert .modal-body").html(" 존재하지 않는 아이디입니다.!");
					}else if(data==2){
						$("#alert").modal("show");
						$("#alert .modal-body").html("비밀번호가 틀립니다!");
					}else{
						location.href = "/posts";
					}
				}
			})
		}
	})
</script>