<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/mypage.css">
<div class="mypage_wrap">
	<jsp:include page="mypage_leftside.jsp"/>
	<div class="mypage_right_container">
		<!-- 회원정보 -->
		<div class="mypage_info">
			<table>
				<tr>
					<td><a href="/marymond/member/modifyForm.do"
						style="text-decoration: underline; font-size: 12px;">내 정보 수정</a></td>
				</tr>
				<tr>
					<td><span class="hello" style="font-family: 'Nanum Myeongjo'; font-size: 16pt;">헬로 마리몬더 </span></td>
				</tr>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.hello').append("<strong>${memName}님</strong>");
	});
</script>