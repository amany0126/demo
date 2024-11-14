// 정규식 모음
var nickname = /(^[0-9a-zA-Z]{0,10}$)/;
var email =/(^[\w\.]{0,})(@{0,1})([\w\.]{0,}$)/;
var phone = /(^0{1})((?<=0)1)?((?<=1)\d{0,9})?$/;
var password =/^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
// 입력시 특정 문자 제거
function InputControl(event,path) {
    let ele = event.target;
    if (!path.test(ele.value)) {
	      ele.value = ele.value.slice(0, -1);		
    }
}
function RemoveWhitespace (event) {
   event.target.value=event.target.value.split(" ")[0] 
}
// alert 관리
function Msg(msg) {
  alert(msg)
}
// 내용 초기화
function HTMLclear(elem) {
	  elem.innerHTML = '';
}

// 결과 출력용
// 문자만 출력
function BooleanMsgFnc(condition,successMsg,failMsg) {
		if(condition){
			Msg(successMsg);
		} else{
			Msg(failMsg);
		}
	}
// 문자랑 특정 값 변경	
function BooleanAllFnc(condition,successMsg,failMsg,resultId) {
	if(condition){
			Msg(successMsg);
			resultId.val("Y");
		} else{
			Msg(failMsg);
			resultId.val("N");
		}
}
// 특정값 변경
function BooleanResultFnc(condition,resultId) {
	if(condition){
			resultId.val("Y");
		} else{
			resultId.val("N");
		}
}

		
function AjaxCall(url,type,formData,callbackFnc){
	$.ajax({
	        url : url,
	        type : type,
	        data : formData,
	        contentType:false,        
	        processData: false,
            // 입력된 type이 다 대문자로 POST 일 경우 'multipart/form-data' 실행 아닐경우 'application/x-www-form-urlcencoded' 실행
	        enctype : "POST" == type.toUpperCase() ? 'multipart/form-data': 'application/x-www-form-urlcencoded',
	        async: false,
	        success : function(data){
	        	if(typeof callbackFnc == "function"){
		        	callbackFnc(data);		        		
	        	}
	        },
			error : function(request, status, error){
        	Msg(request.status + " " +request.responseText);
        },
		});
}







