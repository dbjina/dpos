<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Test</title>
	</head>
	<body>
		<form action="" method="get">
			
		</form>
		<button onclick="addBtn()">추가</button>
		
		<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
		<script type="text/javascript">
			function addBtn() {
				$('<input type="checkbox" />').appendTo('form');
			}
		</script>
	</body>
</html>