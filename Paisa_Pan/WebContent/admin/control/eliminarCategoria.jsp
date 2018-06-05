<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<%

Connection con  = Conexion.obtenerConexion();
String sql="DELETE FROM public.categoria WHERE id_categoria= ?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, Integer.parseInt(request.getParameter("id")));
ps.executeUpdate();
%>
<script type="text/javascript">
alert("eliminacion exitoso");
window.location.href="../acciones/categorias.jsp";
</script>