<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
<script>
$(function(){
    // 검색버튼 눌렸을 때 함수 실행
    $("#searchBtn").click(function(e){
        e.preventDefault();
        // ajax
        $.ajax({
            // zip_codeList controller 진입 url
            url : "zip_codeList",
            // zip_codeForm을 serialize 해줍니다.
            data : $("#zip_codeForm").serialize(),
            type : "POST",
            // dataType 은 json형태로 보냅니다.
            dataType : "json",
            success : function(result){
                $("#zip_codeList").empty();
                var html = "";
                if(result.errorCode != null && result.errorCode != ""){
                    html += "<tr>";
                    html += "    <td colspan='2'>";
                    html +=            result.errorMessage;
                    html += "    </td>";
                    html += "</tr>";
                }
                else{
                    // 검색결과를 list에 담는다.
                    var list = result.list;
                    
                    for(var i = 0; i < list.length; i++){
                        html += "<tr>";
                        html += "    <td>";
                        // 우편번호
                        var zipcode = list[i].zipcode;
                        // 주소
                        var address = list[i].address;
 
                        html +=         list[i].zipcode;
                        html += "    </td>";
                        html += "    <td>";
                        html +=     '<a href="#" onclick="put(\'' + list[i].address + '\',\'' + zipcode + '\')">' + address + '</a>';
                        html += "    </td>";
                        html += "</tr>";
                    }
                }
                // 완성된 html(우편번호 list)를 zip_codeList밑에 append
                $("#zip_codeList").append(html);
            }
        });
    });
});
 
// 원하는 우편번호 선택시 함수 실행
function put(address,zipcode){
    var address = address;
    var zipcode = zipcode;
    alert(address);
    // 모달창 닫기
   	opener.form1.zip1.value=zipcode;
    opener.form1.addr1.value=address;
    window.close();
}
 
</script>




</head>
<body>
<form id="zip_codeForm">
<center>동입력:
<input type="text" style=ime-mode:active; name="query" id='query'>
<input type="button" name="search" value="검색" id="searchBtn">
<table border="1" width="100%" class="table text-center">
<thead>
<tr>
	<th width="15%">우편번호</th>
	<th>주소</th>
	</tr>
</thead>
	<tbody id="zip_codeList"></tbody>
</table>
</center>
</form>
 

</body>
</html>