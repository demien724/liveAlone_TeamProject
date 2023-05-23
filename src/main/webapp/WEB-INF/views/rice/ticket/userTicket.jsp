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
			url : "userTicketAjax",		
			data :  {
				pageNo : 1
			},
			success : function(data){
				$("#userTicketList").append(data)
			}, error : function(){
				console.log("Error");
			}
		}) 
		
		
		$(".page-button-num").click(function(){
			let num = $(this).val();
			
			$.ajax({
				url : "userTicketAjax",
				data : {
					pageNo : num
				},
				success : function(data){
					let rowCount = $(data).find(".ticket-row").length;
					
					if(rowCount != 0){
						$("#userTicketList").empty();
						$("#userTicketList").append(data);
					}
					
				}, error : function(){
					console.log("Error");
				}
			})
			
		})
	})
</script>


<script type="text/javascript">
$(function(){
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="ticket-info">
		<div class="ticket-info-one">
			<h3></h3>
		</div>
		<div class="ticket-info-one" id="userTicketList">
			
		</div>
		<div class="ticket-info-one">
			<div class="ticket-page-buttons">
				<button class="page-button" value="left">◀</button>
				<% for(int i=1; i <= 5; i++) { %>
				<button class="page-button-num" id="page-button-num-<%= i %>" value='<%= i %>'><%= i %></button>
				<% } %>
				<button class="page-button" value="right">▶</button>
			</div>
		</div>
	</div>
</body>
</html>