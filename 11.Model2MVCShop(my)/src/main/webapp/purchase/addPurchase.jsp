<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>구매 확인</title>
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
			<h5 class="text-muted">
				&nbsp; 다음과 같이 <strong class="text-info">구매</strong>가 되었습니다.
			</h5>
		
		
			<%-- <div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.prodNo }</strong>
					</span>
				</div>
			</div> --%>
		
			 <div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품명 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.prodName }</strong>
					</span>
					<input class="prodNo" type="hidden" value="${purchase.purchaseProd.prodNo }"/>
				</div>
			</div>
		
			<%--<div class="form-group">
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
			</div> --%>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.buyer.userId }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
				<span id="helpBlock" class="help-block"> 
					<c:if test="${purchase.paymentOption==1}"><strong>현금구매</strong></c:if>
					<c:if test="${purchase.paymentOption==2}"><strong>신용구매</strong></c:if>
				</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.receiverName }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.receiverPhone }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.divyAddr }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.divyRequest }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.divyDate }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매 수량</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.tranQuantity }&nbsp; 개</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary"  >확인</button>
		      		<button type="button" class="btn btn-primary"  >추가구매</button>
				</div>
			</div>
	</form>
</div>

</body>
</html>
<script type="text/javascript">
	$(function() {
		var prodNo=$("input.prodNo").val();
		$("button:contains('확인')").on(
				"click",
				function() {
					self.location = "/purchase/listPurchase";
				})

		$("button:contains('추가구매')").on("click", function() {
			self.location = "/purchase/addPurchase/"+prodNo;
		})
	});
</script>