<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<title>Carta</title>
</head>
<body>
	<%!
		public int getValue() {
		int value = 0;
		int daus[] = { 0, 0, 0, 0 };
		for (int i = 0; i < 4; i++) {
			daus[i] = (int) (Math.random() * 6 + 1);
		}
		Arrays.sort(daus);
		for (int i = 1; i < daus.length; i++) {
			value = daus[i] + value;
		}
		return value;
	}

	public int modFUE(int a) {
		int mod = 0;
		switch (a) {
		case 0:break;
		case 1:break;
		case 2:mod = -2;break;
		case 3:mod = -2;break;
		case 4:mod = +2;break;
		case 5:break;
		}
		return mod;
	}

	public int modDES(int a) {
		int mod = 0;
		switch (a) {
		case 0:mod = +2;break;
		case 1:break;
		case 2:break;
		case 3:mod = +2;break;
		case 4:break;
		case 5:break;
		}
		return mod;
	}

	public int modCON(int a) {
		int mod = 0;
		switch (a) {
		case 0:mod = -2;break;
		case 1:mod = +2;break;
		case 2:mod = +2;break;
		case 3:break;
		case 4:break;
		case 5:break;
		}
		return mod;
	}

	public int modINT(int a) {
		int mod = 0;
		switch (a) {
		case 0:mod = +2;break;
		case 1:break;
		case 2:break;
		case 3:break;
		case 4:mod = -2;break;
		case 5:break;
		}
		return mod;
	}

	public int modSAB(int a) {
		int mod = 0;
		switch (a) {
		case 0:break;
		case 1:mod = +2;break;
		case 2:break;
		case 3:break;
		case 4:break;
		case 5:break;
		}
		return mod;
	}

	public int modCAR(int a) {
		int mod = 0;
		switch (a) {
		case 0:break;
		case 1:mod = -2;break;
		case 2:mod = +2;break;
		case 3:break;
		case 4:mod = -2;break;
		case 5:break;
		}
		return mod;
	}
	%>
	<%
	String[] race = { "Elfs", "Nans", "Gnoms", "Mitjans", "Semiorcs", "Humans" };
	String[] race_picture = { "0", "1", "2", "3", "4", "5" };
	String usuario = request.getParameter("usuario");
	String passwd = request.getParameter("passwd");


	int race_random = (int) (Math.random() * race.length);
	%>
	<div class="table">
		<Table id="generar" border="1">
			<caption>
				<b> <%out.print(race[race_random]);%>
				</b>
			</caption>
			<tr>
				<th id="fotozona" rowspan='9'><img
					src='img/<%out.print(race_picture[race_random]);%>.png' alt='imagenes'
					height='100' width='80' title='<%out.print(race[race_random]);%>'></th>
				<th class="redb">Carac.</th>
				<th class="redb">Valor Base</th>
				<th class="redb">Mod.</th>
				<th class="redb">Valor Final</th>
			</tr>
			<tr>
				<td class="redb"><i>FUE:</i></td>
				<td class="redb">
					<%
					int fue = getValue();
					out.print(fue);
					%>
				</td>
				<td class="redb">
					<%
					int fue2 = modFUE(race_random);
					out.print(fue2);
					%>
				</td>
				<td class="redb">
					<%
					fue = fue + fue2;
					out.print(fue);
					%>
				</td>
			</tr>
			<tr>
				<td class="redb"><i>DES:</i></td>
				<td class="redb">
					<%
					int des = getValue();
					out.print(des);
					%>
				</td>
				<td class="redb">
					<%
					int des2 = modDES(race_random);
					out.print(des2);
					%>
				</td>
				<td class="redb">
					<%
					des = des + des2;
					out.print(des);
					%>
				</td>
			</tr>
			<tr>
				<td class="redb"><i>CON:</i></td>
				<td class="redb">
					<%
					int con = getValue();
					out.print(con);
					%>
				</td>
				<td class="redb">
					<%
					int con2 = modCON(race_random);
					out.print(con2);
					%>
				</td>
				<td class="redb">
					<%
					con = con + con2;
					out.print(con);
					%>
				</td>
			</tr>
				<tr>
				<td class="redb"><i>INT:</i></td>
				<td class="redb">
					<%
					int int1 = getValue();
					out.print(int1);
					%>
				</td>
				<td class="redb">
					<%
					int int2 = modINT(race_random);
					out.print(int2);
					%>
				</td>
				<td class="redb">
					<%
					int1 = int1 + int2;
					out.print(int1);
					%>
				</td>
			</tr>
			<tr>
				<td class="redb"><i>SAB:</i></td>
				<td class="redb">
					<%
					int sab = getValue();
					out.print(sab);
					%>
				</td>
				<td class="redb">
					<%
					int sab2 = modSAB(race_random);
					out.print(sab2);
					%>
				</td>
				<td class="redb">
					<%
					sab = sab + sab2;
					out.print(sab);
					%>
				</td>
			</tr>
				<tr class="redb">
				<td class="redb"><i>CAR:</i></td>
				<td class="redb">
					<%
					int car = getValue();
					out.print(car);
					%>
				</td>
				<td class="redb">
					<%
					int car2 = modCAR(race_random);
					out.print(car2);
					%>
				</td>
				<td class="redb">
					<%
					car = car + car2;
					out.print(car);
					%>
				</td>
			</tr>
			<tr>
				<td class="redb"><i>P.V (<%int vida=con * ((int)(1 + (Math.random() * 8)));out.print(vida);%>) </i></td>
				<td class="redb" colspan="3"><table width=<%out.print(vida);%> bgcolor="red">
						<tr>
							<td></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td class="redb">P.M (<%int mana=((int)((int1+sab)/2))* ((int)(1 + (Math.random() * 4)));out.print(mana);%>)</td>
				<td class="redb" colspan="3"><table width=<%out.print(mana);%> bgcolor="blue">
						<tr>
							<td></td>
						</tr>
					</table></td>
			</tr>
		</table>
	<form action="insert_bd.jsp" method="post">
		<br>
		<label for="nombre">Nombre:</label>
		<input type="text" id="nombre" name="nombre"/>
		 <input type="hidden" name="usuario" value="<%out.print(usuario);%>" />
		 <input type="hidden" name="passwd" value="<%out.print(passwd);%>" />
 		<input type="hidden" name="picture" value="<%out.print(race_picture[race_random]);%>" />
 		<input type="hidden" name="race" value="<%out.print(race[race_random]);%>" />
 		<input type="hidden" name="fue" value="<%out.print(fue);%>" />
 		<input type="hidden" name="des" value="<%out.print(des); %>" />
 		<input type="hidden" name="con" value="<%out.print(con); %>" />
 		<input type="hidden" name="int1" value="<%out.print(int1);%>" />
 		<input type="hidden" name="sab" value="<%out.print(sab);%>" />
 		<input type="hidden" name="car" value="<%out.print(car);%>" />
 		<input type="hidden" name="vida" value="<%out.print(vida);%>" />
 		<input type="hidden" name="mana" value="<%out.print(mana);%>" />
 		<br>
 		<br>
 		<input type="submit" name="enviar" value="Guardar Carta" />
	 </form>
	</div>
	
</body>
</html>