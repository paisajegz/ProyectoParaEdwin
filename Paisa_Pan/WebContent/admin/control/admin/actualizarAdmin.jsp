<%@ page import="com.panaderia.Conexion" %>
<%@ page import="com.panaderia.modelo.Administrador"  %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<%

Connection con  = Conexion.obtenerConexion();
Administrador admin  = new Administrador();
admin.setCelular(request.getParameter("celular"));
admin.setCorreo(request.getParameter("correo"));
admin.setNombre(request.getParameter("nombre"));
admin.setId(Integer.parseInt(request.getParameter("id")));
String sql="UPDATE public.admin SET  nombre_admin=?, correo_admin=?, cedula_admim=? WHERE id_admin= ?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,admin.getNombre());
ps.setString(2,admin.getCorreo());
ps.setString(3, admin.getCelular());
ps.setInt(4, admin.getId());
ps.executeUpdate();
session.setAttribute("administrador", admin);
%>
<script type="text/javascript">
alert("producto actualizada");
window.location.href="../../manejo.html";
</script>