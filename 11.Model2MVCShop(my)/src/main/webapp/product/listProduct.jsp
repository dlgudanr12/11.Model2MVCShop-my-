<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%
List<Product> list = (List<Product>) request.getAttribute("list");
Page resultPage = (Page) request.getAttribute("resultPage");
Search search = (Search) request.getAttribute("search");

String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%> --%>

<html>
<head>
<meta charset="euc-kr" />
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
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

<script type="text/javascript">
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		//document.detailForm.submit();
		$('#currentPage').val(currentPage);
		$("form").attr("method", "post").attr("action",
				"/product/listProduct/${menu }").submit();
	}
	/* function updateQuantity() {
		var newQuantity = $("#prodQuantityInput").val();

		$.ajax({
			url : "/updateQuantity.do",
			type : "GET",
			data : {
				prodNo : "${product.prodNo}",
				prodQuantity : newQuantity,
				currentPage : "${search.currentPage}",
				searchCondition : "${search.searchCondition}",
				searchKeyword : "${search.searchKeyword}"
			},
			success : function(response) {
				// 성공적인 응답 처리
				console.log(response);
			},
			error : function(error) {
				// 오류 처리
				console.error(error);
			}
		});
	} */
	function fncLink() {
		$('tr.ct_list_pop').each(
				function(index) {
					$(
							"tr.ct_list_pop:nth-child(" + (2 * index + 4)
									+ ") td:nth-child(3)").on(
							"click",
							function() {
								var prodNo = $(
										"tr.ct_list_pop:nth-child("
												+ (2 * index + 4)
												+ ") td:nth-child(3) input")
										.val();
								var menu = "${menu}";
								//alert(prodNo + "/" + menu);
								self.location = "/product/getProduct/" + prodNo
										+ "/" + menu;
							})
				})
	}
	$(function() {
		fncLink();
		//console.log($("tr.ct_list_pop td:nth-child(3)"));

		/* $.ajax("/productRest/json/listProduct",
				{
					method : "POST",
					dataType : "json",
					headers : {
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
						//alert(JSONData.success);
						$(
								"tr.ct_list_pop:nth-child(" + (2 * index + 4)
										+ ") td:last").empty();
						$(
								"tr.ct_list_pop:nth-child(" + (2 * index + 4)
										+ ") td:nth-child(15)").text("배송완료");
					}
				}) */

		var maxPage = $("input.maxPage").val();
		var pageSize = $("input.pageSize").val();
		var currentPage = $("input.currentPage").val();
		var searchCondition = $("input.searchCondition").val().trim();
		var searchKeyword = $("input.searchKeyword").val().trim();
		var searchOrderBy = $("input.searchOrderBy").val().trim();
		var searchPriceLowerLimit = $("input.searchPriceLowerLimit").val();
		var searchPriceUpperLimit = $("input.searchPriceUpperLimit").val();
		console.log("maxPage : " + maxPage + "\n pageSize : " + pageSize
				+ "\n currentPage : " + currentPage + "\n searchCondition : "
				+ searchCondition + "\n searchKeyword : -" + searchKeyword
				+ "-" + "\n searchOrderBy : " + searchOrderBy
				+ "\n searchPriceLowerLimit : " + searchPriceLowerLimit
				+ "\n searchPriceUpperLimit : " + searchPriceUpperLimit);

		/* $( "tfoot.a:last" ).after( $( "tfoot.a:first" ).clone() ); */
		var last = document.body.scrollHeight - window.innerHeight;
		console.log( document.body.scrollHeight + "/"+ window.innerHeight );
		if (currentPage <= maxPage) {
			$(window).on("scroll",function() {
				console.log( $(window).scrollTop() );
				if ($(window).scrollTop() == last) {
									++currentPage
									console.log(currentPage);
									$.ajax("/productRest/json/listProduct",
											{
														method : "POST",
														dataType : "json",
														headers : {
															"Content-Type" : "application/json"
														},
														data : JSON
																.stringify({
																	currentPage : currentPage,
																	searchCondition : searchCondition,
																	searchKeyword : searchKeyword,
																	searchOrderBy : searchOrderBy,
																	searchPriceLowerLimit : searchPriceLowerLimit,
																	searchPriceUpperLimit : searchPriceUpperLimit
																}),
														success : function(JSONData,status) {
															/* console.log(JSONData);
															var serverData=JSON.stringify(JSONData);
															console.log(serverData); */
															let i = (currentPage - 1) * pageSize;
															$.each(JSONData.list,function(index,product) {
																				// 여기서 index는 배열의 인덱스이고, item은 각 요소를 나타냅니다
																				++i;
																				console.log("Index: "+ index + ", Item: "+ JSON.stringify(product));
																				var quantityText = "";
																				if (product.prodQuantity != 0) {
																					quantityText = "판매 중";
																				} else {
																					quantityText = "재고 없음";
																				}
																				var regDate = new Date(product.regDate);
																				var formatRegDate = regDate.getFullYear()+"-"+ regDate.getMonth().toString().padStart(2,'0')
																				+"-"+ regDate.getDate().toString().padStart(2,'0');
																				var textPop = "<tr class='ct_list_pop'>"
																						+ "<td align='center' height='200'>"
																						+ i
																						+ "</td>"
																						+ "<td></td>"
																						+ "<td align='left'><input value='"+product.prodNo+"'type='hidden' /> "
																						+ product.prodName
																						+ "</td>"
																						+ "<td></td>"
																						+ "<td align='left'>"
																						+ product.price
																						+ "</td>"
																						+ "<td></td>"
																						+ "<td align='left'>"
																						+ formatRegDate
																						+ "</td>"
																						+ "<td></td>"
																						+ "<td align='left'>"
																						+ quantityText
																						+ "</td>"
																						+ "<td></td>"
																						+ "<td align='left'>"
																						+ product.prodQuantity
																						+ "개</td>"
																						+ "</tr>";
																				var textPop2 = "<tr><td colspan='11' bgcolor='D6D7D6' height='1'></td></tr>";
																				$("tr.ct_list_pop:last").after(textPop).after(textPop2);
																				fncLink();
																			});
														}
													})
									window.scrollTo(0, last);//window.scrollTo(x축,y축);
								}
								last = document.body.scrollHeight - window.innerHeight;//document.body.scrollHeight : body의 스크롤 총 높이, window.innerHeight : 창 안의 높이
							})
		}
		
		var fList=[];
		$("input[name='searchKeyword']").keyup(function(){
			searchKeyword=$("input[name='searchKeyword']").val().trim();
			searchCondition=$("select[name='searchCondition']").val().trim();
			searchOrderBy=$("select[name='searchOrderBy']").val();
			searchPriceLowerLimit=$("input[name='searchPriceLowerLimit']").val();
			searchPriceUpperLimit=$("input[name='searchPriceUpperLimit']").val();
			console.log(searchKeyword +"/"+ searchCondition+"/"+ searchOrderBy+"/"+ searchPriceLowerLimit+"/"+ searchPriceUpperLimit);
			
			$.ajax("/productRest/json/fullListProduct",{
				method:"POST",
				dataType:"json",
				headers:{
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					searchCondition : searchCondition,
					searchKeyword : searchKeyword,
					searchOrderBy : searchOrderBy,
					searchPriceLowerLimit : searchPriceLowerLimit,
					searchPriceUpperLimit : searchPriceUpperLimit
				}),
				success:function(JSONData,status){
					$.each(JSONData.fullList,function(index,product){
						if(searchCondition==0){
							fList.push(product.prodNo+"");
						}else if(searchCondition==1){
							fList.push(product.prodName);
						}else if(searchCondition==2){
							fList.push(product.price+"");
						}
						console.log(fList);
						$("input[name='searchKeyword']").autocomplete({
							source : fList
						})
					})
					fList=[];
				}
			})
		})

		

		/*  $( "span" ).css( "display", "inline" ).fadeOut( "slow" ); */
	});
