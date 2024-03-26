<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>��ٱ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/basket/listBasket" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">��ٱ���</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.maxPage } �Ǽ�, ����
						${resultPage.currentPage } ������</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="30">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" >��ǰ ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">��ǰ ����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">����</td>
					<td class="ct_line02"></td>
				</tr>
				<tr>
					<td colspan="17" bgcolor="808285" height="1"></td>
				</tr>

				<c:set var="i" value="0" />
				<c:forEach var="basket" items="${list }">
					<c:set var="i" value="${i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">${i }</td>
						<td></td>
						<td align="left"><a
							href="/product/getProduct/${basket.prodNo }/search"> ${basket.basketProd.prodName}</a>
						</td>
						<td></td>
						<td align="left">${basket.basketQuantity }</td>
						<td></td>
						<td align="left"><a
							href="/"> ����</a>
						</td>
						<td></td>
						<td align="left"><a
							href="/basket/removeBasket/${basket.basketNo }"> ����</a>
						</td>
						<td></td>
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