<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Tables</title>

    <!-- Custom fonts for this template -->
    <link
      href="vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />
	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />

    <!-- Custom styles for this page -->
    <link
      href="vendor/datatables/dataTables.bootstrap4.min.css"
      rel="stylesheet"
    />
    <script src="js/common.js"/></script>
    <script src="js/AttachmentFile.js"/></script>
  </head>

  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Sidebar -->
      <ul
        class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar"
      >
        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center"  href="/" >
          <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
          </div>
          <div class="sidebar-brand-text mx-3">게시판</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0" />

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapsePages"
            aria-expanded="true"
            aria-controls="collapsePages"
          >
            <i class="fas fa-fw fa-folder"></i>
            <span>Pages</span>
      </a>
          <div
            id="collapsePages"
            class="collapse"
            aria-labelledby="headingPages"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Login Screens:</h6>
              <!-- 비로그인시 로그인 / 로그인시 로그아웃 -->	
              <c:choose>
              	 <c:when test="${ empty  sessionScope.loginUser }">
		              <a class="collapse-item" href="/loginPage.me">Login</a>
		              <a class="collapse-item" href="/membership.me">membership</a>
              	 </c:when>
              	 <c:otherwise>
              	 	  <a class="collapse-item" data-toggle="modal" data-target="#logoutModal">Logout</a>
              	 </c:otherwise>
              </c:choose>
            </div>
          </div>
        </li>

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
            class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
          >
            <!-- Sidebar Toggle (Topbar) -->
            <form class="form-inline">
              <button
                id="sidebarToggleTop"
                class="btn btn-link d-md-none rounded-circle mr-3"
              >
                <i class="fa fa-bars"></i>
                
              </button>
            </form>

           <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
              <div class="topbar-divider d-none d-sm-block"></div>

              <!-- Nav Item - User Information -->
              <li class="nav-item dropdown no-arrow">
              <c:choose>
              	 <c:when test="${empty  sessionScope.loginUser }">
		               <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="userDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                <!-- 로그린시 닉네임 로그인 정보가 없으면 guest -->
    			             
                  <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                    >guest</span
                  >
                  <!-- 비로그인시 드롭박스 미작동 -->
                  <img
                    class="img-profile rounded-circle"
                    src="img/undraw_profile.svg"
                  />
                </a>
              	 </c:when>
              	 <c:otherwise>
              	 	  <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="userDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                <!-- 로그린시 닉네임 로그인 정보가 없으면 guest -->
    			             
                  <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                    >${sessionScope.loginUser.memberNickName }</span
                  >
                  <!-- 비로그인시 드롭박스 미작동 -->
                  <img
                    class="img-profile rounded-circle"
                    src="img/undraw_profile.svg"
                  />
                </a>
                <!-- Dropdown - User Information -->
                <div
                  class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="userDropdown"
                >
                  <a class="dropdown-item" href="#">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Profile
                  </a>

                  <div class="dropdown-divider"></div>
                  <a
                    class="dropdown-item"
                    href="#"
                    data-toggle="modal"
                    data-target="#logoutModal"
                  >
                    <i
                      class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"
                    ></i>
                    Logout
                  </a>
                </div>
              	 </c:otherwise>
              </c:choose>
                
              </li>
            </ul>
          </nav>
          <!-- End of Topbar -->

          <!-- Begin Page Content -->
          <div class="container-fluid h-100">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">게시판</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4 h-75" style="height: 90% !important">
              <div class="card-body">
                <!-- Basic Card Example -->
                <form action=""  class="h-100" id="PostEnrollForm" onsubmit="return false">
                  <div class="card shadow mb-4 h-100">
                    <div class="card-header py-3">
                      <div class="col-sm-11 float-left">
                      	<input type="hidden" id="postNo" value="${p.postNo}">
                        <input
                          type="text"
                          id="postTitle"
                          class="form-control"
                          placeholder="제목"
                          value="${p.postTitle}"
                        />
                      </div>
                      
                        <button
                          type="button"
                          class="btn btn-primary btn float-right ml-1"
                          onclick="UpdatePost();"
                        >
                          수정완료
                        </button>
                      
                    </div>
                    <div class="card-body h-100"  >
                      <textarea
                        id="postContent"
                        cols="30"
                        class="form-control h-100"
                        placeholder="내용"
                        style="resize: none">
${p.postContent}</textarea>
                    </div>
                    <div>첨부파일 <br>
	                   	<input type="file" onchange="addFile(this);" multiple />
	                   	<div class="file-list">
		                   <c:choose>
								<c:when test="${fn:length(pa) == 0}">
	                   		
		        					<div id="fileNo">
						            	<p class="name" style ="display: inline">선택된 파일 없음</p>	
						            </div>
								     
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="0" end="${fn:length(pa)-1}">
										
										 <div id="Orignalfile${i}" class="filebox">
											  <a href="resources/board_file/${ pa[i].changName}" target="_blank" >${ pa[i].originName }</a>
							                  <a class="delete" onclick="OrignaldeleteFile(${i},'Orignalfile','AttName')"><i class="far fa-minus-square"></i></a>
							                  <input type="hidden" id="AttName" value="${ pa[i].changName}">
							             </div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
	                     </div>	
                     </div>
                  </div>
                </form>
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
              <span>풋터</span>
            </div>
          </div>
        </footer>
        <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

   <!-- Logout Modal-->
    <div
      class="modal fade"
      id="logoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button
              class="close"
              type="button"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            로그아웃 하시겠습니까?
          </div>
          <div class="modal-footer">
            <a class="btn btn-primary" href="/logout.me">확인</a>
            <button
              class="btn btn-secondary"
              type="button"
              data-dismiss="modal"
            >
              취소
            </button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <script >
    <!-- 첨부파일 관련 스크립트 -->	
	
    var OrignalfilesArr = new Array();
	<c:choose>
	<c:when test="${not empty  pa }">
		<c:forEach var="i" begin="0" end="${fn:length(pa)-1}">
			 OrignalfilesArr.push("${pa[i].changName}");
		</c:forEach>
	</c:when>
	</c:choose>
	
	var DeleteOrignalfilesArr = new Array();
	var fileNo = 0
	var filesArr = new Array();
	var OrignalfilesCount = OrignalfilesArr.length
	
	
	
	
    </script>
	<script>
	function UpdatePost(file =""){
		
		 let postTitle = $("#PostEnrollForm input[id=postTitle]").val();
		 let postContent = $("#PostEnrollForm textarea[id=postContent]").val();
		 let postNo = $("#PostEnrollForm input[id=postNo]").val();
		 
		 let form =$("form")[0];
		 var formData = new FormData(form);
		 
		 formData.append("postTitle", postTitle);
		 formData.append("postContent", postContent);
		 formData.append("postNo", postNo);
		 for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		            formData.append("upfile", filesArr[i]);
		        }
		    }
			   
		 formData.append("DeleteOrignalfilesArr", DeleteOrignalfilesArr);
		let submet =  confirm("게시글을 수정하시겠습니까?");
		
		if(submet){
		 
		 failMsg = "게시글 수정에 실패하셨습니다."
		successMsg = "게시글 수정에 성공하셨습니다."
		move = '/detail.po?Pno='+postNo
		 AjaxCall('upDatePost.po',"POST",formData,updatePostCallBackFnc);
		 return false;
		}
	}
	
	function updatePostCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			Msg("게시글 수정에  실패하셨습니다.")
		}else{
			Msg("게시글 수정에  성공하셨습니다.")
			location.replace('/detail.po?Pno='+postNo.value)
		}
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
