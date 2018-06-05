
<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<%@ page import="org.json.*" %>
<%@ page import="com.panaderia.ConverResultSet" %>
<%


String id = request.getParameter("id");

Connection con  = Conexion.obtenerConexion();
String sql="SELECT id_pan, nombre_pan, precio_pan, foto_pan, des_pan  FROM public.pan WHERE id_pan=?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, Integer.parseInt(id));
ResultSet res = ps.executeQuery();
JSONArray json = ConverResultSet.convert(res);
out.println(json.toString());
%>