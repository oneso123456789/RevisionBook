<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Read</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!--  /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			
				<div class="panel-heading">Board Read Page</div>
			</div>
			<!-- /.panel panel-default -->
			<div class="panel-body">
					
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name='bno'
							value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'
							value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out value="${board.content}" /></textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>
					
<%-- 				<button data-oper='modify' class="btn btn-default" onclick="">
							<a href="/board/modify?bno=<c:out value="${board.bno}"/>">Modify</a></button>
		
					<button data-oper='list' class="btn btn-info">
							<a href="/board/list">List</a></button> --%>
							
					<button data-oper='modify' class="btn btn-default" >
							Modify</button>
							
					<button data-oper='list' class="btn btn-info" >
							List</button>
							
					<form id='operForm' action="/board/modify" method="get">
						<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
					</form>
					
					
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->
	
	<script>

	function goList(){
		/*
			만든이유: 파이어 폭스에서 그냥<button>태그에 onclick='/board/list'를 사용하면 안넘어감(파이어 폭스는 <button>을 기본적으로 submit으로 사용함)
			2019-02-01
			
			 다른 방식으로 전환해서 필요없어 보임
			2019-02-08
		*/
		window.location.href = "/board/list";

	}
	
	function goModify(){
		/*
			위와 같은 이유로 글 수정도 함수로 처리함
			 아직 수정처리를 안해서 이 방식으로 가능한건가 매핑 테스트 해봤는대 넘어가는거 같음
			 다시 수정 처리를 한후에 제대로 확인해볼것
			안될경우 다시 고민해서 처리할것
			2019-02-01
			
			다른 방식으로 전환해서 필요없어 보임
			2019-02-08
		*/
		
		window.location.href = "/board/modify?bno=<c:out value='${board.bno}'/>";
	}
	
	$(document).ready(function(){
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			
			operForm.attr("action","/board/modify").submit();
			
			
		});
		
		$("button[data-oper='list']").on("click", function(e){
			
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list")
			operForm.submit();
		});
	});
	</script>
<%@include file="../includes/footer.jsp"%>