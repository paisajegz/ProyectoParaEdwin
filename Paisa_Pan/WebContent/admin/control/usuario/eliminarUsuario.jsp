<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<%

Connection con  = Conexion.obtenerConexion();
String sql="DELETE FROM public.usuario WHERE id_usuario= ? ;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, Integer.parseInt(request.getParameter("id")));
ps.executeUpdate();
%>
<script type="text/javascript">
alert("eliminacion exitoso");
window.location.href="../../acciones/verUsuario.jsp";
</script>