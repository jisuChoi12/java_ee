<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<style>

.mainContent {
	display: block;
	width: 1280px;
	font-size: 0px;
	margin: 0 auto;
}

.main_img_list_left {
	display: inline-block;
	width: 50%;
	margin-bottom: 50px;
}
.main_img_list_right {
	display: inline-block;
    width: 50%;
    font-size: 0;
    vertical-align: top;
    padding-top: 200px;
    margin-bottom: 100px;
}

.mainContent img {
	height: 640px;
	width: 640px;
}

.mainContent ul {
	list-style: none;
	padding-left: 0px;
}
</style>
<div class="mainBody" style="height: auto;">
	<jsp:include page="slide.jsp"></jsp:include>
	<div class="mainContent" style="margin-top: -40px;">
		<div class="main_img_list_left">
			<ul>
				<li><a href="/marymond/main/phonecase.do"><img src="../image/pc_home_banner_1.png"></a></li>
				<li><img src="../image/pc_home_banner_2.png" style="margin-top: 50px;"></li>
			</ul>
		</div>
		<div class="main_img_list_right">
			<ul>
				<li><img src="../image/pc_home_banner_3.png"></li>
				<li><img src="../image/pc_home_company.png" style="height: 230px; width: 640px;"></li>
			</ul>
		</div>
	</div>
</div>


