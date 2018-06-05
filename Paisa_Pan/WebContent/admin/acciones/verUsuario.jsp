<!DOCTYPE html>
<html lang="en">
<%@ page import="com.panaderia.modelo.Usuario" %>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="../../librerias/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../librerias/css/shop-homepage.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Candy Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Inicio
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="domicilio.html">Domicilio</a>
            </li>
            <% 
            	Usuario user = (Usuario) session.getAttribute("usuario");
    		if(user==null){
            %>
            <li class="nav-item">
              <a class="nav-link" href="user.html">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="register.html">Register</a>
            </li>
            <%
    		}else{
    			%>
    		<li class="nav-item">
              <a class="nav-link" href="#">Cerrar Sesion</a>
            </li>
    			<% 
    		}
            %>
          </ul>
        </div>
      </div>
    </nav>
	    <div><table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">nombre</th>
      <th scope="col">Correo</th>
      <th scope="col">Celular</th>
      <th scope="col">eliminar</th>
    </tr>
  </thead>
  <tbody>
  	<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
  <%

Connection con  = Conexion.obtenerConexion();
String sqle="SELECT id_usuario, nombre_usuario, correo, celular  FROM public.usuario;";
PreparedStatement pse = con.prepareStatement(sqle);
ResultSet rest = pse.executeQuery();
while(rest.next()){
	out.println("<tr>"+
		      "<td scope='row'>"+ rest.getInt("id_usuario")+"</td>"+
		      "<td>"+rest.getString("nombre_usuario")+"</td>"+
		      "<td>"+rest.getString("correo")+"</td>"+
		      "<td>"+rest.getString("celular")+"</td>"+
		      "<td><a href='../control/usuario/eliminarUsuario.jsp?id="+rest.getString("id_usuario")+"'>"+rest.getString("id_usuario")+"</a></td>"+
		    "</tr>");
}

%>    
  
  </tbody>
</table>	
</div>	
		
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../../librerias/vendor/jquery/jquery.min.js"></script>
    <script src="../../librerias/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
