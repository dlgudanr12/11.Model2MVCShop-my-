<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>구매 생성 페이지</title>

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
<body>
<div class="container">
		<h1 class="bg-primary text-center">상품 구매</h1>
		<form name="detailForm" class="form-horizontal">

		<!-- <table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37"></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">상품 구매</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table> -->
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.prodNo }</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품명 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.prodName }</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품상세정보 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.prodDetail }</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">제조일자 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.manuDate }</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">가격 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.price }&nbsp;원</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">등록일자 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.regDate }</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품 수량 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.purchaseProd.prodQuantity }&nbsp; 개</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
				<div class="col-sm-4">
				<span id="helpBlock" class="help-block"> 
					<strong>${purchase.buyer.userId }</strong>
					</span>
					<input type="hidden" class="form-control" id="buyerId" name="buyerId" 
					value="${purchase.buyer.userId }" placeholder="구매자아이디">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
					<select id="paymentOption" name="paymentOption">
						<option value="1" selected>현금구매</option>
						<option value="2">신용구매</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName" name="receiverName" 
					value="${purchase.buyer.userName }" placeholder="구매자이름">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone" name="receiverPhone"
					value="${purchase.buyer.phone }"  placeholder="구매자연락처">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
				<div class="col-sm-4">
					<input type="hidden" class="form-control" id="divyAddr-reading"name="divyAddr-reading"
					value="${purchase.buyer.addr }"  placeholder="구매자주소">
					<jsp:include page="/homeAddress.jsp"/>
					<input type="hidden" class="form-control" id="divyAddr" name="divyAddr"
					value=""  placeholder="구매자주소">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverRequest"name="receiverRequest"
					 placeholder="구매요청사항">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="divyDate" name="divyDate" 
					placeholder="배송희망일자" readonly="readonly">
					<img class="show_calendar" /> 
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매 수량</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="tranQuantity" name="tranQuantity"
					 value="1" placeholder="구매 수량">[단위 : '개']
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >구매</button>
					<button type="button" class="btn btn-primary"  >취소</button>
				</div>
			</div>
			<input type="hidden" name="prodNo"
			value="${purchase.purchaseProd.prodNo }" />
	</form>
</div>
	

		<%-- <table width="600" border="0" cellspacing="0" cellpadding="0"
			align="center" style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="300" class="ct_write">상품번호 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01" width="299">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105">${purchase.purchaseProd.prodNo }</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품명 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${purchase.purchaseProd.prodName }</td>
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
				<td class="ct_write01">${purchase.purchaseProd.prodDetail }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">제조일자</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${purchase.purchaseProd.manuDate }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">가격</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${purchase.purchaseProd.price }&nbsp;원</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">등록일자</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${purchase.purchaseProd.regDate }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품 수량</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${purchase.purchaseProd.prodQuantity }
					&nbsp; 개</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매자아이디 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${purchase.buyer.userId }</td>
				<input type="hidden" name="buyerId"
					value="${purchase.buyer.userId }" />
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매방법</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><select name="paymentOption"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20">
						<option value="1" selected>현금구매</option>
						<option value="2">신용구매</option>
				</select></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매자이름</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="receiverName"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.buyer.userName }" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매자연락처</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="receiverPhone"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.buyer.phone }" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매자주소</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="receiverAddr"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.buyer.addr }" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매요청사항</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text"
					name="receiverRequest" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="20" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">배송희망일자</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td width="200" class="ct_write01"><input type="text"
					readonly="readonly" name="receiverDate" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="20" />
					<!--<img src="/images/ct_icon_date.gif" width="15" height="15"
					onclick="show_calendar('document.detailForm.receiverDate', document.detailForm.receiverDate.value)" />
					--><img class="show_calendar" /> 
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매 수량</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="tranQuantity"
					value="1" class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" />&nbsp; 개</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="center">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								<!-- <a
								href="javascript:fncAddPurchase();">구매</a> --> 구매
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								<!-- <a href="javascript:resetData();">취소</a> --> 취소
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
	/* function fncAddPurchase() {
	 document.detailForm.action='/purchase/addPurchase';
	 document.detailForm.submit();
	 } */

	/* function resetData(){
	 document.detailForm.reset();
	 } */
	 parseAddress();/* end of 주소 초기화 of "/homeAddress.jsp"*/
	$(function() {
		$("button:contains('구매')").on(
				"click",
				function() {
					submitAddress();
					$("form").attr("method", "post").attr("action",
							"/purchase/addPurchase").submit();
				})

		$("button:contains('취소')").on("click", function() {
			$("form").eq(0).get(0).reset();
			parseAddress();
		})

		/*  $("img.show_calendar").attr("src", "/images/ct_icon_date.gif").attr(
				"width", "20").attr("height", "20").on(
				"click",
				function() {
					show_calendar('document.detailForm.receiverDate',
							document.detailForm.receiverDate.value);
				})  */
		$("#divyDate").datepicker({
			dateFormat :"yy-mm-dd"
		});
	});
</script>