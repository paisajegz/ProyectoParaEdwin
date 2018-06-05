
<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<%@ page import="org.json.*" %>
<%@ page import="com.panaderia.ConverResultSet" %>
<%


String nombre = request.getParameter("nombreProducto");

Connection con  = Conexion.obtenerConexion();
String sql="SELECT * FROM public.categoria , public.pan WHERE id_categoria=categoria_id_categoria AND nombre_categoria= ?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,nombre);
ResultSet res = ps.executeQuery();
JSONArray json = ConverResultSet.convert(res);
out.println(json.toString());
%>