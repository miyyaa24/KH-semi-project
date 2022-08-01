<%@page import="semi.heritage.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더부 구현할 기능 리스트 -->
<!-- 1. 로그인 공통부 기능 구현 -->
<!-- 2. 메뉴(네비게이션) 기능 작성 -->

<%
 	String path = request.getContextPath();

String saveId = "";
	Member loginMember = (Member)session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId = c.getValue();
				break;
			}
		}
	} 
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>史뿐史뿐</title>
    <!-- SEO Meta Tags-->
    <meta name="description" content="Finder - Directory &amp; Listings Bootstrap Template">
    <meta name="keywords" content="bootstrap, business, directory, listings, e-commerce, car dealer, city guide, real estate, job board, user account, multipurpose, ui kit, html5, css3, javascript, gallery, slider, touch">
    <meta name="author" content="Createx Studio">
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
    <link rel="manifest" href="site.webmanifest">
    <link rel="mask-icon" color="#5bbad5" href="safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#766df4">
    <meta name="theme-color" content="#ffffff">
    <!-- Page loading styles-->
    <style>
    
    	.img-contain {
            width: 300px;
            height: 170px;
            object-fit: cover;
        }
        
        .img-contain2 {
            width: 421px;
            height: 280px;
            object-fit: cover;
        }
        
        .img-contain3 {
            width: 858px;
            height: 572px;
            object-fit: cover;
        }
        
        .p01 {
            line-height: -10px;
            letter-spacing: -7px;
            word-spacing: 10px;
            /* font-weight: bolder; */
        }
        
        .p02 {
            line-height: 20px;
            letter-spacing: -10px;
            word-spacing: 10px;
            /* font-weight: bolder; */
        }
        
        .p03 {
            line-height: 10%;
            letter-spacing: -3px;
            word-spacing: 10px;
            /* font-weight: bolder; */
        }
        
        .p04 {
            letter-spacing: -3px;
            word-spacing: 5px;
            /* font-weight: bolder; */
        }
        
        .p05 {
            letter-spacing: -1px;
            word-spacing: 5px;
            /* font-weight: bolder; */
        }
        
        .p06 {
            line-height: 50%;
            letter-spacing: -1px;
            word-spacing: 3px;
            font-size: 15px;
        }
        .image-bg-cover {
            width: 50px;
            height: 50px;
            background-image: url();
            background-size: cover;
            z-index: 9999;
        }
        
        .left-box {
            float: left;
        }
        
        .right-box {
            float: right;
        }
        
        .page-loading {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            -webkit-transition: all .4s .2s ease-in-out;
            transition: all .4s .2s ease-in-out;
            background-color: #fff;
            opacity: 0;
            visibility: hidden;
            z-index: 9999;
        }
        
        .page-loading.active {
            opacity: 1;
            visibility: visible;
        }
        
        .page-loading-inner {
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            text-align: center;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            -webkit-transition: opacity .2s ease-in-out;
            transition: opacity .2s ease-in-out;
            opacity: 0;
        }
        
        .page-loading.active>.page-loading-inner {
            opacity: 1;
        }
        
        .page-loading-inner>span {
            display: block;
            font-size: 1rem;
            font-weight: normal;
            color: #666276;
            ;
        }
        
        .page-spinner {
            display: inline-block;
            width: 2.75rem;
            height: 2.75rem;
            margin-bottom: .75rem;
            vertical-align: text-bottom;
            border: .15em solid #bbb7c5;
            border-right-color: transparent;
            border-radius: 50%;
            -webkit-animation: spinner .75s linear infinite;
            animation: spinner .75s linear infinite;
        }
        
        @-webkit-keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        
        @keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        
    </style>
    <!-- Page loading scripts-->
    <!-- <script>
        (function() {
            window.onload = function() {
                var preloader = document.querySelector('.page-loading');
                preloader.classList.remove('active');
                setTimeout(function() {
                    preloader.remove();
                }, 2000);
            };
        })();
    </script> -->
    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="<%=path%>/resources/vendor/simplebar/dist/simplebar.min.css" />
    <link rel="stylesheet" media="screen" href="<%=path%>/resources/vendor/tiny-slider/dist/tiny-slider.css" />
    <link rel="stylesheet" media="screen" href="<%=path%>/resources/vendor/flatpickr/dist/flatpickr.min.css" />
    <link rel="stylesheet" media="screen" href="<%=path%>/resources/vendor/lightgallery/css/lightgallery-bundle.min.css" />
    <link rel="stylesheet" media="screen" href="<%=path%>/resources/vendor/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css" />
	<link rel="stylesheet" media="screen" href="<%=path%>/resources/vendor/filepond/dist/filepond.min.css" />
	<link rel="stylesheet" media="screen" href="<%=path%>/resources/vendor/nouislider/dist/nouislider.min.css" />
    
    
    
    <!-- Main Theme Styles + Bootstrap-->
   <!--  <link rel="stylesheet" media="screen" href="css/theme.min.css"> -->
   <link rel="stylesheet" media="screen" href="<%=path%>/resources/css/theme.min.css" >
   <%--  <link rel="stylesheet" href="<%=path%>/resources/css/theme.css"> --%>
