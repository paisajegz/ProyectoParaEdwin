<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.panaderia.modelo.Usuario" %>
<%@ page import="java.sql.ResultSet"  %>
<%

Connection con  = Conexion.obtenerConexion();
Usuario user= new Usuario();
user.setCorreo(request.getParameter("correo"));
user.setClave(request.getParameter("clave"));
String sql="SELECT id_usuario, nombre_usuario, clave, correo, celular  FROM public.usuario WHERE correo= ? AND clave= ?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, user.getCorreo());
ps.setString(2, user.getClave());
ResultSet res = ps.executeQuery();
if(res.next()){
	Usuario usuarioLogeado = new Usuario();
	usuarioLogeado.setNombreUsuario(res.getString("nombre_usuario"));
	usuarioLogeado.setId(res.getInt("id_usuario"));
	usuarioLogeado.setCelular(res.getString("celular"));
	usuarioLogeado.setCorreo(res.getString("correo"));
	usuarioLogeado.setClave("clave");
	session.setAttribute("usuario", usuarioLogeado);
	%>
	<script>alert("bienvenido");
	window.location.href="../index.jsp";
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