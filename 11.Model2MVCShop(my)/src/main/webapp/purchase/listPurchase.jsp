<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<style>
body {
	padding-top: 70px;
}
</style>

</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">

		<form name="detailForm">
			<div class="page-header text-info">
				<h3>구매 목록조회</h3>
			</div>
			<input class="currentPage" type="hidden" value="${resultPage.currentPage }" /> 전체
			${resultPage.maxPage } 건수, 현재 ${resultPage.currentPage } 페이지
			<table class="table table-hover table-striped">
				<thead>
					<tr align="left">
						<td align="center">No</td>
						<td>배송번호</td>
						<td>회원ID</td>
						<td>회원명</td>
						<td>상품명</td>
						<td>상품수량</td>
						<td>전화번호</td>
						<td>배송현황</td>
						<td>정보수정</td>
					</tr>
				</thead>

				<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="purchase" items="${list }">
						<c:set var="i" value="${i+1 }" />
						<tr class="ct_list_pop" align="left">
							<td align="center">${i }</td>
							<td><%-- <a href="/purchase/getPurchase/${purchase.tranNo }/search">${purchase.tranNo }</a> --%>
								${purchase.tranNo }
							</td>
							<td>${purchase.buyer.userId }</td>
							<td>${purchase.receiverName }</td>
							<td>${purchase.purchaseProd.prodName }</td>
							<td>${purchase.tranQuantity }</td>
							<td>${purchase.receiverPhone }</td>
							<td>
								<c:if test="${purchase.tranCode=='1' }">구매완료
									<%-- <a href="/purchase/updatePurchase/${purchase.tranNo }">구매 수정</a> --%>
									<span>구매 수정</span>
								</c:if> 
								<c:if test="${purchase.tranCode=='2' }">배송중</c:if>
								<c:if test="${purchase.tranCode=='3' }">배송완료</c:if>
							</td>
							<td>
								<input type="hidden" value="${purchase.tranCode }" /> 
								<c:if test="${purchase.tranCode=='2' }">
									<!-- <a href="/purchase/updateTranCode/${purchase.tranNo }/${purchase.tranCode }">
									물건도착</a> -->
									물건도착
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

			<input type="hidden" id="currentPage" name="currentPage" value="" />
			<jsp:include page="../common/pageNavigatorDefault.jsp" />
			<!--  페이지 Navigator 끝 -->
			
			<input class="maxPage" type="hidden" value=" ${resultPage.maxPage}" />
			<input class="pageSize" type="hidden" value=" ${resultPage.pageSize}" />
			<input class="userId" type="hidden" value=" ${sessionScope.user.userId}" />
		</form>

	</div><!-- <div class="container"> -->

</body>
</html>

