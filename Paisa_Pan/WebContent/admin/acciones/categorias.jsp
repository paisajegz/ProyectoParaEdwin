<!DOCTYPE html>
<html lang="es">

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
	<link href="../../css/modal.css" rel="stylesheet">
	<style type="text/css">
	.foto{
	width: 50px;
	height: 50px
	}
	</style>
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
            <li class="nav-item">
              <a class="nav-link" href="user.html">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="register.html">Register</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
     <form action="../control/subirCategoria.jsp" method="POST" enctype="multipart/form-data">
     <h1 class="text-center">INSERTAR DATOS</h1>
  <div class="form-group">
    <label for="nomCate">Nombre categoia:</label>
    <input type="text" class="form-control" id="nomCate" name="nombre" required>
  </div>
  <div class="form-group">
    <label for="desCate">Descripcion categoria:</label>
    <input type="text" class="form-control" id="desCate"  name="desCate" required>
  </div>
    <div class="form-group">
    <label for="fotoCate">Foto categoria:</label>
    <input type="file" class="form-control" id="fotoCate" name="fotoCate" required>
  </div>
  <button type="submit" class="btn btn-primary">Insertar</button>
</form> 
    <div><table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">nombre categoria</th>
      <th scope="col">foto</th>
      <th scope="col">descripcion</th>
      <th scope="col">actuailizar</th>
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
String sql="SELECT id_categoria, nombre_categoria, foto_categoria, des_categoria  FROM public.categoria;";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet res = ps.executeQuery();
while(res.next()){
	out.println("<tr>"+
		      "<th scope='row'>"+res.getString("id_categoria")+"</th>"+
		      "<td>"+res.getString("nombre_categoria")+"</td>"+
		      "<td><img src='../../img/categoria/"+res.getString("foto_categoria")+"' class='foto'/></td>"+
		      "<td>"+res.getString("des_categoria")+"</td>"+
		      "<td><a href='#' data-toggle='modal' data-target='#login-actualizar' class='actualizar'>"+res.getString("id_categoria")+"</a></td>"+
		      "<td><a href='../control/eliminarCategoria.jsp?id="+res.getString("id_categoria")+"'  class='eliminar'>"+res.getString("id_categoria")+"</a></td>"+
		    "</tr>");
}

%>
  </tbody>
</table>	
</div>	


<div class="modal fade" id="login-actualizar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Actualizar datos Importantes</h1><br>
				  <form method="POST" action="../control/actualizarCategoriajsp.jsp">
				  	<input type="hidden" name="idCat" class="idCat">
					<input type="text" name="nombreCat" class="nombreCat" placeholder="nombre Categoria">
					<input type="text" name="desCat" class="desCat" placeholder="descripcion Categoria">
					<input type="submit" name="actualizar" class="login loginmodal-submit" value="Actualizar">
				  </form>
				</div>
			</div>
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
	<script src="../../librerias/js/query-categoria.js"></script>
  </body>

</html>