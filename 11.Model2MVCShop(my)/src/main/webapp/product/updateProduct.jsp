<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
Product productVO = (Product) request.getAttribute("productVO");
System.out.println("updateProduct.jsp :" +productVO);
%> --%>

<html>
<head>
<title>상품정보수정</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
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
<script type="text/javascript" src="/javascript/calendar.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<style>
body {
	padding-top: 50px;
}
</style>
</head>

<body bgcolor="#ffffff" text="#000000">
<div class="container">
	<div class="page-header">
		<h3 class=" text-info">상품수정</h3>
	</div>
	<!-- <form name="detailForm" method="post" enctype="multipart/form-data"> -->
	
	<form name="detailForm">
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>상품명</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" name="prodName" class="form-control"
				 value="${product.prodName }">
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>상품상세정보 </strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" name="prodDetail" class="form-control"
				 value="${product.prodDetail }">
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>제조일자 </strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" id="manuDate" name="manuDate" class="form-control"
				 value="${product.manuDate }" readonly="readonly">
				 <!-- <img class="show_calendar" /> -->
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>가격 </strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" name="price" class="form-control"
				 value="${product.price }">
				 [단위 : '원']
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>상품이미지</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<c:forEach var="fileName" items="${product.fileList}">
						<img src="/images/uploadFiles/${fileName}" height="200"
						align="absmiddle" /><br/><span id="fileNames">${fileName}</span><br/>
				</c:forEach>
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>상품이미지<br/>파일업로드</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="file" name="imageFileName" multiple 
				class="image" />
				<input type="hidden" name="imageFileName2" value="${product.fileName }"/>
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>재고 수량</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" name="prodQuantity" 
				class="form-control" value="${product.prodQuantity}" />
				[단위 : '개']
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-primary">취소</button>
			</div>
		</div>
			<input type="hidden" name="prodNo" value="${product.prodNo}" />
	</form>
	</div>
	
		<%-- <table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">상품수정</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품명 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105"><input type="text" name="prodName"
								class="ct_input_g" style="width: 100px; height: 19px"
								maxLength="20" value="${product.prodName }"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품상세정보 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="prodDetail"
					value="${product.prodDetail }" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="10" minLength="6">
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">제조일자 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" readonly="readonly"
					name="manuDate" value="${product.manuDate }" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
					<!-- <img 	src="../images/ct_icon_date.gif" width="15" height="15" 
									onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" /> -->
					<img class="show_calendar" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">가격 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="price"
					value="${product.price }" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="50" />&nbsp;원</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품이미지</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td>
					<c:forEach var="fileName" items="${product.fileList}">
						<img src="/images/uploadFiles/${fileName}" height="200"
						align="absmiddle" /><br/>${fileName}<br/>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품이미지<br/>파일업로드</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="file" name="imageFileName" multiple
					class="ct_input_g" style="width: 200px; height: 19px"
					maxLength="20" value="${product.fileName }" />
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">재고 수량</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="prodQuantity"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${product.prodQuantity}" />&nbsp;개</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								<!-- <a href="javascript:fncAddProduct();">수정</a> --> 수정
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								<!-- <a href="javascript:history.go(-1)">취소</a> --> 취소
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table> --%>


</body>
</html>
<script type="text/javascript">
function fncAddProduct(){
	//Form 유효성 검증
 	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method", "post").attr("action", "/product/updateProduct")
	.attr("enctype", "multipart/form-data").submit();
	/* document.detailForm.action='/product/updateProduct';
	document.detailForm.submit(); */
}

$(function(){
	$("button").mouseenter(function() {
		$(this).css("font-size", "20px");
	}).mouseleave(function() {
		$(this).css("font-size", $("body").css("font-size"));
	})
	$("button:contains('수정')").on("click", function() {
		//alert($("td.ct_btn01:contains('등록')").html());
		fncAddProduct();
	})

	$("button:contains('취소')").on("click", function() {
		//alert($("td.ct_btn01:contains('취소')").html());
		history.go(-1);
	})
	/* $("img.show_calendar").attr("src", "/images/ct_icon_date.gif").attr(
			"width", "20").attr("height", "20").on(
			"click",
			function() {
				show_calendar('document.detailForm.manuDate',
						document.detailForm.manuDate.value);
			}) */
	$("#manuDate").datepicker({
		dateFormat :"yy-mm-dd"
	});
});
</script>