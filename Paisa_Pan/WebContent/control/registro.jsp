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
user.setNombreUsuario(request.getParameter("nombre"));
user.setCelular(request.getParameter("celular"));
String sql="INSERT INTO public.usuario(nombre_usuario, clave, correo, celular)  VALUES (?, ?, ?, ?);";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, user.getNombreUsuario());
ps.setString(2, user.getClave());
ps.setString(3, user.getCorreo());
ps.setString(4, user.getCelular());
ps.executeUpdate();
%>
<script type="text/javascript">
alert("registro exitoso");
window.location.href="../user.html";
</script>