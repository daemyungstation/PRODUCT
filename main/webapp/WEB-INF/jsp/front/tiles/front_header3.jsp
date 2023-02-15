<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<title><c:if test="${not empty pageTitl}">${fn:replace(fn:replace(pageTitl, '@@', ''), '&lt;br&gt;', '')}</c:if> | 대명아임레디</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0,target-densitydpi=medium-dpi" />
		<meta name="author" content="<fmt:message key="Globals.httpUrl" />" />
		<meta name="keywords" content="" />
		<meta name="description" content="라이프케어, 상조/웨딩/여행, 업계 최초 멤버십/결합혜택, 회원가입, 고객센터" />
		<meta name="format-detection" content="telephone=no" />
		<meta property="og:type" content="article" />
		<meta property="og:site_name" content="대명라이프웨이" />
		<meta property="og:title" content="대명라이프웨이" />
		<meta property="og:description" content="라이프케어, 상조/웨딩/여행, 업계 최초 멤버십/결합혜택, 회원가입, 고객센터" />
		<meta property="og:image" content="<fmt:message key="Globals.httpUrl" />/common/images/logo.gif" />

		<link rel="stylesheet" href="/common/css/lifeway_style.css?v=202208261" />
		<link rel="stylesheet" href="/common/css/jquery-ui-1.8.16.custom.css" />
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
		
        <link href="/common/css/bootstrap.min.css" id="bootstrap-stylesheet" rel="stylesheet" type="text/css" />
        <link href="/common/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/common/css/app.min.css" id="app-stylesheet" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript">
		$(document).ready(function(){
		});
		</script>
		<script type="text/javascript">
		//<![CDATA[
			
			var oneNum = -1, twoNum = -1, thrNum = -1, fouNum = -1;
			
			<c:forEach var="indicator" items="${parntMenuList}" varStatus="status">
				<c:choose>
					<c:when test="${status.count eq 1}">
						oneNum = "${indicator.pstn}";
					</c:when>
					<c:when test="${status.count eq 2}">
						twoNum = "${indicator.pstn}";
					</c:when>
					<c:when test="${status.count eq 3}">
						thrNum = "${indicator.pstn}";
					</c:when>
					<c:when test="${status.count eq 4}">
						fouNum = "${indicator.pstn}";
					</c:when>
				</c:choose>
			</c:forEach>
			
		//]]>
		</script>	
		<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>		
		<script type="text/javascript" src="/common/js/common.js"></script>
		<script type="text/javascript" src="/common/js/fnc.js"></script>
		<script type="text/javascript" src="/common/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="/common/js/jquery.ez.validation-1.3.0.js?v=20220826"></script>
		<script type="text/javascript" src="/common/js/jquery.ez.controller-0.2.0.js"></script>	
		<script type="text/javascript" src="/common/js/jquery-ui.js"></script>
		<script type="text/javascript" src="/common/js/jquery.ui.datepicker-ko.js"></script>
		<script type="text/javascript" src="/common/js/userController.js?v=20221109"></script>

        
		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<style>
			body, .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {font-family: NanumSquareR, dotum, sans-serif;}
		</style>
	</head>
	<body data-url="<fmt:message key="Globals.httpUrl" />"  data-layout="horizontal" data-topbar="dark">
	<input type="hidden" name="gaCode" id="gaCode"/>
 		<div>
			<!-- Navigation Bar-->
            <header id="topnav">

                <!-- Topbar Start -->
                <div class="navbar-custom">
                    <div class="container-fluid">

                        <!-- LOGO -->
                        <div class="logo-box">
                            <a href="/LGU/write.do"><img src="https://www.daemyungimready.com/common/images/main/newIndex_logo.png" alt="" style=" height: 60px; filter: brightness(0) invert(1); margin-top: 8px;"></a>
                        </div>
                        <div class="logo-box">
                            <a href="/LGU/write.do"><img src="/common/images/LGUplus_Logo.png" alt="" style=" height: 42px; margin-top: 8px;"></a>
                        </div>

                        <div class="clearfix"></div>
                    </div> <!-- end container-fluid-->
                </div>
                <!-- end Topbar -->

                
                <!-- end navbar-custom -->

            </header>
			
			<div class="content-page" style="padding-top:72px;">

                <div class="content">



                    <!-- Start Content-->

                    <div class="container-fluid">