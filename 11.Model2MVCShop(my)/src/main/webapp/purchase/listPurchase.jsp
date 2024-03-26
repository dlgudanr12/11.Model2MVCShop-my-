<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
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
		$('tr.ct_list_pop').each(function(index) {
			$("tr.ct_list_pop:nth-child("+(2*index+4)+") td:contains('���ǵ���')").on("click",function() {
				var tranNo = $("tr.ct_list_pop:nth-child("+(2*index+4)+") td:nth-child(3)").text().trim();
				var tranCode = $("tr.ct_list_pop:nth-child("+(2*index+4)+") td:last input").val();
				//alert(tranNo + "/" + tranCode);
				$.ajax("/purchaseRest/json/updateTranCode/"+ tranNo+ "/"+ tranCode,{
					method : "GET",
					dataType : "json",
					headers : {
						"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							//alert(JSONData.success);
							$("tr.ct_list_pop:nth-child(" + (2 * index + 4) + ") td:last").empty();
							$("tr.ct_list_pop:nth-child(" + (2 * index + 4) + ") td:nth-child(15)").text("��ۿϷ�");
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
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" >

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">���� �����ȸ</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr class="currentPage">
					<td colspan="11"><input type="hidden" value="${resultPage.currentPage }"/>
					��ü ${resultPage.maxPage } �Ǽ�, ���� ${resultPage.currentPage } ������
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="30">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" >��۹�ȣ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">ȸ��ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">ȸ����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��ǰ����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">��ȭ��ȣ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����Ȳ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��������</td>
				</tr>
				<tr>
					<td colspan="17" bgcolor="808285" height="1"></td>
				</tr>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list }">
					<c:set var="i" value="${i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">${i }</td>
						<td></td>
						<td align="left"><a
							href="/purchase/getPurchase/${purchase.tranNo }/search">${purchase.tranNo }</a>
						</td>
						<td></td>
						<td align="left">${purchase.buyer.userId }
						</td>
						<td></td>
						<td align="left">${purchase.receiverName }</td>
						<td></td>
						<td align="left">${purchase.purchaseProd.prodName }</td>
						<td></td>
						<td align="left">${purchase.tranQuantity }</td>
						<td></td>
						<td align="left">${purchase.receiverPhone }</td>
						<td></td>
						<td align="left"> 
							<c:if test="${purchase.tranCode=='1' }">���ſϷ�
								<a href="/purchase/updatePurchase/${purchase.tranNo }">���� ����</a></c:if>
							<c:if test="${purchase.tranCode=='2' }">�����</c:if> 
							<c:if test="${purchase.tranCode=='3' }">��ۿϷ�</c:if>
						</td>
						<td></td>
						<td align="left"><input type="hidden" value="${purchase.tranCode }"/>
						<c:if test="${purchase.tranCode=='2' }">
								<!-- <a
									href="/purchase/updateTranCode/${purchase.tranNo }/${purchase.tranCode }">���ǵ���</a> -->
									���ǵ���
							</c:if></td>
					</tr>
				<tr>
					<td colspan="17" bgcolor="D6D7D6" height="1"></td>
				</tr>
				</c:forEach>

			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" />
						<jsp:include page="../common/pageNavigatorDefault.jsp"/>
					</td>
				</tr>
			</table>

			<!--  ������ Navigator �� -->
		</form>

	</div>

</body>
</html>