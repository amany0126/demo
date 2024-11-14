<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>SB Admin 2 - Register</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet" />
<script src="js/addressApi.js"/></script>
<script src="js/common.js"/></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<style type="text/css">
.memberNickName , .memberPhone{
	-webkit-ime-mode:disabled;
	-moz-ime-mode:disabled;
	-ms-ime-mode:disabled;
	ime-mode:disabled;
}

</style>	
	
</head>

<body class="bg-gradient-primary">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회원가입</h1>
							</div>
							<form class="user" id="enrollForm">
								<div class="form-group " id="enrollForm">
									<input type="text" class="form-control form-control-user"
										placeholder="이름" name="memberNickName" id="memberNickName" 
										maxlength="10" required oninput ="InputControl(event,nickname)" onfocusout="checkNickname()" />
									<input type="hidden" id="checkNickName">
									<!-- 닉네임 사용가능 정보 기입용 -->
									<div id="checkNickNameResult" style="display: none;"></div>
									<!-- 닉네임 사용가능 유무 출력용 -->
									<input type="hidden" id="backUpNickName" name="backUpNickName">
								</div>
								<div class="form-group row">
									<div class="col-sm-9 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											placeholder="이메일주소" name="memberEmail" id="memberEmail" oninput="inputEmail(event);"
											required />
										<input type="hidden" id="checkMemberEmail">
										<!-- 닉네임 사용가능 정보 기입용 -->
										<div id="checkMemberEmailResult" style="display: none;"></div>
										<!-- 닉네임 사용가능 유무 출력용 -->	
										<input type="hidden" id="backUpEmail" name="backUpEmail">
									</div>
									<div class="col-sm-3">
										<button type="button" onclick="memberEmailCheck()"
											class="btn btn-primary btn-user btn-block">중복확인</button>
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											placeholder="비밀번호" name="memberPwd" id="memberPwd" required oninput="RemoveWhitespace(event)" onchange="pwdOk()"onfocusout="equalsPwd()"
											maxlength="15" />
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											placeholder="비밀번호 확인" name="checkPwd" id="checkPwd" required oninput="RemoveWhitespace(event)"  onchange="checkPwdOk()"onfocusout="equalsPwd()"
											maxlength="15" />
									</div>
									<input type="hidden" id="checkMemberPwd" name="checkMemberPwd" >
								</div>
								
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										placeholder="휴대폰번호" name="memberPhone" id="memberPhone" 
										required  maxlength="11" oninput ="InputControl(event,phone)"  onchange="phoneOk()" />
									<input type="hidden" id="checkMemberPhone" name="checkMemberPhone">	
								</div>
								
								<div class="form-group row">
									<div class="col-sm-9 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											placeholder="주소" id="memberAddress" name="memberAddress"
											readonly />
										<input type="hidden" id="backUpAddress" name="backUpAddress">	
									</div>
									<div class="col-sm-3">
										<button type="button" onclick="openAddressApi();"
											class="btn btn-primary btn-user btn-block">주소찾기</button>
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										placeholder="상세주소" id="memberDetalAddress"
										name="memberDetalAddress" />
									</div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
											placeholder="우편번호" id="memberAddressCode"
											name="memberAddressCode" readonly />
											<input type="hidden" id="backUpAddressCode" name="backUpAddressCode">	
										</div>
										<div class="col-sm-6">
											<input type="text" class="form-control form-control-user"
											placeholder="참고사항" id="memberAddressNote"
											name="memberAddressNote" readonly />
											<input type="hidden" id="backUpAddressNote" name="backUpAddressNote">
									</div>
									<input type="hidden" id="checkMemberAddress">
								</div>

								<button type="button" onclick="submetOnClick()" class="btn btn-primary btn-user btn-block">
									Register Account </button>
							</form>
							<hr />
							<div class="text-center">
								<a class="small" href="/loginPage.me">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	var memberNickName =  $("#enrollForm input[id=memberNickName]")
	var checkNickName =  $("#enrollForm input[id=checkNickName]")
	var backUpNickName =  $("#enrollForm input[id=backUpNickName]")
	var checkNickNameResult =  $("#checkNickNameResult")

	var memberEmail =  $("#enrollForm input[id=memberEmail]")
	var checkMemberEmail =  $("#enrollForm input[id=checkMemberEmail]")
	var backUpEmail =  $("#enrollForm input[id=backUpEmail]")
	var checkMemberEmailResult = $("#checkMemberEmailResult")

	var memberPwd =  $("#enrollForm input[id=memberPwd]")
	var checkPwd =  $("#enrollForm input[id=checkPwd]")
	var checkMemberPwd =  $("#enrollForm input[id=checkMemberPwd]")

	var memberPhone =  $("#enrollForm input[id=memberPhone]")
	var checkMemberPhone =  $("#enrollForm input[id=checkMemberPhone]")

	var memberAddress =  $("#enrollForm input[id=memberAddress]")
	var backUpAddress =  $("#enrollForm input[id=backUpAddress]")

	var memberDetalAddress =  $("#enrollForm input[id=memberDetalAddress]")

	var memberAddressCode =  $("#enrollForm input[id=memberAddressCode]")
	var backUpAddressCode =  $("#enrollForm input[id=backUpAddressCode]")

	var memberAddressNote =  $("#enrollForm input[id=memberAddressNote]")
	var backUpAddressNote =  $("#enrollForm input[id=backUpAddressNote]")

	var checkMemberAddress =  $("#enrollForm input[id=checkMemberAddress]")
	</script>

	<!-- 입력방지용 정규식 검사 -->
	<script>
	/* 닉네임 */