</script>

</head>

<body bgcolor="#ffffff" text="#000000">
	<input class="maxPage" type="hidden" value=" ${resultPage.maxPage}" />
	<input class="pageSize" type="hidden" value=" ${resultPage.pageSize}" />
	<input class="currentPage" type="hidden" value=" ${search.currentPage}" />
	<input class="searchCondition" type="hidden" value=" ${search.searchCondition}" />
	<input class="searchKeyword" type="hidden" value=" ${search.searchKeyword}" />
	<input class="searchOrderBy" type="hidden" value=" ${search.searchOrderBy}" />
	<input class="searchPriceLowerLimit" type="hidden" value=" ${search.searchPriceLowerLimit}" />
	<input class="searchPriceUpperLimit" type="hidden" value=" ${search.searchPriceUpperLimit}" />

	<jsp:include page="/layout/toolbar.jsp" />

	<div style="width: 98%; margin-left: 10px; ">

		<!-- <form name="detailForm" action="/product/listProduct/${menu }" method="post"> -->
		<form name="detailForm" class="form-inline">
			<div class="container ">
				<div class="jumbotron">
					<table class="table table-striped"  >
						<tr>
							<td width="93%" class="ct_ttl01"><h1>상품 관리</h1></td>
						</tr>
					</table>
				</div>
				
			 <div class="form-group nav navbar-nav navbar-right" >
			<table class="table" style="margin-top: 10px;">
				<tr>
					<td align="right">찾고 싶은 가격 범위 설정 <input type="text" name="searchPriceLowerLimit"
						value="${search.searchPriceLowerLimit}" class="form-control" style="width: 100px; height: 30px">
						~ <input type="text" name="searchPriceUpperLimit" value="${search.searchPriceUpperLimit}"
						class="form-control" style="width: 100px; height: 30px"> 
						<select name="searchOrderBy" class="form-control" style="width: 140px">
							<option value="0" ${search.searchOrderBy=='0' ? "selected" : "" }>상품번호 순</option>
							<option value="1" ${search.searchOrderBy=='1' ? "selected" : "" }>가격 낮은 순</option>
							<option value="2" ${search.searchOrderBy=='2'? "selected" : "" }>가격 높은 순</option>
					</select> <select name="searchCondition" class="form-control" style="width: 120px">
							<option value="0" ${search.searchCondition=='0' ? "selected" : "" }>상품번호</option>
							<option value="1" ${search.searchCondition=='1' ? "selected" : "" }>상품명</option>
							<option value="2" ${search.searchCondition=='2'? "selected" : "" }>상품가격</option>
					</select> <input type="text" name="searchKeyword" value="${search.searchKeyword}" class="form-control"
						style="width: 120px; height: 30px">
					</td>

					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23">
									<a href="javascript:fncGetList('1');">
										<button type="button" class="btn btn-primary">검색</button>
									</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</div>

			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage" name="currentPage" value="" /> <jsp:include
							page="../common/pageNavigatorDefault.jsp" /></td>
				</tr>
			</table>
			<!--  페이지 Navigator 끝 -->

			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage } 페이지</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="30">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">등록일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">재고 수량</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${i+1 }" />
					<tr class="ct_list_pop">
						<td align="center" height="200">${i }</td>
						<td></td>
						<td align="left"><input value="${product.prodNo}" type="hidden" /> ${product.prodName }</td>
						<td></td>
						<td align="left">${product.price }</td>
						<td></td>
						<td align="left">${product.regDate }</td>
						<td></td>
						<td align="left"><c:if test="${ product.prodQuantity!=0}"> 판매 중 </c:if> <c:if
								test="${ product.prodQuantity==0}"> 재고 없음 </c:if></td>
						<td></td>
						<td align="left">${product.prodQuantity}개</td>
					</tr>
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:forEach>
			</table>
			
			</div>

		</form>
	</div>

</body>
</html>



