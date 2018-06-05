<%@ page import="com.panaderia.modelo.Administrador" %>
<%

Administrador admin = (Administrador) session.getAttribute("administrador");

if(admin == null){
	out.println("esto se puteo");
}

%>


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
	<center>
	<div style="width:500px;">
		<h1>EDITAR DATOS ADMINISTRADOR</h1>
		<form action="../control/admin/actualizarAdmin.jsp" method="POST">
		<input type="hidden" name="id" value="<%  out.print(admin.getId());%>">
  <div class="form-group">
    <label for="nombre">Digite Nombre:</label>
    <input type="text" class="form-control" placeholder="Digite nombre" id="nombre" name="nombre" required value="<% out.print(admin.getNombre()); %>">
  </div>
  <div class="form-group">
    <label for="correo">Digite Correo:</label>
    <input type="text" class="form-control" placeholder="Digite Correo" id="correo"  name="correo" required value="<% out.print(admin.getCorreo()); %>">
  </div>
    <div class="form-group">
    <label for="celular">Digite Celular:</label>
    <input type="tel" class="form-control" placeholder="Digite celular" id="celular" name="celular" required value="<% out.print(admin.getCelular()); %>">
  </div>
  <button type="submit" class="btn btn-primary">Actualizar</button>
</form> 
</div>
	</center>	
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../librerias/vendor/jquery/jquery.min.js"></script>
    <script src="../librerias/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
