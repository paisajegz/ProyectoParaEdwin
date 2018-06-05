<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="com.panaderia.modelo.Producto" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.List" %>
<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<% 

String url="C:\\Users\\USUARIO\\Videos\\work\\Paisa_Pan\\WebContent\\img\\pan";




DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(1024);
factory.setRepository(new File(url));

ServletFileUpload upload = new ServletFileUpload(factory);
try{
	List<FileItem> partes = upload.parseRequest(request);
	Producto producto = new Producto();
	for(FileItem item : partes){
		if(item.isFormField()){
			if(item.getFieldName().equals("nombrePan")){
				producto.setNombreProducto(item.getString());
				producto.setFotoProducto(producto.getNombreProducto()+".png");
			}else if(item.getFieldName().equals("precioPan")){
				producto.setPrecioProducto(item.getString());
			}else if(item.getFieldName().equals("desPan")){
				producto.setDesProducto(item.getString());
			}else if(item.getFieldName().equals("desCat")){
				producto.setDesCategoria(item.getString());
			}
		}
	}
	for(FileItem item : partes){
		if(!item.isFormField()){
			File file = new File(url,producto.getFotoProducto());
			item.write(file);
		}
	}
		Connection con  = Conexion.obtenerConexion();
		String sql="INSERT INTO public.pan( nombre_pan, precio_pan, foto_pan, des_pan, categoria_id_categoria) VALUES ( ?, ?, ?, ?, ?);";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,producto.getNombreProducto());
		ps.setString(2,producto.getPrecioProducto());
		ps.setString(3,producto.getFotoProducto());
		ps.setString(4,producto.getDesProducto());
		ps.setInt(5,Integer.parseInt(producto.getDesCategoria()));
		ps.executeUpdate();
		%>
		<script type="text/javascript">
		
		alert("producto registrado exitosamente");
		window.location.href="../../acciones/producto.jsp";
		</script>
		<%

	
}catch(Exception e){
	out.println(e.toString());
}




%>