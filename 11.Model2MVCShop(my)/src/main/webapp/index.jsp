<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
<%-- <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if> --%>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   -->
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

<!--  ///////////////////////// CSS ////////////////////////// -->
<style></style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= 회원원가입 화면이동 =============
	$(function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('회원가입')").on("click", function() {
			self.location = "/user/addUser";
		});
	});

	//============= 로그인 화면이동 =============
	$(function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('로 그 인')").on("click", function() {
			self.location = "/user/login";
		});
	});
</script>

</head>

<body>
	<c:if test="${ empty user }">
		<!-- ToolBar Start /////////////////////////////////////-->
		<div class="navbar  navbar-default">

			<div class="container">

				<a class="navbar-brand" href="#">Model2 MVC Shop</a>

				<!-- toolBar Button Start //////////////////////// -->
				<div class="navbar-header">
					<button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
				</div>
				<!-- toolBar Button End //////////////////////// -->

				<div class="collapse navbar-collapse" id="target">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">회원가입</a></li>
						<li><a href="#">로 그 인</a></li>
					</ul>
				</div>

			</div>
		</div>
	</c:if>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">

			<!--  Menu 구성 Start /////////////////////////////////////-->
			<div class="col-md-3">

				<!--  회원관리 목록에 제목 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
					</div>
					<!--  회원관리 아이템 -->
					<ul class="list-group">
						<li class="list-group-item"><a href="#">개인정보조회</a> <i class="glyphicon glyphicon-user"></i>
						</li>
						<li class="list-group-item"><a href="#">회원정보조회</a> <i class="glyphicon glyphicon-th-list"></i>
						</li>
					</ul>
				</div>

				<c:if test="${sessionScope.user.role == 'admin'}">
				<div class="panel panel-primary ">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="#">판매상품등록</a> <i class="glyphicon glyphicon-apple"></i>
						</li>
						<li class="list-group-item"><a href="#" class="product">판매상품관리</a> <i
							class="glyphicon glyphicon-menu-hamburger"></i></li>
						<li class="list-group-item"><a href="#">배송 관리</a> <i class="glyphicon glyphicon-eject"></i>
						</li>
					</ul>
				</div>
				</c:if>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-shopping-cart"></i> 상품구매
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="#">상품검색</a></li>
						<c:if test="${sessionScope.user.role == 'user'}">
						<li class="list-group-item"><a href="#">구매이력조회</a> <i class="glyphicon glyphicon-phone"></i>
						</li>
						<li class="list-group-item"><a href="#">장바구니</a> <i
							class="glyphicon glyphicon-shopping-cart"></i></li>
						</c:if>
						<li class="list-group-item"><a href="#">최근본상품</a> <i class="glyphicon glyphicon-book"></i>
						</li>
					</ul>
				</div>

			</div>
			<!--  Menu 구성 end /////////////////////////////////////-->

			<!--  Main start /////////////////////////////////////-->
			<div class="col-md-6">
				<c:if test="${ empty user }">
					<div class="jumbotron">
						<h1>Model2 MVC Shop</h1>
						<p>로그인 후 사용가능...</p>
						<p>로그인 전 검색만 가능합니다.</p>
						<p>회원가입 하세요.</p>

						<div class="text-center">
							<a class="btn btn-info btn-lg" href="#" role="button">회원가입</a> <a class="btn btn-info btn-lg"
								href="#" role="button">로 그 인</a>
						</div>
					</div>
				</c:if>
				<c:if test="${ !empty user }">
					<jsp:include page="/main.jsp" />
				</c:if>
			</div>
			<!--  Main end /////////////////////////////////////-->
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->


</body>

</html>