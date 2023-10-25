<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/mainhome.css">

<main>


<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	<c:forEach begin = "0" end = "5" items= "${liquorList}" var = "liquor">
	var lid = ${liquor.lid}
	$.getJSON("/liquor/getAttachList", {lid:lid}, function(arr){
		var str = "";
		console.log(arr[0].uuid)
		obj = arr[0];
		var targetLid = arr[0].lid;
		var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		var targetImage = $('img[data-lid="' + targetLid + '"]');
		str += '/display?fileName=';
		str += ''+fileCallPath+'';
		targetImage.attr('src', str);
	});
</c:forEach>


	$(".moveForm a").on("click" , function(e){
		var moveForm = $(".moveForm");
		e.preventDefault();
		var lid = $(this).data('lid');
		moveForm.append("<input type ='hidden' name = 'lid' value = '"+lid+"' >");
		moveForm.submit();
		
		
	});
			
}); //ready
	

</script>

<div id="carouselExampleIndicators" class="m-5carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="4000">
      <img src="/resources/images/main/main1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="4000">
      <img src="/resources/images/main/main2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="4000">
      <img src="/resources/images/main/main3.jpg" class="d-block w-100" alt="...">
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  </div>
  
</div>

<form class = "moveForm" action = "/liquor/read" method = "get">
<div class="m-5 row row-cols-1 row-cols-md-3 g-4">
<c:forEach begin = "0" end = "5" items="${liquorList}" var="liquor">
  <div class="col">
    <div class="card h-100">
      <img data-lid = "${liquor.lid}" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${liquor.name }</h5>
        <p class="card-text">${liquor.description }</p>
      </div>
      <div class="card-footer">
       <a data-lid = "${liquor.lid}" href = ""><small class="text-body-secondary">상품페이지로</small></a>
      </div>
    </div>
  </div>
  </c:forEach>
 </div>
</form>

</main>

<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.3/getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>
