<%@ page import="com.panaderia.Conexion" %>
<%@ page import="com.panaderia.modelo.Categoria"  %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<%

Connection con  = Conexion.obtenerConexion();
Categoria categoria = new Categoria();
categoria.setNombreCategoria(request.getParameter("nombreCat"));
categoria.setDesCategoria(request.getParameter("desCat"));
categoria.setId(Integer.parseInt(request.getParameter("idCat")));
String sql="UPDATE public.categoria SET nombre_categoria=?, des_categoria=? WHERE id_categoria= ?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,categoria.getNombreCategoria());
ps.setString(2, categoria.getDesCategoria());
ps.setInt(3,categoria.getId());
ps.executeUpdate();
%>
<script type="text/javascript">
alert("categoria actualizada");
window.location.href="../acciones/categorias.jsp";
</script>