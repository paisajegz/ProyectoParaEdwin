<!DOCTYPE html>
<html lang="en">

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
     <form action="../control/producto/subirProducto.jsp" method="POST" enctype="multipart/form-data">
  <div class="form-group">
    <label for="nombrePan">Nombre del pan:</label>
    <input type="text" class="form-control" id="nombrePan" name="nombrePan" required>
  </div>
  <div class="form-group">
    <label for="precioPan">Precio del pan:</label>
    <input type="number" class="form-control" id="precioPan" name="precioPan" required>
  </div>
  <div class="form-group">
    <label for="desPan">Descripcion del pan:</label>
    <input type="text" class="form-control" id="desPan" name="desPan" required>
  </div>
  <div class="form-group">
    <label for="desCat">Categoria del pan:</label>
	<select class="form-control" id="desCat" name="desCat" required>
	<option>elige categoria</option>
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
	out.println("<option value='"+res.getString("id_categoria")+"'>"+res.getString("nombre_categoria")+"</option>");
	
}

%>
	
	</select>
  </div>
   <div class="form-group">
    <label for="fotoPan">Foto del pan:</label>
    <input type="file" class="form-control" id="fotoPan" name="fotoPan" required>
  </div>
  <button type="submit" class="btn btn-primary">Insertar</button>
</form> 
    <div><table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">nombre producto</th>
      <th scope="col">foto</th>
      <th scope="col">descripcion</th>
      <th scope="col">categoria</th>
      <th scope="col">actuailizar</th>
      <th scope="col">eliminar</th>
    </tr>
  </thead>
  <tbody>
<%

Connection cone  = Conexion.obtenerConexion();
String sqle="SELECT id_pan, nombre_pan, precio_pan, foto_pan, des_pan ,(SELECT nombre_categoria FROM categoria WHERE id_categoria= categoria_id_categoria) AS categoria FROM public.pan;";
PreparedStatement pse = con.prepareStatement(sqle);
ResultSet rest = pse.executeQuery();
while(rest.next()){
	out.println("<tr>"+
		      "<td scope='row'>"+ rest.getInt("id_pan")+"</td>"+
		      "<td>"+rest.getString("nombre_pan")+"</td>"+
		      "<td><img src='../../img/pan/"+rest.getString("foto_pan")+"' class='foto' /></td>"+
		      "<td>"+rest.getString("des_pan")+"</td>"+
		      "<td>"+rest.getString("categoria")+"</td>"+
		      "<td><a href='#' data-toggle='modal' data-target='#login-actualizar' class='actualizar'>"+rest.getString("id_pan")+"</a></td>"+
		      "<td><a href='../control/producto/eliminarProducto.jsp?id="+rest.getString("id_pan")+"'>"+rest.getString("id_pan")+"</a></td>"+
		    "</tr>");
}

%>    
  </tbody>
</table>	
</div>	
<a href="#" data-toggle="modal" data-target="#login-modal">Login</a>

<div class="modal fade" id="login-insertar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Login to Your Account</h1><br>
				  <form>
					<input type="text" name="user" placeholder="Username">
					<input type="password" name="pass" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				  </form>
					
				  <div class="login-help">
					<a href="#">Register</a> - <a href="#">Forgot Password</a>
				  </div>
				</div>
			</div>
		  </div>

<div class="modal fade" id="login-actualizar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Login to Your Account</h1><br>
				  <form method="POST" action="../control/producto/actualizarProducto.jsp">
				  	<input type="hidden" name="id_pan"  class="id_pan">
					<input type="text" name="nombre_pan" class="nombre_pan" placeholder="Digite Nombre" required>
					<input type="text" name="precio_pan" class="precio_pan" placeholder="Digite precio del pan" required>
					<input type="text" name="des_pan" class="des_pan" placeholder="Digite la descripcion del pan" required>
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
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
	<script src="../../librerias/js/query-producto.js"></script>
  </body>

</html>
