<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Tables</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet" />

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />

<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/common.js"/></script>
</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">게시판</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0" />

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages">
					<i class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<!-- 비로그인시 로그인 / 로그인시 로그아웃 -->
						<c:choose>
							<c:when test="${ empty  sessionScope.loginUser }">
								<a class="collapse-item" href="/loginPage.me">Login</a>
								<a class="collapse-item" href="/membership.me">membership</a>
							</c:when>
							<c:otherwise>
								<a class="collapse-item" data-toggle="modal"
									data-target="#logoutModal">Logout</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link" href="/"> <i
					class="fas fa-fw fa-table"></i> <span>Tables</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block" />

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><c:choose>
								<c:when test="${empty  sessionScope.loginUser }">
									<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <!-- 로그린시 닉네임 로그인 정보가 없으면 guest -->

										<span class="mr-2 d-none d-lg-inline text-gray-600 small">guest</span>
										<!-- 비로그인시 드롭박스 미작동 --> <img
										class="img-profile rounded-circle"
										src="img/undraw_profile.svg" />
									</a>
								</c:when>
								<c:otherwise>
									<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <!-- 로그린시 닉네임 로그인 정보가 없으면 guest -->

										<span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.loginUser.memberNickName }</span>
										<!-- 비로그인시 드롭박스 미작동 --> <img
										class="img-profile rounded-circle"
										src="img/undraw_profile.svg" />
									</a>
									<!-- Dropdown - User Information -->
									<div
										class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
										aria-labelledby="userDropdown">
										<a class="dropdown-item" href="#"> <i
											class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
											Profile
										</a>

										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#" data-toggle="modal"
											data-target="#logoutModal"> <i
											class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
											Logout
										</a>
									</div>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid h-100"style="height: 98% !important;">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">게시판</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4 h-75" style="height: 85% !important">
						<div class="card-body">
							<!-- Basic Card Example -->
							<div class="card shadow mb-4 h-100">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary btn float-left">
										${p.postTitle}</h6>

									<c:choose>
										<c:when
											test="${ sessionScope.loginUser.memberNickName eq p.memberNo }">
											<a href="upDatePage.po?Pno=${p.postNo}">
												<button type="button"
													class="btn btn-primary btn float-right ml-1">
													수정</button>
											</a>
											<button type="button" class="btn btn-danger btn float-right"
												onclick="deletePost(${p.postNo});">
												삭제</button>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>


								</div>
								<div class="card-body navbar-nav-scroll"
									style="height:auto !important">
									${p.postContent}</div>
								<div class="card-body fileUpLoad" style="flex: unset;" >
									<label class="fileUpLoadBtn">첨부파일</label>
									<div id="fileName" class="fileName">

										<c:choose>
											<c:when test="${fn:length(pa) == 0}">
						                    		첨부파일이 없습니다.
						                    </c:when>
											<c:otherwise>
											<c:forEach var="pa" items="${pa}" varStatus="status">
												<a href="resources/board_file/${ pa.changName}" download="${ pa.originName }">${ pa.originName }</a><br>
											</c:forEach>
												
											</c:otherwise>
										</c:choose>


									</div>
								</div>
								<div class="card-footer">
										
										<ul id="commentDiv"
											style="max-height: 500px; overflow-y: scroll; overflow-x: hidden;">


										</ul>
									<c:choose>
										<c:when test="${ empty  sessionScope.loginUser }">

										</c:when>
										<c:otherwise>
											<form  method="post" class="flex"
												id="rePlyForm" name="rePlyForm"> 
												
												<input type="hidden" id="postNo" value="${p.postNo}">
												<!-- <input type="hidden" name="replyLevel" value=""> -->
												<textarea id="replyContent" cols="30" row="5"
													name="replyContent" class="form-control flex"
													style="width: 90%" maxlength="100"
													placeholder="내용
                         " required></textarea>

												<a class="commentAdd flex" style="width: 9%">
													<button type="button" onclick="insertComment();" class="btn btn-primary btn ml-1"
														style="margin-top: 0.75rem; width: 100%">등록</button>
												</a>
												
											 </form>
										</c:otherwise>
									</c:choose>


								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃 하시겠습니까?</div>
				<div class="modal-footer">
					<a class="btn btn-primary" href="/logout.me">확인</a>
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- div 생성용 스크립트 -->
	<script type="text/html" id="NoReply">
		<li>
			<div class="commentDiv" style="height: 50px;text-align: center;"> 
				작성된 댓글이 없습니다. 
			</div>
		</li>
	</script>
	<script type="text/html" id="ListReply">
		<li data-no="" data-name="" data-date="" data-parent="" data-replyLevel="" id="replyLi" class="replyLi">
			<div class="commentDiv" >
				<div class="commentHead">
					<div class="commentHead1">
						<div class="commentName"></div>
						<div class="commentDate"></div>
					</div>
					<div class="commentHead2">	 
						<div class="commentReply" onclick="insertReply(event);" style="display:none">답글</div>
						<div class="commentModify" onclick="UpdateReply(event);" style="display:none">수정</div>
						<div class="commentRemove" onclick="removeReply(event);" style="display:none">삭제</div>
						<div class="commentCancle" onclick="lodingReply();" style="display:none">취소</div>
					</div>
				</div>
				<div class="comment">
					<p id="comment"></p> 
				</div>  
			</div>
			<hr class="sidebar-divider d-none d-md-block">
		</li>
	</script>	
	<script type="text/html" id="InReply">
		<li id="insertForm">
			<div class="replyCommentDiv">
				<div class="replyCommentForm" id="replyCommentForm">
					<input type="hidden" id="postNo" value="${p.postNo}">
					<input type="hidden" id="parentNo" value="">
					<input type="hidden" id="replyLevel" value="">
					<textarea id="replyContent" cols="30" row="5"
					name="replyContent" class="form-control flex"
					style="width: 90%;display: inline-block;vertical-align :middle"
					placeholder="내용" maxlength="100" required></textarea>
					<a class="commentAdd flex" style="width: 9%; display: inline-block;">
						<button type="butten" onclick="insertcommentReply()" class="btn btn-primary btn ml-1"
							style="margin-top: 0.75rem; width: 100% ">등록</button>
					</a>
				</div>
			</div>
			<hr class="sidebar-divider d-none d-md-block">
		</li>
	</script>
	<script type="text/html" id="UpReply">
		<div class="UpdateReplyForm" id="UpdateReplyForm">
            <input type="hidden" id="postNo" value="${p.postNo}">
            <input type="hidden" id="replyNo" value="">
            <textarea id="replyContent" cols="30" row="5"
            	name="replyContent" class="form-control flex"
            	style="width: 90%;display: inline-block;vertical-align :middle"
            	placeholder="내용" maxlength="100" required></textarea>
            <a class="commentAdd flex" style="width: 9%; display: inline-block;">
            	<button type="butten" onclick="UpdatecommentReply()" class="btn btn-primary btn ml-1"
            		style="margin-top: 0.75rem; width: 100% ">등록</button>
            </a>
        </div>
	</script>
	

	<!-- DIV 출력용 -->
	<script>
	$(document).ready(function() {
		lodingReply();
	});
	
    function lodingReply(){
    	
    	let formData = new FormData();
		formData.set("pno", ${p.postNo});
		
		 AjaxCall('selectReply.re',"POST",formData,successSelectReplyFnc);
    }
    function insertReply(event){
		let li = event.target.closest("li");
		let liId = event.target.closest("li").id
		
		$("#UpdateReplyForm").remove();
		$("#insertForm").remove();
		resetCss();
		
		let parentNo = li.dataset.no
		let replyLevel = Number(li.dataset.replylevel)+1 /* 데이터를 넘기기 전 replyLevel+1 */
		$("#"+liId).find('.commentReply').css("display","none") 
		$("#"+liId).find('.commentModify').css("display","none") 
		$("#"+liId).find('.commentRemove').css("display","none") 
		$("#"+liId).find('.commentCancle').css("display","block") 
		
		$(".comment").css("display", "block");
		
   	   	let InsertDiv = $('#InReply')[0].firstChild; 
		  // 노드 복사하기 (deep copy)
		let cloneDiv = InsertDiv.cloneNode(true); 
		li.insertAdjacentHTML('afterend', cloneDiv.nodeValue);
   	   	$('#replyCommentForm input[id=parentNo]').val(parentNo);
   	    $('#replyCommentForm input[id=replyLevel]').val(replyLevel);
   	 	$(".replyCommentDiv").css("padding-left", (20+(replyLevel-1)*10)+'px')
	}
	function UpdateReply(event){		
		
 		let li = event.target.closest("li");
 		let liId = event.target.closest("li").id
 		
		$("#UpdateReplyForm").remove();
		$("#insertForm").remove();
		resetCss()
		
		let commentHead = $("#"+liId).find(".commentHead")
		let comment = $("#"+liId).find(".comment")
		let commentText = $("#"+liId).find(".comment").html()
		let commentTextStartIndex = commentText.indexOf("&nbsp")+6;
		let commentTextEndIndex = commentText.indexOf("</p>")
		let Usecomment = ""
			
		if(li.dataset.parent == '0'){
			Usecomment = commentText.slice(3,commentTextEndIndex).replaceAll('<br>',"\n")
		}else{
			Usecomment = commentText.slice(commentTextStartIndex,commentTextEndIndex).replaceAll('<br>',"\n")
		}
		
		let replyNo = li.dataset.no
		
			$("#"+liId).find(".commentReply").css("display","none") 
		$("#"+liId).find(".commentModify").css("display","none") 
			$("#"+liId).find(".commentRemove").css("display","none") 
		$("#"+liId).find(".commentCancle").css("display", 'block' )
		
		$(".comment").css("display", "block");
		
		comment.css("display","none") 
		let UpdateDiv = $('#UpReply')[0].firstChild; 

		// 노드 복사하기 (deep copy)
		let cloneDiv = UpdateDiv.cloneNode(true); 
   	   	
	    commentHead.after(cloneDiv.nodeValue);
   	   	$('#UpdateReplyForm input[id=replyNo]').val(replyNo);
   	   	$('#UpdateReplyForm textarea[id=replyContent]').val(Usecomment.replaceAll('&nbsp;'," "));
 	}
	</script>
		<!-- 작성,수정,삭제용 Ajax -->
	<script>
	function deletePost(file =""){
		let submet =  confirm("게시글을 삭제하시겠습니까?");
		if(!submet){
			Msg("게시글 삭제 취소")
			return false
		}
		let formData = new FormData();
		formData.set("pno", ${p.postNo});
		formData.set("file", file)
		AjaxCall('delete.po',"POST",formData,deletePostCallBackFnc);
	}
	
	
	function insertComment() {
		let replyContent = $("#rePlyForm textarea[id=replyContent]").val();

		let formData = new FormData();
		formData.set("postNo", ${p.postNo});
		formData.set("replyContent", replyContent)
		 AjaxCall('insertReply.re',"POST",formData,insertCommentCallBackFnc);
	}
	
	
	function removeReply(event){
		let Rno = event.target.closest("li").dataset.no
		let submet =  confirm("댓글을 삭제하시겠습니까?");
		
		if(submet){
			let formData = new FormData();
			formData.set("replyNo", Rno);
			formData.set("postNo", ${p.postNo});
			
			 AjaxCall('deleteReply.re',"POST",formData,deleteCommentCallBackFnc);
		}
	}
	function deletePostCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			Msg("게시글 삭제에 실패하셨습니다.")
		}else{
			Msg("게시글 삭제에 성공하셨습니다.")
			location.replace('/')
		}
	}
	function insertcommentReply() {
		let parentNo = $('#replyCommentForm input[id=parentNo]').val();
		let replyLevel = $('#replyCommentForm input[id=replyLevel]').val();
		let replyContent = $('#replyCommentForm textarea[id=replyContent]').val();
		
		let formData = new FormData();
		formData.set("postNo", ${p.postNo});
		formData.set("parentNo", parentNo);
		formData.set("replyLevel", replyLevel);
		formData.set("replyContent", replyContent);
		 AjaxCall('insertReply.re',"POST",formData,insertReplyCallBackFnc);
	}
	
	
	function successSelectReplyFnc(result){
		$("#commentDiv").empty(); 
		if(result.length == 0){
			let NoReply = $('#NoReply')[0].firstChild; 
			  // 노드 복사하기 (deep copy)
			let cloneDiv = NoReply.cloneNode(true); 
			$("#commentDiv").append(cloneDiv.nodeValue);
		}else{
			let ListReply = $('#ListReply')[0].firstChild; 
			$.each(result , function(i){
				let cloneDiv = ListReply.cloneNode(true); 
				$("#commentDiv").append(cloneDiv.nodeValue);
			    // 노드 복사하기 (deep copy)
				let id = "replyLi"+i
				let idid = "#replyLi"+i
				$('#replyLi')[0].setAttribute("id", id);
				$("#"+id)[0].setAttribute('data-no', result[i].replyNo)	 
				$("#"+id)[0].setAttribute('data-name', result[i].memberNo)	 
				$("#"+id)[0].setAttribute('data-date', result[i].replyEnrollDate)	 
				$("#"+id)[0].setAttribute('data-parent', result[i].parentNo)	 
				$("#"+id)[0].setAttribute('data-replyLevel', result[i].replyLevel)	 
				
				$("#"+id).find('.commentDiv').css("paddingLeft",(20+result[i].replyLevel*10)+"px")
				   if(result[i].replyStatus == 'Y'){
					   $("#"+id).find('.commentName').text(result[i].memberNo)
					   $("#"+id).find('.commentDate').text(result[i].replyEnrollDate)
		                if(${not empty  sessionScope.loginUser}){
		                		$("#"+id).find('.commentReply').css("display","block")
 		                        if (${ sessionScope.loginUser.memberNickName eq p.memberNo } && "${sessionScope.loginUser.memberNickName}" == result[i].memberNo ){
	                        		$("#"+id).find('.commentModify').css("display","block")
									$("#"+id).find('.commentRemove').css("display","block")  
		                        }else if(${sessionScope.loginUser.memberNickName eq p.memberNo } && "${sessionScope.loginUser.memberNickName}" != result[i].memberNo ){
									$("#"+id).find('.commentRemove').css("display","block")
		                        }else if(${  sessionScope.loginUser.memberNickName ne p.memberNo } && "${sessionScope.loginUser.memberNickName}" == result[i].memberNo ){
	                        		$("#"+id).find('.commentModify').css("display","block")
									$("#"+id).find('.commentRemove').css("display","block") 
		                        }
		                        	
		                } 
		            $("#"+id).find('.comment').html( "<p>"+result[i].replyContent+"</p>" )
		            }else{
		            	$("#"+id).find('.commentHead1').html("")
		            	$("#"+id).find('.commentHead2').html("")
		            $("#"+id).find('.comment').html( "<p>삭제된 댓글입니다</p>")
		            }		
			});
		} 
	}
	function insertCommentCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			Msg("댓글 작성에 실패하셨습니다.")
		}else{
			Msg("댓글 작성에 성공하셨습니다.")
			location.replace('')
		}
	}
	function UpdatecommentReply() {
		let replyNo = $("#UpdateReplyForm input[id=replyNo]").val();
		let replyContent = $("#UpdateReplyForm textarea[id=replyContent]").val();
		
		let formData = new FormData();
		formData.set("postNo", ${p.postNo});
		formData.set("replyNo", replyNo);
		formData.set("replyContent", replyContent);
		 AjaxCall('UpdateReply.re',"POST",formData,UpdateCommentCallBackFnc);
	}
	function deleteCommentCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			Msg("댓글 삭제에 실패하셨습니다.")
		}else{
			Msg("댓글 삭제에 성공하셨습니다.")
			location.replace('')
		}
	}
	function insertReplyCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			Msg("답글 작성에 실패하셨습니다.")
		}else{
			Msg("답글 작성에 성공하셨습니다.")
			location.replace('')
		}
	}
	function UpdateCommentCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			Msg("댓글 수정에 실패하셨습니다.")
		}else{
			Msg("댓글 수정에 성공하셨습니다.")
			location.replace('')
		}
	}
	</script>
	<!-- DIV 버튼 출력 제어용 -->
	<script>
	function resetCss(){
		$(".commentReply").css("display", "block");
		$(".commentModify").css("display", "block");
		$(".commentRemove").css("display", "block");
		$(".commentCancle").css("display", "none");
	}
	</script>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
</body>
</html>