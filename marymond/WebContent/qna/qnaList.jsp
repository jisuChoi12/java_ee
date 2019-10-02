<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.mypage_right_container_qnaList {
	margin-top: 20px;
	margin-left: 30px;
	display: inline-block;
	width: 900px;
	text-align: left;
	vertical-align: top;
	height: auto;
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
	<div class="mypage_right_container_qnaList">
		<!-- 문의목록 -->
		<div class="qna_list_wrap">
			<h3 style="padding-left: 40px; margin-bottom: 20px;">문의내역</h3>
			<table border="1" cellspacing="0" frame="hsides" rules="rows" cellpadding="2" width="800px">
				<tr style="text-align: center">
					<th align="center">제목</th>
					<th align="center">작성일</th>
					<th align="center">답변</th>
				</tr>
				<c:if test="${list != null }">
					<c:forEach var="qnaDTO" items="${list }">
						<tr>
							<td><a href="javascript:void(0)"onclick="qnaView('${qnaDTO.seq}')">${qnaDTO.qna_subject }</a></td>
							<td style="text-align: center; padding-left: 0px;">${qnaDTO.qna_write_logtime }</td>
							<td style="text-align: center; padding-left: 0px;">${qnaDTO.qna_reply_status }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	function qnaView(seq){
		location.href="/marymond/board/qna_view.do?seq="+seq;
	}
</script>