/* 	function inputNickName(event) {
		InputControl(event,nickname);
	}; */
	/* 이메일 */
	function inputEmail(event) {
		InputControl(event,email);
		
		checkMemberEmailResult.hide()
		checkMemberEmail.val("N")
	};
	/* 전화번호 */
/* 	function inputPhone(event) {
		InputControl(event,phone);
	}; */
	/* 공백제거 */
/* 	function inputblankness(event) {
		RemoveWhitespace(event)
	}; */
		
	</script>	
		
	<!-- 중복 검사용 / 일치여부 검사용 -->	
	<script>	
	/* 닉네임 중복 검사용 Ajax */
	function checkNickname(){
		
		if(memberNickName.val().length <=0){
			checkNickNameResult.hide();
			checkNickName.val("N");
			return false;
		}
		
		let formData = new FormData();
		formData.set("nickNameCheck", memberNickName.val());
		AjaxCall('nickNameCheck.me',"POST",formData,nickNameCallBackFnc)
	}
	/* 이메일 중복 검사용 Ajax */
	function memberEmailCheck(){
	
		if(memberEmail.val().length <=0){
			checkMemberEmailResult.hide();
			checkMemberEmail.val("N");
			return false;
		}
		
		if(!email.test(memberEmail.val())){
			checkMemberEmailResult.text("유효하지 않은 이메일 형식입니다").show().css("color","red");
			checkMemberEmail.val("N");
			return false;
		}
		
		let formData = new FormData();
		formData.set("memberEmailCheck", memberEmail.val());
		AjaxCall('memberEmailCheck.me',"POST",formData,emailCallBackFnc)
		
	}
	/* 전화번호 형식 검사용 */
	function phoneOk(){
		if(memberPhone.val().length == 0){
			return false;
		}
		if(memberPhone.val().length != 11){
			Msg("유효하지 않은 전화번호입니다. -를 제외한 11자리 전화번호를 입력해주세요");
			checkMemberPhone.val("N")
			return false;
		}
		condition = phone.test(memberPhone.val())
		successMsg = "사용 가능한 전화번호입니다."
		failMsg = "유효하지 않은 전화번호입니다. -를 제외한 11자리 전화번호를 입력해주세요"
		BooleanAllFnc(condition,successMsg,failMsg,checkMemberPhone)
	}
	
	/* 비밀번호 형식 검사용 */
	function pwdOk(){
		if(memberPwd.val() == null || memberPwd.val() == ""){
			return false;
		}
		
		condition = password.test(memberPwd.val().trim())
		successMsg = "사용 가능한 비밀번호입니다."
		failMsg = "문자,숫자,특수문자를 조합하여 8~15자리 비밀번호로 작성해주세요"
	    BooleanMsgFnc(condition,successMsg,failMsg)
	}
	/* 비밀번호 일치 확인 */
	function checkPwdOk(){
		if(memberPwd.val() == null || memberPwd.val() == "" || checkPwd.val() == null || checkPwd.val() == ""){
			return false;
		}
		
		condition = checkPwd.val() == memberPwd.val()
		successMsg = "비밀번호가 일치합니다"
		failMsg = "비밀번호가 일치하지 않습니다."
		BooleanMsgFnc(condition,successMsg,failMsg)
	}
	/* 비밀번호 일치 결과 확인용 */
	function equalsPwd(){
		
		if(memberPwd.val() == null || checkPwd.val() == null){
			checkMemberPwd.val("N");
			return false;
		} 
		
		condition = password.test(memberPwd.val()) && checkPwd.val() == memberPwd.val()
		BooleanResultFnc(condition,checkMemberPwd)
	}
	</script>
	<!-- 주소API -->
	<script>
	function openAddressApi(){
		sample6_execDaumPostcode("memberAddress","memberAddressCode","memberAddressNote" 
								,"backUpAddress","backUpAddressCode","backUpAddressNote");
	}	
	</script>

	<!-- 회원가입 버튼 클릭시 실행 될 script -->
	<script>
		function submetOnClick()  {
			
		  let submet =  confirm("회원가입을 하시겠습니까?");
		  
			if(!submet){
				Msg("회원가입 취소")
				return false;
			}
			if (checkNickName.val() != "Y" || memberNickName.val() != backUpNickName.val()) {
				 Msg("입력하신 이름은 공백이거나 사용할수 없습니다. 재 입력 부탁드립니다");
				 return false;
			}
			if(checkMemberEmail.val() != "Y" || memberEmail.val() != backUpEmail.val()){
				Msg("입력하신 이메일은 공백이거나 사용할수 없습니다. 재입력 후 중복확인을 진행해주세요 ");
				return false;
			}
			if(checkMemberPwd.val() != "Y"||!password.test(memberPwd.val().trim())||memberPwd.val() != checkPwd.val() ){
				Msg("입력하신 비밀번호가 일치하지 않거나 유효하지 않습니다. 재입력 부탁드립니다.");
				return false;
			}	
			if(checkMemberPhone.val() != "Y"|| !phone.test(memberPhone.val())){
				Msg("전화번호가 공백이거나 사용할 수 없는 형식의 번호입니다. -를 제외하고 재입력해주세요.");
				return false;
			}
			
			if(checkMemberAddress.val() != "Y"){
				Msg("주소를 입력하시지 않으셨습니다. 주소를 기입해주세요.");
				return false;
			}
			if(memberAddrescheckMemberAddress.val() != backUpAddress.val() ||memberAddressCode.val() != backUpAddressCode.val()
					|| memberAddressNote.val() != backUpAddressNote.val()){
				Msg("주소 내용이 변경되었습니다. 다시 입력해주세요.");	
				return false;
			}
			if(memberDetalAddress.val() == "" || memberDetalAddress.val() == null){
				Msg("상세주소를 압력해 주세요.");		
				return false;
			}
			memberInsert()					
							
		}
	</script>
	<!-- 회원가입용 Ajax -->
	<script>
	function memberInsert(){
	
		let formData = new FormData();
		
		formData.set("memberNickName", memberNickName.val());
		formData.set("memberEmail", memberEmail.val());
		formData.set("memberPwd", memberPwd.val());
		formData.set("memberPhone", memberPhone.val());
		formData.set("memberAddress", memberAddress.val());
		formData.set("memberDetalAddress", memberDetalAddress.val());
		formData.set("memberAddressCode", memberAddressCode.val());
		formData.set("memberAddressNote", memberAddressNote.val());
		
		AjaxCall('insert.me',"POST",formData,memberShipCallBackFnc)
	}
	function nickNameCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			checkNickName.val("N");
			checkNickNameResult.text("이미 사용중이거나 탈퇴한 회원의 닉네임입니다. 다시 입력해주세요").show().css("color","red");
		}else{
			checkNickName.val("Y");
			checkNickNameResult.text("사용 가능한 닉네임입니다.").show().css("color","green");
			backUpNickName.val(memberNickName.val());
		}
	}
	
	function emailCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			checkMemberEmail.val("N");
			checkMemberEmailResult.text("사용 할 수 없는 이메일입니다. 다시 입력해주세요").show().css("color","red");
		}else{
			checkMemberEmail.val("Y");
			checkMemberEmailResult.text("사용 가능한 이메일입니다.").show().css("color","green");
			backUpEmail.val(memberEmail.val());
		}
	}
	
	function memberShipCallBackFnc(callbackData){
		if(callbackData == "NNNN"){ 
			Msg("회원가입에 실패하셨습니다.")
		}else{
			Msg("회원가입에 성공하셨습니다.")
			location.replace("/loginPage.me")
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
