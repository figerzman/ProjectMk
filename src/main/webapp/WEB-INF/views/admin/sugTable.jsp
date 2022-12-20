<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dowajo - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
   <script type="text/javascript" src="resources/js/sugTable_js.js"></script>
<link href="resources/css/toilet_css.css" rel="stylesheet">
<script src="resources/vendor/jquery/jquery.min.js"></script>
<link rel="icon" href="resources/img/dowajo-favicon.ico">
</head>
</head>
<script type="text/javascript">
$(function () {
	$('.collapse show').attr('class','collapse')
	$('#collapseTwo').attr('class','collapse show')
	$('#SuggestionsList').css({"color":"#d55353","font-weight": "bold"})
})
</script>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:import url="../default/navigator.jsp"/>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Suggestions List</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>고유번호</th>
                                            <th>제목</th>
                                            <th>글내용</th>
                                            <th>작성일</th>
                                            <th>읽음/안읽음</th>                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>고유번호</th>
                                            <th>제목</th>
                                            <th>글내용</th>
                                            <th>작성일</th>
                                            <th>읽음/안읽음</th>                                          
                                         </tr>
                                    </tfoot>                                    
                                    <tbody>
                                       <c:forEach var="sugList" items="${sugList}">	
                                       		<tr>
                                       			<td> ${sugList.sugNo }</td>
                                       			<td><a href="#" onclick="sugDetailPop(${sugList.sugNo })">${sugList.sugSubject }</a></td>
                                       			<td>   
													<c:choose>
														<c:when test="${fn:length(sugList.sugContent) > 5}">														
															${fn:substring(sugList.sugContent, 0, 3)}...														
														</c:when>														
														<c:otherwise>													
															${sugList.sugContent}														
														</c:otherwise>														
													</c:choose>
  
												</td>                           			
                                       			<td> ${sugList.sugRegDate }</td>
                                       			<c:if test="${sugList.sugReadCk eq 'Y' }">
	                                       			<td>이미 읽었습니다.</td>                                       			
                                       			</c:if>
                                      			<c:if test="${sugList.sugReadCk eq 'N' }">
	                                       			<td>아직 안읽었습니다.</td>                                       			
                                       			</c:if>
                                       		</tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login">Logout</a>
                </div>
            </div>
        </div>
    </div>
      <div class="layer-popup" id="layer-popup-sug-Detail">
         <div class="modal-dialog">
            <div class="modal-content">
            <!-- <button onclick="bb()">xxx</button> -->
     	          <input type="text" id="sugSubject" name="sugSubject" readonly="readonly" style="border:none;border-bottom:1px solid black;width: 100%;" placeholder="제목입력"><br>   
          	     <textarea id="sugContent" name="sugContent" readonly="readonly" style="width: 100%;height: 6.25em; border: none; resize: none;" placeholder="내용입력" ></textarea><br><br><br>       
               <button class="popBtn" onclick="sugClose()"><span id="btn-span">닫기</span></button>
            </div>
         </div>
      </div>
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/datatables-demo.js"></script>

</body>
</html>