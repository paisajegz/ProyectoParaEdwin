<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="librerias/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="librerias/css/shop-homepage.css" rel="stylesheet">

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
            <li class="nav-item">
              <a class="nav-link" href="index.html">Inicio
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="#">Domicilio</a>
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

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">Shop Name</h1>
          <div class="list-group">
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
	out.println("<a href='#' class='list-group-item item-categoria'>" + res.getString("nombre_categoria") + "</a>");
}

%>
          </div>

        </div>
        <!-- /.col-lg-3 -->
		<div class="col-lg-9">
		<div class="row my-3 cont-producto">
			

         </div>
         </div>
          
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
   ->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="librerias/vendor/jquery/jquery.min.js"></script>
    <script src="librerias/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="librerias/js/query-domicilio.js"></script>
  </body>

</html>
