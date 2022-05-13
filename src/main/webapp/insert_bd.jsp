<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
	<%
	// variables per fer la connexio:
	String user = "carta";
	String password = "1234";
	String host = "localhost";
	String db = "cartaRPG";
	String url = "jdbc:mysql://" + host + "/" + db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;
	
	// recollim valors formulari:
	String usuario = request.getParameter("usuario");
	String passwd = request.getParameter("passwd");
	String nombre = request.getParameter("nombre");
	String race = request.getParameter("race");
	String picture = request.getParameter("picture");
	String fue = request.getParameter("fue");
	int nfue = Integer.parseInt(fue);
	String des = request.getParameter("des");
	int ndes = Integer.parseInt(des);
	String con = request.getParameter("con");
	int ncon = Integer.parseInt(con);
	String int1 = request.getParameter("int1");
	int nint = Integer.parseInt(int1);
	String sab = request.getParameter("sab");
	int nsab = Integer.parseInt(sab);
	String car = request.getParameter("car");
	int ncar = Integer.parseInt(car);
	String pv = request.getParameter("vida");
	int npv = Integer.parseInt(pv);
	String pm = request.getParameter("mana");
	int npm = Integer.parseInt(pm);
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
		int i = statement.executeUpdate("insert into carta(nombre,id_user,picture,race,fue,des,con,intel,sab,car,pv,pm)values('"
				+ nombre + "','" + usuario + "','"+ picture + "','" + race + "'," + nfue + "," + ndes + "," + ncon + "," + nint + "," + nsab
				+ "," + ncar + "," + npv + "," + npm + ")");
	%>
	<p>Diferencias</p>
	<div id="centrar">
		<div id="cartap">
			<div id="cabecera">
				<img src="img/<%out.print(picture);%>.png" height="100" width="80">
			</div>
			<div>
				PV:<%
			out.print(pv);
			%>
				<table width="<%out.print(pv);%>" bgcolor="red">
					<tr>
						<td></td>
					</tr>
				</table>
				PM:<%
				out.print(pm);
				%>
				<table width="<%out.print(pm);%>" bgcolor="blue">
					<tr>
						<td></td>
					</tr>
				</table>
			</div>
			<div>
				nombre:<%out.print(nombre);%>
			</div>
			<div>
				FUE:<%
			out.print(fue);
			%>
				DES:<%
			out.print(des);
			%>
			</div>
			<div>
				CON:<%
			out.print(con);
			%>
				INT:<%
			out.print(int1);
			%>
			</div>
			<div>
				SAB:<%
			out.print(sab);
			%>
				CAR:<%
			out.print(car);
			%>
			</div>
		</div>
	</div>
	<%
	} catch (SQLException error) {
	out.print("Error de Conexión : " + error.toString());
	}
	%>