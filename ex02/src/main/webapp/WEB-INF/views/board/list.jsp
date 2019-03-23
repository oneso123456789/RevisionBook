<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@ include file="../includes/header.jsp" %>	

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board List Page
                            <button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <!-- 
                        	이 태그에서 list.jsp페이지에  id="dataTables-example"를 이용해 예제를 불러와서 id부분을 제거함
                        	부트스트랩 사용시 이 example 부분 제거할것
                            <table  class="table table-striped table-bordered table-hover" id="dataTables-example">
                             -->
                            <table  class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                
                                <c:forEach items="${list}" var="board">
                                <tr>
                                	<td><c:out value="${board.bno}" /></td>
                                	<%-- <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'>
                                	<c:out value="${board.title}"/></a></td> --%>
                                	<td><a class='move' href='<c:out value="${board.bno}"/>'>  
                                	       <c:out value="${board.title}" />                   	
                                	</a></td>
                                	<td><c:out value="${board.writer }" /></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}" /></td>
                                </tr>
                                </c:forEach>
                            </table><!--  table태그의 끝 -->
                            
                             <div class='pull-right'>
                            	<ul class="pagination">
                            	
                            		<c:if test="${pageMaker.prev}">
                            			<li class="paginate_button previous"><a
                            				 href="${pageMaker.startPage -1}">Previous</a></li>
                            		</c:if>
                            	
                            		<c:forEach var="num" begin="${pageMaker.startPage}" 
                            			end="${pageMaker.endPage}">
                            			<li class="paginate_button	${pageMaker.cri.pageNum == num ? "active":""} ">
                            				<a href="${num}">${num}</a>
                            			</li>
                            		</c:forEach>
                            	
                            		<c:if test="${pageMaker.next}">
                            			<li class="paginate_button next">
                            				<a href="${pageMaker.endPage +1 }">Next</a>
                            			</li>
                            		</c:if>
                            	</ul>
                            </div>
                            <!-- end Pagination -->
                            </div>
                            
                            <form id='actionForm' action="/board/list" method='get'>
                            	<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
                            	<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
                            </form>
                            
                            
                            <!--  Modal 추가 -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                              aria-labelledby="myModalLabel" aria-hidden="true">
                              <div class="modal-dialog">
                              	<div class="modal-content">
                              		<div class="modal-header">
                              			<button type="button" class="close" data-dismiss="modal"
                              			aria-hidden="true">&times;</button>
                              			<h4 class="modal-title" id="myModalLabel">Modal title</h4>
                              		</div>
                              		<div class="modal-body">처리가 완료되었습니다.</div>
                              		<div class="modal-footer">
                              			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              			<button type="button" class="btn btn-primary">Save changes</button>
                              		</div>
                              	</div>
                              	<!-- /.modal-content -->
                              </div>
							  <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
 <script type="text/javascript">
 	$(document).ready(function(){
 		
 		var result = '<c:out value="${result}"/>';
 		
 		checkModal(result);
 		
 		history.replaceState({}, null, null);
 		
 		function checkModal(result){
 			
 			if(result === '' || history.state){
 				return;
 			}
 			
 			if(parseInt(result) > 0){
 				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
 			}
 			
 			$("#myModal").modal("show");
 		}
 		
 		$("#regBtn").on("click", function(){
 			
 			self.location = "/board/register";
 			
 		});
 		
 		var actionForm = $("#actionForm");
 		
/*  		
 	$(".paginate-button a").on("click", function(e){ 라고 적어서 계속 찾고있었음
	 제발 오류 찾으면 일단 원본이랑 교제 견본이랑 비교사이트 가서 비교부터 할것
	 -로 표시 거의 안함 _표시 기억할것
	 
 }
 */
 		$(".paginate_button a").on("click", function(e){
 			
 			e.preventDefault();
 			
 			console.log('click');
 			
 			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
 			actionForm.submit();
 		});
 
 		$(".move").on("click", function(e){
/*
			value='" 다음에 +꼭 포함하고 끝나고 닫을때도 + 꼭 포함해야함
*/
 			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"
 								+ $(this).attr(
 										"href")
 								+ "'>");
 			actionForm.attr("action", "/board/get");
 			actionForm.submit();

 			
 		});
 		
 	});
 </script>
 <%@include file="../includes/footer.jsp" %>          