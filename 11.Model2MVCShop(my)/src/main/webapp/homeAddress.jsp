<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script type="text/javascript">
	
	var addrArr;
	 var postCode;
	 var address;
	 var address_detail;
	 function parseAddress(){
		 if($("#divyAddr-reading").val() !=null){
		 	addrArr = $("#divyAddr-reading").val().split('/');
		 }else if($("#addr-reading").val() !=null){
			addrArr = $("#addr-reading").val().split('/');
		 }
		 
			$("#postcode").val(addrArr[2]);
			$("#address").val(addrArr[0]);
			$("#address_detail").val(addrArr[1]);
	 }/* end of 주소 초기화*/
	 
	 function submitAddress(){
			postCode=$("#postcode").val();
			address=$("#address").val();
			address_detail=$("#address_detail").val();
			
			if($("#divyAddr").val() !=null){
				$("#divyAddr").val(address+"/"+address_detail+"/"+postCode);
				/* alert($("#divyAddr").val()); */
			 }else if($("#addr").val() !=null){
					$("#addr").val(address+"/"+address_detail+"/"+postCode);
			 }
			
	 }/* end of submit시 주소 합치기*/
	
		function execDaumPostcode() {
			
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;
	
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('address').value = fullAddr;
	
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById('address_detail').focus();
	            },
	        
	            theme: {
	    	 		bgColor: "#ECECEC", //바탕 배경색
	    	 		searchBgColor: "#0B65C8", //검색창 배경색
	    	 		contentBgColor: "#FFFFFF", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
	    	 		pageBgColor: "#FAFAFA", //페이지 배경색
	    	 		textColor: "#333333", //기본 글자색
	    	 		queryTextColor: "#FFFFFF", //검색창 글자색
	    	 		postcodeTextColor: "#FA4256", //우편번호 글자색
	    	 		emphTextColor: "#008BD3", //강조 글자색
	    	 		outlineColor: "#E0E0E0" //테두리
	    		}   
            
	        }).open();
	    }
	</script>
	
</head>

<body>
	<div class="row">
		<input type="text" class="form-control col-md-3"  id="postcode" placeholder="우편번호" readonly="readonly" style="width:100px;" >
		<input type="button" class="btn btn-default col-md-4" onclick="execDaumPostcode()" value="우편번호 찾기" readonly="readonly" >
	</div>
	<div class="row">
		<input type="text" class="form-control col-md-3"  id="address" placeholder="주소" >
		<input type="text" class="form-control col-md-3"  id="address_detail" placeholder="상세주소" >
	</div><br>
	<!-- <h1>참조 : http://postcode.map.daum.net/guide</h1> -->

</body>

</html>