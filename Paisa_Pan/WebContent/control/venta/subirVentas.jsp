<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.panaderia.modelo.Venta" %>
<%@ page import="com.panaderia.modelo.Usuario" %>
<%@ page import="java.sql.ResultSet"  %>
<%@ page import="java.util.Date" %>
<%

Connection con  = Conexion.obtenerConexion();
String sql="INSERT INTO public.domicilios(id_domicilios, dirrecion_domicilio, cantidad_producto, pan_id_pan,usuario_id_usuario, estado)    VALUES (?, ?, ?, ?,?, ?);";
Venta venta= new Venta();
Usuario user=(Usuario)session.getAttribute("usuario");
venta.setCantidad(request.getParameter("cantidad"));
venta.setDirrecion(request.getParameter("dirrecion"));
venta.setIdPan(Integer.parseInt(request.getParameter("id-pan")));
venta.setIdUser(user.getId());
Date date = new Date();
String id= date.getYear()+""+ date.getMonth() + date.getDate() + date.getHours()+date.getMinutes()+date.getSeconds() + user.getId() + venta.getIdPan();
venta.setId(id);
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, venta.getId());
ps.setString(2,venta.getDirrecion());
ps.setString(3, venta.getCantidad());
ps.setInt(4,venta.getIdPan());
ps.setInt(5,venta.getIdUser());
ps.setString(6,"V");
ps.executeUpdate();
%>
<script type="text/javascript">
alert("registro exitoso");
window.location.href="../user.html";
</script>