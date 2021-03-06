<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

<!--360 browser -->
<meta name="renderer" content="webkit">
<meta name="author" content="wos">
<!-- Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="images/i/app.png">
<!--Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="apple-touch-icon-precomposed" href="images/i/app.png">
<!--Win8 or 10 -->
<meta name="msapplication-TileImage" content="images/i/app.png">
<meta name="msapplication-TileColor" content="#e1652f">

<link rel="icon" type="image/png" href="images/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="css/public.css">

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
    <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
    <script src="assets/js/amazeui.ie8polyfill.min.js"></script>
    <![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="js/public.js"></script>
</head>
<body>
	<%@include file="headTemp.jsp"%>
	<div class="category2top">
		<div class="am-g am-container userinfo">
			<div class="am-u-sm-12 am-u-md-12 am-u-lg-5 userinfo_left">
				<div class="am-g">
					<div class="am-u-md-12 am-u-lg-6 userface">
						<img src="${userInfo.userUri}">
					</div>
					<div class="am-u-md-12 am-u-lg-6 userin">
						<h3>${userInfo.userName}</h3>
						<p>
							文章<span>${userInfo.userPassageNum}</span>
						</p>

					</div>
				</div>

			</div>
			<div
				class="am-u-sm-0 am-u-md-12 am-u-lg-4 am-show-lg-only userinfo_center">
				<c:choose>
					<c:when test="${empty userInfo.userBrief}">
							这个人很懒，什么都没有留下
						</c:when>
					<c:otherwise>
						${userInfo.userBrief}
						</c:otherwise>
				</c:choose>
			</div>
			<div
				class="am-u-sm-12 am-u-md-12 am-u-lg-3 am-show-lg-only userinfo_right">
				<c:if test="${LOGIN_YES.userId ne userInfo.userId}">
					<button id="followBtn" type="button"
						class="am-btn am-btn-warning am-round" onclick="follow()">
						<i class="am-icon-plus"></i> 关注
					</button>

					<button class="am-btn am-btn-warning am-round am-btn-default"
						onclick="window.open('/user/follow?userId=${userInfo.userId}')">ta的关注</button>
				</c:if>

			</div>

		</div>
	</div>

	<div class="am-g">
		<div class="am-u-sm-0 am-u-md-2 am-u-lg-3">&nbsp;</div>
		<div class="am-u-sm-12 am-u-md-8 am-u-lg-6">
			<div data-am-widget="list_news"
				class="am-list-news am-list-news-default ">
				<div class="am-list-news-bd">
					<ul class="am-list">
						<c:forEach items="${pageInfo.list}" var="passage">
							<li
								class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left"
								style="border-top: 0px">
								<div class="am-u-sm-5 am-list-thumb">
									<a href="/news/${passage.passageId}"> <img
										src="${passage.passagePicture}" alt="${passage.passageTitle}" />
									</a>
								</div>

								<div class=" am-u-sm-7 am-list-main">
									<h2 class="am-list-item-hd">
										<a href="/news/${passage.passageId}">${passage.passageTitle}</a>
									</h2>


								</div>
							</li>
							<div class="newsico am-fr">
								<i class="am-icon-clock-o"><fmt:formatDate
										value="${passage.passageTime}" pattern="yyyy-MM-dd" /> </i>
							</div>
						</c:forEach>
					</ul>
					<ul data-am-widget="pagination"
						class="am-pagination am-pagination-default"
						style="text-align: center">

						<c:choose>
							<c:when test="${pageInfo.pageNum eq 1}">
								<li class="am-pagination-first am-disabled"><a href="#"
									class="">第一页</a></li>

								<li class="am-pagination-prev am-disabled"><a href="#"
									class="">上一页</a></li>
							</c:when>
							<c:otherwise>
								<li class="am-pagination-first "><a
									href="/userIndex/${userInfo.userId}?start=1" class="">第一页</a></li>

								<li class="am-pagination-prev "><a
									href="/userIndex/${userInfo.userId}?start=${pageInfo.pageNum-1}"
									class="">上一页</a></li>
							</c:otherwise>
						</c:choose>



						<c:forEach begin="1" end="${pageInfo.pages}" step="1" var="i">
							<c:choose>
								<c:when test="${i eq pageInfo.pageNum}">
									<li class="am-active am-disabled"><a href="">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="/userIndex/${userInfo.userId}?start=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${pageInfo.pages eq pageInfo.pageNum}">
								<li class="am-pagination-next am-disabled"><a href="#"
									class="">下一页</a></li>

								<li class="am-pagination-last am-disabled"><a href="#"
									class="">最末页</a></li>
							</c:when>
							<c:otherwise>
								<li class="am-pagination-next"><a
									href="/userIndex/${userInfo.userId}?start=${pageInfo.pageNum+1}"
									class="">下一页</a></li>

								<li class="am-pagination-last "><a
									href="/userIndex/${userInfo.userId}?start=${pageInfo.pages}"
									class="">最末页</a></li>
							</c:otherwise>
						</c:choose>


					</ul>
				</div>
			</div>
		</div>
		<div class="am-u-sm-0 am-u-md-2 am-u-lg-3">&nbsp;</div>
	</div>



	<div data-am-widget="gotop" class="am-gotop am-gotop-fixed">
		<a href="#top" title="回到顶部"> <span class="am-gotop-title">回到顶部</span>
			<i class="am-gotop-icon am-icon-chevron-up"></i>
		</a>
	</div>
	<%@include file="floorTemp.jsp"%>

	<script type="text/javascript">
		var isFollow = false; //当前用户是否已经关注该用户，false代表未关注

		/* 加载该页面时判断当前登陆用户是否已经关注该用户 */
		$(function() {
			$.ajax({
				type : "POST",
				url : "/user/isFollow",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify({
					'userId' : '${LOGIN_YES.userId}',
					'followId' : '${userInfo.userId}'
				}),
				dataType : "json",
				success : function(message) {
					if (message.error == 1) {
						$("#followBtn").text("取消关注");
						isFollow = true;
					}
				},
				error : function() {
					alert('网络错误');
				}
			});
		});

		/* 关注用户 */
		function follow() {
			if ("${LOGIN_YES}" == null || "" == "${LOGIN_YES}") {
				alert("请先登陆");
				return false;
			}
			if (isFollow == false) {
				$.ajax({
					type : "POST",
					url : "/user/followUser",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify({
						'userId' : '${LOGIN_YES.userId}',
						'followId' : '${userInfo.userId}'
					}),
					dataType : "json",
					success : function(message) {
						if (message.error == 0) {
							$("#followBtn").text("取消关注");
							isFollow = true;
						}
					},
					error : function() {
						alert('网络错误');
					}
				});
			}else{
				$.ajax({
					type : "POST",
					url : "/user/cancelFollowUser",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify({
						'userId' : '${LOGIN_YES.userId}',
						'followId' : '${userInfo.userId}'
					}),
					dataType : "json",
					success : function(message) {
						if (message.error == 0) {
							$("#followBtn").text("关注")
							isFollow = false;
						}
					},
					error : function() {
						alert('网络错误');
					}
				});
			}
		}
	</script>

</body>
</html>
