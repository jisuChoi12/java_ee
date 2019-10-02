<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.mypage_right_container_qnaForm {
	margin-top: 20px;
	margin-left: 30px;
	display: inline-block;
	width: 900px;
	text-align: left;
	vertical-align: top;
	height: auto;
}

#max_subject_length {
	position: absolute;
	left: 900px;
	top: 360px;
}
</style>
<link rel="stylesheet" href="../css/mypage.css">
<div class="mypage_wrap">
	<jsp:include page="../member/mypage_leftside.jsp" />
	<div class="mypage_right_container_qnaForm">
		<!-- 문의하기 -->
		<div class="qna_form_wrap">
			<h3 style="padding-left: 40px; margin-bottom: 20px;">문의하기</h3>
			<form id="qna_write_form" name="qna_write_form" method="post" enctype="multipart/form-data" action="/marymond/board/qna_write.do">
				<table class="qna_form_table" style="width: 100%;">
					<tr>
						<td>아이디</td>
						<td style="height: 35px;"><input type="text" id="qna_id" name="qna_id" value="${memId }" readonly="readonly" style="width: 410px; height: 35px;"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" id="qna_subject" name="qna_subject"
							style="width: 410px; height: 35px;"
							placeholder="제목을 입력해주세요. (최대  60자)"><span
							id="max_subject_length">0/60</span></td>
					</tr>
					<tr>
						<td colspan="2"><textarea id="qna_content" name="qna_content"
								style="width: 500px; height: 200px; resize: none"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input id="qna_file" name="qna_file" type="file" value="파일첨부"
							style="width: 100%"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="문의하기"
							id="qna_submit" name="qna_submit"
							style="width: 100%; height: 40px; border: 0; outline: 0; background-color: #333; color: white; font-size: 16px;">
							<div id="qnaDiv"></div></td>
	
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#qna_subject').keyup(function() {
			var len = $(this).val().length;
			$('#max_subject_length').html(len + '/60');
			if (len > 60) {
				$('#max_subject_length').css('color', 'red');
			} else {
				$('#max_subject_length').css('color', 'black');
			}
		});
		$('#qna_submit').click(function(){
			var subject = $('#qna_subject').val();
			var content = $('#qna_content').val();
			if(subject.length>0 && subject.length <=60 && content.length !=0 ){
				$('#qna_write_form').submit();
				/* $.ajax({
					type : 'POST',
					enctype : 'multipart/form-data',
					url : '/marymond/board/qna_write.do',
					data : $('#qna_write_form').serialize,
					dataType : 'json',
					success : function(data) {
						if(data.result=="ok"){
							alert("문의가 완료되었습니다");
							location.href="/marymond/member/mypage.do";
						} else if(data.result=="fail"){
							location.href="/marymond/member/mypage.do";
							alert("문의 실패");
						}
					},
					error : function() {
						alert("에러");
					}
				}); */
			} else {
				$('#qnaDiv').text("항목을 확인하세요").css('color', 'red').css('font-size', '10pt');
			}
		});
	});
</script>