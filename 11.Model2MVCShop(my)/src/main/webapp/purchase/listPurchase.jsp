<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>
<title>���� �����ȸ</title>

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
				<h3>���� �����ȸ</h3>
			</div>
			<input class="currentPage" type="hidden" value="${resultPage.currentPage }" /> ��ü
			${resultPage.maxPage } �Ǽ�, ���� ${resultPage.currentPage } ������
			<table class="table table-hover table-striped">
				<thead>
					<tr align="left">
						<td align="center">No</td>
						<td>��۹�ȣ</td>
						<td>ȸ��ID</td>
						<td>ȸ����</td>
						<td>��ǰ��</td>
						<td>��ǰ����</td>
						<td>��ȭ��ȣ</td>
						<td>�����Ȳ</td>
						<td>��������</td>
					</tr>
				</thead>

				<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="purchase" items="${list }">
						<c:set var="i" value="${i+1 }" />
						<tr class="ct_list_pop" align="left">
							<td align="center">${i }</td>
							<td><a href="/purchase/getPurchase/${purchase.tranNo }/search">${purchase.tranNo }</a>
							</td>
							<td>${purchase.buyer.userId }</td>
							<td>${purchase.receiverName }</td>
							<td>${purchase.purchaseProd.prodName }</td>
							<td>${purchase.tranQuantity }</td>
							<td>${purchase.receiverPhone }</td>
							<td><c:if test="${purchase.tranCode=='1' }">���ſϷ�
								<a href="/purchase/updatePurchase/${purchase.tranNo }">���� ����</a>
								</c:if> <c:if test="${purchase.tranCode=='2' }">�����</c:if> <c:if test="${purchase.tranCode=='3' }">��ۿϷ�</c:if>
							</td>
							<td><input type="hidden" value="${purchase.tranCode }" /> <c:if
									test="${purchase.tranCode=='2' }">
									<!-- <a
									href="/purchase/updateTranCode/${purchase.tranNo }/${purchase.tranCode }">���ǵ���</a> -->
									���ǵ���
							</c:if></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

			<input type="hidden" id="currentPage" name="currentPage" value="" />
			<jsp:include page="../common/pageNavigatorDefault.jsp" />
			<!--  ������ Navigator �� -->
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
	$(function() {
		$('tr.ct_list_pop').each(
				function(index) {
					$(
							"tr.ct_list_pop:nth-child(" + (index + 1)
									+ ") td:contains('���ǵ���')").on(
							"click",
							function() {
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
												.text("��ۿϷ�");
									}
								})
							})
				})
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
	alert(status+"\n server�� ���� ���� ���� : " + serverData);
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
		alert(status+"\n server�� ���� ���� ���� : " + serverData);
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
			alert(status+"\n server�� ���� ���� ���� : " + serverData);
		}, "text") // �⺻ ����� ���� ��Ʈ���̴�.
	})
	})
	});*/
</script>