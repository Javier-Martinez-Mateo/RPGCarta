<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<p>borrar</p>
<p>no borrar
<h1>Carta</h1>
<form action="doc.jsp" method="post">
 <input type="submit" name="enviar" value="Crear Carta"/>
</form>
<br>
<form action="paginacio.jsp?pagina=0" method="post">
 <input type="submit" name="enviar" value="Ver carta"/>
</form>
</body>
</html>