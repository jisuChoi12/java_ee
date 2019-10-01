<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../css/mypage.css">
<style>
.content_wrap {
	background-color: #f8f8f8;
	overflow: auto;
	padding-right: 20px;
}
</style>
<div class="mypage_wrap">
	<jsp:include page="mypage_leftside.jsp" />
	<div class="mypage_right_container_faq">
		<c:if test="${list != null }">
			<table id="faq_table" border="1" frame="hsides" rules="rows"
				cellspacing="0" cellpadding="2" width="800px">
				<tr align="center">
					<th>제목</th>
				</tr>
				<c:forEach var="faqDTO" items="${list }" varStatus="i">
					<tr>
						<td class="subject_wrap"><a href="javascript:void(0)"
							id='faq${i.count }'>Q.&nbsp;${faqDTO.subject }</a></td>
					</tr>
					<tr>
						<td class="faq${i.count } content_wrap">A.&nbsp;${faqDTO.content }</td>
					</tr>
					<tr></tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</div>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.content_wrap').hide();
		$('.subject_wrap').on({
			click : function(){
				var aaa = $(this).attr('id');
				$('.'+aaa).slideToggle();
			}
		},'a');
	});
</script>