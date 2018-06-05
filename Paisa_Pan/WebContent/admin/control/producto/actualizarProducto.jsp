<%@ page import="com.panaderia.Conexion" %>
<%@ page import="com.panaderia.modelo.Producto"  %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<%

Connection con  = Conexion.obtenerConexion();
Producto producto = new Producto();
producto.setNombreProducto(request.getParameter("nombre_pan"));
producto.setDesProducto(request.getParameter("des_pan"));
producto.setPrecioProducto(request.getParameter("precio_pan"));
producto.setId(Integer.parseInt(request.getParameter("id_pan")));
String sql="UPDATE public.pan SET nombre_pan=?, precio_pan=?, des_pan=? WHERE id_pan=?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, producto.getNombreProducto());
ps.setString(2,producto.getPrecioProducto());
ps.setString(3, producto.getDesProducto());
ps.setInt(4, producto.getId());
ps.executeUpdate();
%>
<script type="text/javascript">
alert("producto actualizada");
window.location.href="../../acciones/producto.jsp";
</script>