<script type="text/javascript">
	function fncGetList(currentPage) {
		/* 
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit(); */
		$('#currentPage').val(currentPage)
		$("form").attr("method", "post").attr("action",
				"/purchase/listPurchase").submit();
	}
	
	function fncLink(){
		$('tr.ct_list_pop').each(function(index) {
			
			$("tr.ct_list_pop:nth-child(" + (index + 1)+ ") td:contains('물건도착')").click(function() {
								var tranNo = $(
										"tr.ct_list_pop:nth-child("
												+ (index + 1)
												+ ") td:nth-child(2)").text()
										.trim();
								var tranCode = $(
										"tr.ct_list_pop:nth-child("
												+ (index + 1)
												+ ") td:last input").val();
								//alert(tranNo + "/" + tranCode);
								$.ajax("/purchaseRest/json/updateTranCode/"
										+ tranNo + "/" + tranCode, {
									method : "GET",
									dataType : "json",
									headers : {
										"Content-Type" : "application/json"
									},
									success : function(JSONData, status) {
										//alert(JSONData.success);
										$(
												"tr.ct_list_pop:nth-child("
														+ (index + 1)
														+ ") td:last").empty();
										$(
												"tr.ct_list_pop:nth-child("
														+ (index + 1)
														+ ") td:nth-child(8)")
												.text("배송완료");
									}
								})
							})/* end of 물건도착 link  */
							
							$("tr.ct_list_pop:nth-child(" + (index + 1)+ ") td span:contains('구매 수정')").click(function() {
								self.location="/purchase/updatePurchase/"+$( "tr.ct_list_pop:nth-child(" + (index + 1)+ ") td:nth-child(2)" ).text();
							})	/* end of 구매 수정 link  */
							
							$("tr.ct_list_pop:nth-child(" + (index + 1)+ ") td:nth-child(2)").click(function() {
								self.location="/purchase/getPurchase/"+$( "tr.ct_list_pop:nth-child(" + (index + 1)+ ") td:nth-child(2)" ).text()+"/search";
							})	/* end of 구매 정보 확인 link  */
							
							
								$("tr.ct_list_pop:nth-child(" + (index + 1) + ") td span:contains('구매 수정')")
								.css("color","blue")
								.mouseenter(function() {
											$(this).css("color", "red");
								}).mouseleave(function() {
									$(this).css("color", "blue");
								})
								
								$("tr.ct_list_pop:nth-child(" + (index + 1) + ") td:nth-child(2)")
								.css("color","blue")
								.mouseenter(function() {
											$(this).css("color", "red");
								}).mouseleave(function() {
									$(this).css("color", "blue");
								})
				})/*end of each*/
	}
	var maxPage = $("input.maxPage").val();
	var pageSize = $("input.pageSize").val();
	var currentPage = $("input.currentPage").val();
	var userId=$("input.userId").val().trim();
	console.log("currentPage : " + currentPage );
	let j = 0;
	function fncScrollEvent() {
		++currentPage;
		console.log(currentPage);
		$
				.ajax(
						"/purchaseRest/json/listPurchase",
						{
							method : "POST",
							dataType : "json",
							headers : {
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								currentPage : currentPage,
								userId : userId
							}),
							success : function(JSONData, status) {
								++j;
								let i = j*pageSize;
								var textPop2="";
								$.each(JSONData.list,function(index, purchase) {
										// 여기서 index는 배열의 인덱스이고, item은 각 요소를 나타냅니다
										++i;
										console.log("Index: "+ index+ ", Item: "+ JSON.stringify(purchase));
										var tranCodeText = "";
										var trabCodeText2 = "";
										if (purchase.tranCode == 1 ) {
											tranCodeText = "구매완료 <span>구매 수정</span>";
										} else if(purchase.tranCode == 2 ){
											tranCodeText = "배송중";
										} else if(purchase.tranCode == 3 ){
											tranCodeText = "배송완료";
										}else{
											tranCodeText = "";
										}
										
										if(purchase.tranCode == 2 ){
											tranCodeText2 = "물건도착";
										}else{
											tranCodeText2 = "";
										}
										var receiverPhone=(purchase.receiverPhone != null) ? purchase.receiverPhone : "";
													var textPop = "<tr class='ct_list_pop' align='left'>"
													+"<td align='center'>"+i+"</td>"
													+"<td>"+purchase.tranNo+"</td>"
													+"<td>"+purchase.buyer.userId+"</td>"
													+"<td>"+purchase.receiverName+"</td>"
													+"<td>"+purchase.purchaseProd.prodName+"</td>"
													+"<td>"+purchase.tranQuantity+"</td>"
													+"<td>"+receiverPhone+"</td>"
													+"<td>"+tranCodeText+"</td>"
													+"<td><input type='hidden' value='"+purchase.tranCode+"' />"+tranCodeText2+"</td>"
													+"</tr>";
													
													textPop2 += textPop;
												});
								$("tr.ct_list_pop:last").after(textPop2);
								fncLink();
							}
						})/* end of '$.ajax' */
	}
	
	$(function() {
		fncLink();
		
		var currentPageInt=parseInt(currentPage);
		var maxPageInt=parseInt(maxPage);
		var last = document.body.scrollHeight - window.innerHeight;
		if (currentPageInt < maxPageInt) {
			fncScrollEvent();
			fncScrollEvent();
			fncScrollEvent();
			fncScrollEvent();
			fncScrollEvent();
			fncScrollEvent();

			$(window).scroll(function() {
				if ($(window).scrollTop() == last) {
					fncScrollEvent();

					window.scrollTo(0, last);//window.scrollTo(x축,y축);
				}/* end of 'if ( $(window).scrollTop() == last) ' */
				last = document.body.scrollHeight - window.innerHeight;//document.body.scrollHeight : body의 스크롤 총 높이, window.innerHeight : 창 안의 높이
			})/* end of '$(window).scroll(function()' */

		} /* end of 'if (currentPage <= maxPage)' */
	});
			
	/* const currentPage="${resultPage.currentPage}";
	var userId="${user.userId}";
		alert(currentPage+"/"+userId) 
	 $.ajax("/purchaseRest/json/listPurchase",{
	method : "POST",
	dataType : "text",
	headers : {
		"Content-Type" : "application/json"
	},
	data : JSON.stringify({
	currentPage : currentPage,
	userId : userId
	}),
	success : function(serverData,status){
	alert(status+"\n server로 부터 받은 내용 : " + serverData);
	var JSONData=$.parseJSON(serverData);
	alert("JSONData : \n" + JSONData);
	}
	}) 

	 $.ajax("/purchaseRest/json/listPurchase",{
		method : "POST",
	data : JSON.stringify({
		currentPage : currentPage,
		userId : userId
	}),
	dataType : "json",
	headers : {
		"Content-Type" : "application/json"
	},
	success : function(JSONData,status){
		alert("JSONData : \n" + JSONData);
		var serverData=$.stringify(JSONData);
		alert(status+"\n server로 부터 받은 내용 : " + serverData);
		}
	})

	 $.post("/purchaseRest/json/listPurchase", 
			JSON.stringify({
			currentPage : currentPage,
			userId : userId
		}),
		function(JSONData,status){
			alert("JSONData : \n" + JSONData);
			var serverData=$.stringify(JSONData);
			alert(status+"\n server로 부터 받은 내용 : " + serverData);
		}, "text") // 기본 헤더가 쿼리 스트링이다.
	})
	})
	});*/
</script>