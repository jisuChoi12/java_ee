<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input</title>
</head>
<body>
	<form name="input" method="post" action="sum.jsp">
		<table border=0 cellspacing="2" cellpadding="5">
			<tr>
				<td>x</td>
				<td><input type="text" name="x"></td>
			</tr>
			<tr>
				<td>y</td>
				<td><input type="text" name="y"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="합구하기" onclick="check()"></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	function check() {
		if (document.input.x.value == "") {
			alert("x 값을 입력하세요");
			document.input.x.focus();
		} else if (document.input.y.value == "") {
			alert("y 값을 입력하세요");
			document.input.y.focus();
		} else {
			document.input.submit();
		}
	}
</script>
</html>