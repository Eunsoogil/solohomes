<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>Modist - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/style.css">
  </head>
  
  <script>
  
  function chkSubmit(){
	  frm = document.forms["frm"];
		
		var rq_subject = frm["rq_subject"].value.trim();
	    if (rq_subject == "") {
	        alert("제목을 입력해주세요");
	        frm["rq_subject"].focus();
	        return false;
	    }
	    
	    var rq_content = frm["rq_content"].value.trim();
	    if (rq_content == "") {
	        alert("내용을 입력해주세요");
	        frm["rq_content"].focus();
	        return false;
	    }
	    
	    return true;
  }

  </script>
  <body>

   
		
		<div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">Collection</h1>
          </div>
        </div>
      </div>
    </div>
		
		<section class="ftco-section contact-section bg-light">
    	<div class="container-fluid">
    		<div class="row">

                <div class="col-md-9 order-md-last d-flex">
                  <form  name="frm" action="${pageContext.request.contextPath}/user/mypage/requestWriteOk.do" method="post" onsubmit="return chkSubmit()" class="bg-white p-5 contact-form">
                    <input type="hidden" name="mb_uid" value="${mb_uid}"/>
               		
                    <div>
                      <select name="rq_type" class="form-group">
                        <option value="1">상품문의</option>
                        <option value="2">배송문의</option>
                        <option value="3">결제문의</option>
                        <option value="4">환불문의</option>
                        <option value="5">기타문의</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <input type="text" name="rq_subject" class="form-control" placeholder="Subject">
                    </div>
                    <div class="form-group">
                      <textarea name="rq_content" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                    </div>
                    <div class="form-group">
                      <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
                    </div>

                  </form>
                
                </div>

        </div>
      </div>
    </section>


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath}/js/user/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/js/user/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/js/user/main.js"></script>
    
  </body>
</html>