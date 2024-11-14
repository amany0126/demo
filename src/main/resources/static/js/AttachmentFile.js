function addFile(obj){
    var maxFileCnt = 5;   // 첨부파일 최대 개수
    var attFileCnt = $('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
 if(attFileCnt != 0 || curFileCnt !=0){
    $("#fileNo").remove();
    }
    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        Msg("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    }else {
         
        for (const file of obj.files) {
            // 첨부파일 검증
            if (validation(file)) {
                // 파일 배열에 담기
                var reader = new FileReader();
                reader.onload = function () {
                    filesArr.push(file);
                };
                reader.readAsDataURL(file);
               
                // 목록 추가
                let htmlData = '';
                htmlData += '<div id="file' + fileNo + '" class="filebox">';
                htmlData += '   <p class="name" style ="display: inline";>' + file.name + '</p>';
                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
                htmlData += '</div>'
                ;
                $('.file-list').append(htmlData);
                fileNo++;
            } else {
                continue;
            }
        }
    }
    // 초기화
	$("input[type=file]")[0].value = "";
	/*    document.querySelector("input[type=file]").value = "";*/
}
/* 첨부파일 삭제 */
function deleteFile(num) {
    $("#file" + num).remove();
    filesArr[num].is_delete = true;
}
/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
    if (obj.name.length > 770) {
        Msg("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (10 * 1024 * 1024)) {
        Msg("최대 파일 용량인 10MB를 초과한 파일은 제외되었습니다.");
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        Msg("확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        Msg("첨부가 불가능한 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 첨부파일 삭제 */
function deleteFile(num) {
    $("#file" + num).remove();
    filesArr[num].is_delete = true;
}

/* 기존 첨부파일 삭제*/
function OrignaldeleteFile(num,divId,fileName) {
	
	let AttName = $("#"+divId+num+" input[id="+fileName+"]").val();
	let AttIndex = OrignalfilesArr.indexOf(AttName)
		
	DeleteOrignalfilesArr.push(OrignalfilesArr[AttIndex]);
	OrignalfilesArr.splice(AttIndex, 1);
	$("#"+divId+ num).remove();
			
	 OrignalfilesCount = OrignalfilesCount-1
	}