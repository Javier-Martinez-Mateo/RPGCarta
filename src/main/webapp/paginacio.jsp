<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Rpg Card Generator</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<h1 class="titol">Visualitzar cartes</h1>
<ul class="breadcrumb">
	<li><a href="index.jsp">Inici</a></li>
	<li>Visualitzar cartes</li>
</ul>
<br>
<br>
<%
//  variables per fer la connexio:
String usuario = request.getParameter("usuario");
String passwd = request.getParameter("passwd");
String user = "carta";
String password = "1234";
String host = "localhost";
String db = "cartaRPG";
String url = "jdbc:mysql://" + host + "/" + db;
Connection conn = null;
Statement statement = null;
Statement num_registres = null;
ResultSet rs = null;
ResultSet num_reg = null;
int inicio;

//Limito la busqueda
int TAMANO_PAGINA = 4;

//examino la página a mostrar y el inicio del registro a mostrar
String pag = request.getParameter("pagina");
int pagina = Integer.parseInt(pag);
if (pagina == 0) {
	inicio = 0;
	pagina = 1;
} else {
	inicio = (pagina - 1) * TAMANO_PAGINA;
}
/**
//miro a ver el número total de campos que hay en la tabla con esa búsqueda
**/
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(url, user, password);
num_registres = conn.createStatement();
//inmediatamente hacemos una consulta sencilla
//creamos la consulta
num_reg = num_registres
		.executeQuery("SELECT * from carta where id_user ='" + usuario+"';");
int num_total_registros = 0;
while (num_reg.next()) {
	num_total_registros++;
}

//calculo el total de páginas
int total_paginas = (int) Math.ceil(((double) num_total_registros / TAMANO_PAGINA));

//pongo el número de registros total, el tamaño de página y la página que se muestra

out.print("Nombre de registres trobats:" + num_total_registros + "<br>");
out.print("Es mostren pàgines de " + TAMANO_PAGINA + " registres cadascuna<br>");
out.print("Mostrant la pàgina " + pagina + " de " + total_paginas + "<p><br>");

//out.print("<a href=VisualitzarCartes.jsp?pagina=2>"+2+"</a> ");
if (total_paginas > 1) {
	for (int i = 1; i <= total_paginas; i++) {
		if (pagina == i)
	//si muestro el índice de la página actual, no coloco enlace
	out.print(pagina);
		else
	//si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
	out.print(" <a href=paginacio.jsp?pagina=" + i + ">" + i + "</a> ");
	}
}
out.print("<br><br>");
try {

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, user, password);
	statement = conn.createStatement();
	//inmediatamente hacemos una consulta sencilla
	//creamos la consulta
	String sentence = "SELECT * from carta where id_user = '" + usuario+"'" 
	+ "limit " + inicio + "," + TAMANO_PAGINA;
	rs = statement.executeQuery(sentence);
	//leemos lia consulta
	while (rs.next()) {
		//mostramos los resultados obtenidos
		//out.println(rs.getString("ID_carta"));
		//String nom=request.getParameter("nom");
		//windows.location.href="Paginacio.jsp?pagina=0&race="+valor;
%>
<div id="centrar">
	<div id="cartai">
		<div id="cabecera">
			<img src="img/<%out.print(rs.getString("picture"));%>.png"
				height="100" width="80">
		</div>
		<div>
			PV:<%
		out.print(rs.getString("pv"));
		%><br>
			<table width="<%out.print(rs.getString("pv"));%>" bgcolor="red">
				<tr>
					<td></td>
				</tr>
			</table>
			PM:<%
			out.print(rs.getString("pm"));
			%><br>
			<table width="<%out.print(rs.getString("pm"));%>" bgcolor="blue">
				<tr>
					<td></td>
				</tr>
			</table>

		</div>
		<div>
			race:<%
out.print(rs.getString("race"));
%>
		</div>
		<div>
			<%out.print(rs.getString("nombre"));%>
		</div>
		<div>
			<%out.print(rs.getString("id_user"));%>
		</div>
		<div>
			FUE:<%
		out.print(rs.getString("fue"));
		%>
			DES:<%
		out.print(rs.getString("des"));
		%>
		</div>
		<div>
			CON:<%
		out.print(rs.getString("con"));
		%>
			INT:<%
		out.print(rs.getString("intel"));
		%>
		</div>
		<div>
			SAB:<%
		out.print(rs.getString("sab"));
		%>
			CAR:<%
		out.print(rs.getString("car"));
		%>
		</div>
	</div>
</div>
<%
}
//cerramos la conexión
rs.close();
} catch (SQLException error) {
out.print("Error de Conexión : " + error.toString());
}
%>