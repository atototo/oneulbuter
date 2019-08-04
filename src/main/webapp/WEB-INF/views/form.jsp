<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="upload.do" enctype="multipart/form-data">

         <label>filename:</label>

         <input type="text" name="filename">




         <br><br>


         <label>파일:</label>

         <input type="file" name="file1">




         <br><br>




         <input type="submit" value="upload">

</form>
</body>
</html>