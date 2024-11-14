<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
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

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link
      href="vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <script src="js/common.js"/></script>
  </head>

  <body class="bg-gradient-primary">
    <div class="container">
      <!-- Outer Row -->
      <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
          <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
              <!-- Nested Row within Card Body -->
              <div class="row">
                <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                <div class="col-lg-6">
                  <div class="p-5">
                    <div class="text-center">
                      <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                    </div>
                    <form class="user" id="LoginInformation" >
                      <div class="form-group">
                        <input
                          type="email"
                          class="form-control form-control-user"
                          aria-describedby="emailHelp"
                          placeholder="Enter Email Address..." id="memberEmail" name="memberEmail" value="${cookie.saveEmail.value}"
                        />
                      </div>
                      <div class="form-group">
                        <input
                          type="password"
                          class="form-control form-control-user"
                          placeholder="Password" id="memberPwd" name="memberPwd"
                        />
                      </div>
                      <div class="form-group">
                        <div class="custom-control custom-checkbox small">
                        <c:choose>
			              	 <c:when test="${not empty cookie.saveEmail}">
					      		  <input type="checkbox" class="custom-control-input" id="saveEmail" name="saveEmail" checked/>
                       			  <label class="custom-control-label" for="saveEmail">Remember Me</label>
			              	 </c:when>
			              	 <c:otherwise>
			              	 	   <input type="checkbox" class="custom-control-input" id="saveEmail" name="saveEmail"/>
                       			   <label class="custom-control-label" for="saveEmail">Remember Me</label>
			              	 </c:otherwise>
			              </c:choose>
                         
                        </div>
                      </div>
                      <button
                        onclick="login()" type="button" 
                        class="btn btn-primary btn-user btn-block"
                      >
                        로그인
                      </button>
                      </form>
                      <hr />
                    <div class="text-center">
                      <a class="small" href="/membership.me"
                        >Create an Account!</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	
	<!-- 로그인용 ajax 실행 -->
	<script>
    function login(){
      let memberEmail = $("#LoginInformation input[id=memberEmail]").val();
      let memberPwd = $("#LoginInformation input[id=memberPwd]").val();
      let saveEmail =  "";

      if($("#saveEmail")[0].checked){
    	  saveEmail = 'y'
      }else{
    	  saveEmail = 'n'
      }

		let formData = new FormData();
		 
		 formData.set("memberEmail", memberEmail);
		 formData.set("memberPwd", memberPwd);
		 formData.set("saveEmail", saveEmail);
    AjaxCall('login.me',"POST",formData,loginCallBackFnc);
    }
    function loginCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			Msg("로그인에 실패하셨습니다.")
		}else{
			Msg("로그인에 성공하셨습니다.")
			location.replace("/")
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
  </body>
</html>
