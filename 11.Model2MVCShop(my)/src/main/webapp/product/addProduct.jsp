<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
Product productVO = (Product) request.getAttribute("productVO");
%> --%>

<html>
<head>
<meta charset="euc-kr" />
<title>상품등록</title>

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
<script type="text/javascript" src="../javascript/calendar.js"></script>

<style>
body {
	padding-top: 50px;
}
body>div.container{
	border: 3px solid #DDDDDD;
}
a[href='#']{
	color: black;
}
</style>

</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- <form name="detailForm" method="post" enctype="multipart/form-data"> -->
	<div class="container">
		<h1 class="bg-primary text-center">상품등록</h1>
		<form name="detailForm" class="form-horizontal">

			<!-- <table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">상품등록</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table> -->

			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.prodName }</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.prodDetail}</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.manuDate }</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.price }&nbsp;원</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <c:forEach var="fileName"
							items="${product.fileList}">
							<img src="/images/uploadFiles/${fileName }" height="200" align="absmiddle" />
							<br />
						</c:forEach>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">재고 수량</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.prodQuantity}&nbsp;개</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<a class="btn btn-primary btn" href="#" role="button">확인</a> <a
						class="btn btn-primary btn" href="#" role="button">추가등록</a>
				</div>
			</div>
		</form>
	</div>

		<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">상품명 <imgsrc ="/images/ct_icon_red.gif" width="3"
							height="3" align="absmiddle"></td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105"><%=productVO.getProdName() %></td>
								<td width="105">${product.prodName}</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">상품상세정보 <img src="/images/ct_icon_red.gif" width="3"
						height="3" align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${product.prodDetail}</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">제조일자 <img src="/images/ct_icon_red.gif" width="3"
						height="3" align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${product.manuDate }</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">가격 <img src="/images/ct_icon_red.gif" width="3"
						height="3" align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${product.price }&nbsp;원</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">상품이미지</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><c:forEach var="fileName" items="${product.fileList}">
							<img src="/images/uploadFiles/${fileName }" height="200" align="absmiddle" />
							<br />
						</c:forEach></td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">재고 수량</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${product.prodQuantity}&nbsp;개</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
				<tr>
					<td width="53%"></td>
					<td align="right">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
									<!-- <a
								href="/product/listProduct/manage">확인</a></td> --> 확인
								<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
								<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
									<!-- <a
								href="../product/addProductView.jsp;">추가등록</a> --> 추가등록
								</td>
								<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table> --%>
</body>
</html>
<script type="text/javascript">
	/* function fncAddProduct() {
		//Form 유효성 검증
		var name = document.detailForm.prodName.value;
		var detail = document.detailForm.prodDetail.value;
		var manuDate = document.detailForm.manuDate.value;
		var price = document.detailForm.price.value;

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		document.detailForm.action = '/product/addProduct';
		document.detailForm.submit();
	} */

	function resetData() {
		document.detailForm.reset();
	}

	$(function() {
		$("a[href='#']:contains('확인')").on("click", function() {
			self.location = "/product/listProduct/manage";
		})

		$("a[href='#']:contains('추가등록')").on("click", function() {
			self.location = "../product/addProductView.jsp";
		})

		//$("form").attr("method","post").attr("action","/product/addProduct").attr("enctype","multipart/form-data");
	});
</script>