</head>
<!-- Body-->

<body class="main_body">
    <!-- Page loading spinner-->
    <!-- <div class="page-loading active">
        <div class="page-loading-inner">
            <div class="page-spinner"></div><span>Loading...</span>
        </div>
    </div> -->
    <main class="page-wrapper">
        <!-- Navbar-->
        <header class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-scroll-header>
            <div class="container ">
                <!--container-fluid 이거 내가 지웠음-->
                <a class="navbar-brand me-3 me-xl-4" href="real-estate-home-v1.html"><img class="d-block" src="<%=path%>/resources/img/semi-img/logo_spsp_1.png" width="110" alt="spsp"></a>
                <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <a class="btn btn-sm  d-none d-lg-block order-lg-3 p05" href="#signin-modal" data-bs-toggle="modal" style="font-size: 22px; color: #D97793;"><i class="fi-user me-2"></i>로그인</a>
                <a class="btn btn-primary rounded-pill ms-2 order-lg-3 p05" href="job-board-post-resume-1.html" style="background-color: #D97793; font-size: 22px;">About Us</a>
                <div class="collapse navbar-collapse order-lg-2" id="navbarNav">
                    <ul class="navbar-nav navbar-nav-scroll" style="max-height: 35rem;">
                        <!-- Demos switcher-->
                        <li class="nav-item dropdown me-lg-2 p05">
                            <a class="nav-link  align-items-center pe-sm-1" href="#" data-bs-toggle="dropdown" role="button" aria-expanded="false" style="font-size: 22px;">
                                <b>홈으로</b><span class="d-none d-lg-block position-absolute top-50 end-0 translate-middle-y accordion-flush" style="width: 1px; height: 30px;"></span></a>
                        </li>
                        <li class="nav-item dropdown me-lg-2 p05">
                            <a class="nav-link  align-items-center pe-sm-1" href="#" data-bs-toggle="dropdown" role="button" aria-expanded="false" style="font-size: 22px;">
                                <b>문화재검색</b><span class="d-none d-lg-block position-absolute top-50 end-0 translate-middle-y " style="width: 1px; height: 30px;"></span></a>
                        </li>
                        <li class="nav-item dropdown me-lg-2 p05">
                            <a class="nav-link align-items-center pe-sm-1" href="#" data-bs-toggle="dropdown" role="button" aria-expanded="false" style="font-size: 22px;">
                                <b>문화일정</b><span class="d-none d-lg-block position-absolute top-50 end-0 translate-middle-y " style="width: 1px; height: 30px;"></span></a>
                        </li>
                        <li class="nav-item dropdown me-lg-2 p05">
                            <a class="nav-link  align-items-center pe-sm-1" href="#" data-bs-toggle="dropdown" role="button" aria-expanded="false" style="font-size: 22px;">
                                <b>사뿐<span style="color: #D97793;">코스</span></b><span class="d-none d-lg-block position-absolute top-50 end-0 translate-middle-y " style="width: 1px; height: 30px;"></span></a>
                        </li>
                        <li class="nav-item dropdown me-lg-2 p05">
                            <a class="nav-link  align-items-center pe-sm-1" href="#" data-bs-toggle="dropdown" role="button" aria-expanded="false" style="font-size: 22px;">
                                <b>사뿐<span style="color:#D97793;">몰</span></b><span class="d-none d-lg-block position-absolute top-50 end-0 translate-middle-y " style="width: 1px; height: 30px;"></span></a>
                        </li>
                        <li class="nav-item dropdown me-lg-2 p05">
                            <a class="nav-link dropdown-toggle align-items-center pe-sm-1" href="#" data-bs-toggle="dropdown" role="button" aria-expanded="false" style="font-size: 22px;">
                                <b>커뮤니티</b><span class="d-none d-lg-block position-absolute top-50 end-0 translate-middle-y " style="width: 1px; height: 30px;"></span></a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="real-estate-home-v1.html" style="font-size: 20px;"><i class="fs-base opacity-50 me-2" ></i><b>함께해요</b></a></li>
                                <li class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="car-finder-home.html" style="font-size: 20px;"><i class="fs-base opacity-50 me-2" ></i><b>역사연구소</b></a></li>
                                <li class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="job-board-home-v1.html" style="font-size: 20px;"><i class="fs-base opacity-50 me-2" ></i><b>자유게시판</b></a></li>
                            </ul>
                        </li>
                </div>
            </div>
        </header>

