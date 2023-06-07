<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url : "userMileageAjax",
		data : {
			pageNum : 1
		},
		success : function(data){
			$("#user-mileageList").append(data);
		}, error : function(){
			alert("실패")
		}
	})
	
	$(".page-button-num").click(function(){
			let num = $(this).val();
			console.log(num)
			
			$.ajax({
				url : "userMileageAjax",
				data : {
					pageNum : num
				},
				success : function(data){
					let rowCount = $(data).find(".mileageList-table-row").length;
					console.log(rowCount)
					
					if(rowCount != 0){
						$("#user-mileageList").empty();
						$("#user-mileageList").append(data);
					}
					
				}, error : function(){
					console.log("Error");
				} // error 
			}) // Ajax 
		}) // 페이지 버튼
		
	$(".page-button").click(function(){
		let type = $(this).val()	/*	버튼의 값 (오른쪽인가? 왼쪽인가?)	*/
		let num = Number($(this).siblings('#page-button-num-1').val());
		
		let count = 0;
		
			if(type == "right" && num != 96) {
				for(let i = 1; i<=5; i++) {
					count = Number($("#page-button-num-"+i).val())+5
					
					$(("#page-button-num-"+i)).val(count);
					$(("#page-button-num-"+i)).html(count);
					
				}
			} else if(type=="left" && num != 1) {
				for(let i = 1; i<=5; i++) {
					count = Number($("#page-button-num-"+i).val())-5
				
					$(("#page-button-num-"+i)).val(count);
					$(("#page-button-num-"+i)).html(count);
				}
			}
		})
	})
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
<meta charset="UTF-8">
<title>My 마일리지 >> 난 혼자 산다</title>
</head>
<body>
	<%@ include file="/resources/public/header.jsp" %>
	
	<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(../../resources/img/rice/ticket/food-Ticket-unsplash.jpg);">
        <div class="bradcumbContent">
             <p>사용자 마일리지 내역</p>
            <h2>My 마일리지</h2>
        </div>
    </section>
	<section class="login-area section-padding-100">
	  	<div class="oneMusic-buy-now-area mb-100">
	        <div class="container">
	        	<div class="row justify-content-center">
	        		<h5>마일리지 사용 내역 <span>(현재 ${member.mileage }마일리지를 보유하고 있으십니다. )</span></h5>
	        	</div>
	        	<div class="row justify-content-center">
	                <div class="col-12 col-lg-10">
	                    <div class="login-content ticket-info-one" id="user-mileageList">
						
						</div>
	                </div>
	            </div>
	            <p> </p>
	            <div class="row">
	                <div class="col-12">
	                    <div class="load-more-btn text-center">
	                        <button class="btn page-button" value="left">◀</button>
	                        <% for(int i=1; i <= 5; i++) { %>
								<button class="btn page-button-num" id="page-button-num-<%= i %>" value='<%= i %>'><%= i %></button>
							<% } %>
	                        <button class="btn page-button" value="right">▶</button>
	                    </div>
	                </div>
	            </div>
	        </div>
    	</div>
	  </section>
	
	<%@ include file="/resources/public/header.jsp" %>
	<div>
	    <!-- jQuery-2.2.4 js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/jquery/jquery-2.2.4.min.js"></script>
	    <!-- Popper js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/popper.min.js"></script>
	    <!-- Bootstrap js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/bootstrap.min.js"></script>
	    <!-- All Plugins js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/plugins/plugins.js"></script>
	    <!-- Active js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/active.js"></script>
	</div>
</body>
</html>