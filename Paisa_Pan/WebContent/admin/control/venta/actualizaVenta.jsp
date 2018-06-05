<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<%

Connection con  = Conexion.obtenerConexion();
String sql="UPDATE public.domicilios SET estado=? WHERE id_domicilios= ?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,"X");
ps.setString(2, request.getParameter("id"));
ps.executeUpdate();
%>
<script type="text/javascript">
alert("eliminacion exitoso");
window.location.href="../../acciones/venta.jsp";
</script>