<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.panaderia.modelo.Administrador" %>
<%@ page import="java.sql.ResultSet"  %>
<%

Connection con  = Conexion.obtenerConexion();
String sql="SELECT  id_admin, nombre_admin , correo_admin , cedula_admim FROM public.admin WHERE correo_admin= ? AND  clave_admin= ?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, request.getParameter("correo"));
ps.setString(2, request.getParameter("clave"));
ResultSet res = ps.executeQuery();
if(res.next()){
	Administrador administrador = new Administrador();
	administrador.setId(res.getInt("id_admin"));
	administrador.setNombre(res.getString("nombre_admin"));
	administrador.setCorreo(res.getString("correo_admin"));
	administrador.setCelular(res.getString("cedula_admim"));
	session.setAttribute("administrador", administrador);
	%>
	<script>alert("bienvenido");
	window.location.href="../manejo.html";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("usuario no logeado");
	</script>
	<%
}

%>