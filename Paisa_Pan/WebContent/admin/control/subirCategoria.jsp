<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="com.panaderia.modelo.Categoria" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.List" %>
<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<% 

String url="C:\\Users\\USUARIO\\Videos\\work\\Paisa_Pan\\WebContent\\img\\categoria";




DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(1024);
factory.setRepository(new File(url));

ServletFileUpload upload = new ServletFileUpload(factory);
try{
	List<FileItem> partes = upload.parseRequest(request);
	Categoria categoria = new Categoria();
	for(FileItem item : partes){
		if(item.isFormField()){
			if(item.getFieldName().equals("nombre")){
				categoria.setNombreCategoria(item.getString());
			}else if(item.getFieldName().equals("desCate")){
				out.println("des hecha");
				categoria.setDesCategoria(item.getString());
			}
		}
	}
	for(FileItem item : partes){
		if(!item.isFormField()){
			File file = new File(url,categoria.getNombreCategoria()+".png");
			item.write(file);
		}
	}

		Connection con  = Conexion.obtenerConexion();
		String sql="INSERT INTO public.categoria( nombre_categoria, foto_categoria, des_categoria) VALUES (?, ?, ?);";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,categoria.getNombreCategoria() );
		ps.setString(2,categoria.getNombreCategoria() + ".png");
		ps.setString(3, categoria.getDesCategoria() );
		ps.executeUpdate();
		%>
		<script type="text/javascript">
		
		alert("categoria registrada exitosamente");
		window.location.href="../acciones/categorias.jsp";
		</script>
		<%
	
}catch(Exception e){
	out.println(e.toString());
}




%>