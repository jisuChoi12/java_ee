<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.mypage_right_container_qnaView {
	margin-top: 20px;
	margin-left: 30px;
	display: inline-block;
	width: 900px;
	text-align: left;
	vertical-align: top;
	height: auto;
}

.mypage_right_container_qnaView tr, td {
	padding-left: 40px;
	padding-right: 40px;
	padding-top: 10px;
	padding-bottom: 10px;
}

/* .qna_list_wrap tr, td {
	text-align: left;
	padding-left: 0px;
} */
/* frame="hsides" rules="rows"  */
</style>
<link rel="stylesheet" href="../css/mypage.css">
<div class="mypage_wrap">
	<jsp:include page="../member/mypage_leftside.jsp" />

	<c:if test="${sessionScope.memId != qnaDTO.qna_id}">
		<div class="mypage_right_container_qnaView">
			<!-- 문의글 -->
			<div class="qna_view_wrap">
				<h3 style="padding-left: 40px; margin-bottom: 20px;">본인이 작성한
					문의글이 아닙니다</h3>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.memId == qnaDTO.qna_id}">
		<div class="mypage_right_container_qnaView">
			<!-- 문의글 -->
			<div class="qna_view_wrap">
				<h3 style="padding-left: 40px; margin-bottom: 20px;">나의 문의글</h3>
				<table id="qna_view_table" border="1" cellspacing="0" frame="hsides"
					rules="rows" cellpadding="2" width="800px">
					<tr>
						<td>${qnaDTO.qna_subject }</td>
					</tr>
					<tr>
						<td
							style="height: 200px; vertical-align: top; white-space: pre-wrap;">${qnaDTO.qna_content }</td>
					</tr>
					<tr id="reply_content_tr">
						<td
							style="height: 200px; vertical-align: top; background-color: #f8f8f8; white-space: pre-wrap;">${qnaDTO.qna_reply_content }</td>
					</tr>
				</table>
			</div>
		</div>
	</c:if>
</div>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if(${qnaDTO.qna_reply_status!='no'}){
			/* $('#qna_view_table').text */
		} else {
			$('#reply_content_tr').hide();
		}
	});
</script>