<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Modify</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!--  /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			
				<div class="panel-heading">Board Modify</div>
			</div>
			<!-- /.panel panel-default -->
			<div class="panel-body">
			
			<form  role="form" action="/board/modify" method="post">
					
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name='bno'
							value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'
							value='<c:out value="${board.title }"/>'>
					</div>
					
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'><c:out value="${board.content}"/></textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>RegDate</label> <input class="form-control" name='regDate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />' readonly="readonly">
					</div>
					
						<div class="form-group">
					<label>Update Date</label> <input class="form-control" name='updateDate'
						value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updatedate }" />' readonly="readonly">
					</div>
					
<%-- 				<button data-oper='modify' class="btn btn-default" onclick="">
							<a href="/board/modify?bno=<c:out value="${board.bno}"/>">Modify</a></button>
		
					<button data-oper='list' class="btn btn-info">
							<a href="/board/list">List</a></button> --%>
							
					<button type="submit" data-oper='modify' class="btn btn-default" >Modify</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
					<button type="submit" data-oper='list' class="btn btn-info" >List</button>

			</form>		
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->
	

	<script>
	/*
		firefox browser사용시 list로 안가짐
		이 챕터 끝내고 해결할것
		2019-02-08 
	*/
	$(document).ready(function(){
		
		var formObj = $("form");
		
		$('button').on("click", function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/board/remove");
			}else if(operation === 'list'){
				//move to list
				formObj.attr("action", "/board/list").attr("method","get");
				formObj.empty();
			}
			
			formObj.submit();
			
		});
	});
	
	/*
	만든이유: 파이어 폭스에서 그냥<button>태그에 onclick='/board/list'를 사용하면 안넘어감(파이어 폭스는 <button>을 기본적으로 submit으로 사용함)
	위와 같은 이유로 글 수정도 함수로 처리함
	 아직 수정처리를 안해서 이 방식으로 가능한건가 매핑 테스트 해봤는대 넘어가는거 같음
	 다시 수정 처리를 한후에 제대로 확인해볼것
	안될경우 다시 고민해서 처리할것
	2019-02-01
	
	modify에서는 goList()와 goModify()가 필요가 없음
	*/
	
/* 	function goList(){

		window.location.href = "/board/list";

	}
	
	function goModify(){

		window.location.href = "/board/modify?bno=<c:out value='${board.bno}'/>";
	} */
	
	</script>
<%@include file="../includes/footer.jsp"%>