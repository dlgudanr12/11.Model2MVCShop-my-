<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

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
<!-- <script type="text/javascript" src="/javascript/calendar.js"></script> -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<style>
body {
	padding-top: 50px;
}
body>div.container{
	border: 3px solid #DDDDDD;
}
</style>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- <form name="detailForm" method="post" enctype="multipart/form-data"> -->
	<div class="container">
		<h1 class="bg-primary text-center">상품등록</h1>
		<form name="detailForm" class="form-horizontal">

			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
				<input type="text" class="form-control" id="prodName" name="prodName" placeholder="중복확인하세요"  <%-- readonly --%>>
					<span id="helpBlock" class="help-block">
						<strong class="text-danger">입력전 중복확인부터</strong>
					</span>
				</div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info">중복확인</button>
		    </div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
				<div class="col-sm-4">
					<input type="text"class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<input type="text"class="form-control" id="manuDate" name="manuDate" placeholder="제조일자" readonly="readonly">
					<!-- <img class="show_calendar" /> -->
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price" placeholder="가격">
					[단위 : '원']
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input type="file" multiple class="image" id="imageFileName" name="imageFileName" placeholder="상품이미지">
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">재고 수량</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodQuantity"name="prodQuantity" placeholder="재고 수량">
					[단위 : '개']
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >등록</button>
					<button type="button" class="btn btn-primary"  >취소</button>
				</div>
			</div>
		</form>
	</div>
			
		<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품명 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle"></td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105"><input type="text" name="prodName"
								class="ct_input_g" style="width: 100px; height: 19px"
								maxLength="20"></td>
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
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10" minLength="6" /></td>
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
				<td class="ct_write01"><input type="text" name="manuDate"
					readonly="readonly" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="10" minLength="6" />
					&nbsp;<img src="/images/ct_icon_date.gif" width="15" height="15"
					onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
					<img class="show_calendar" />
				</td>
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
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10">&nbsp;원</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품이미지</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<input type="file" name="imageFileName" multiple class="ct_input_g" 
							style="width: 200px; height: 19px" maxLength="13"/>
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
					maxLength="20" />&nbsp;개</td>
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
								<a
								href="javascript:fncAddProduct();">등록</a>등록
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								<a href="javascript:resetData();">취소</a>취소
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table> -->
</body>
</html>
<script type="text/javascript">
	function fncAddProduct() {
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

		$("form").attr("method", "post").attr("action", "/product/addProduct")
				.attr("enctype", "multipart/form-data").submit();
		/* document.detailForm.action = '/product/addProduct';
		document.detailForm.submit(); */
	}

	$(function() {
		$("button:contains('등록')").on("click", function() {
			//alert($("td.ct_btn01:contains('등록')").html());
			fncAddProduct();
		})

		$("button:contains('취소')").on("click", function() {
			//alert($("td.ct_btn01:contains('취소')").html());
			$("form").eq(0).get(0).reset();
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