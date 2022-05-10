<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<title>Insert title here</title>
</head>
<body>
<h1>Carta</h1>
<form action="doc.jsp" method="post">
<label for="usuario">Usuario:</label>
<input id="usuario" type="text" name="usuario" />
 <input type="submit" name="enviar" value="Crear Carta"/>
</form>
<br>
<form action="paginacio.jsp?pagina=0" method="post">
<label for="usuario">Usuario:</label>
<input id="usuario" type="text" name="usuario" />
<input type="submit" name="enviar" value="Ver carta"/>
<div class="g-recaptcha" data-sitekey="6LcSOKwaAAAAAJgVissf4b74UqaAoHh-XVkSHloy"></div>
</form>
</body>
</html>