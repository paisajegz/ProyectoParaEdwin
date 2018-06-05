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

          <div style="margin:auto;" id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
              </div>
              <div class="carousel-item">
                <img style='width:100%; heigth:100vh;' class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img style='width:100%; heigth:100vh;' class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
			<div class="row my-3">
			<div class="col-lg-4 col-md-12">
			<h1 class="text-center">BIENVENIDO</h1>
			<center>
			<img width="150"   src="http://placehold.it/700x400"/>
			</center>
			</div>
			<div class="col-lg-4 col-md-12">
			<h1 class=" text-center">BIENVENIDO</h1>
			<center>
			<img width="150"   src="http://placehold.it/700x400"/>
			</center>
			</div>
			<div class="col-lg-4 col-md-12">
			<h1 class=" text-center">BIENVENIDO</h1>
			<center>
			<img width="150"   src="http://placehold.it/700x400"/>
			</center>
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
    <script src="librerias/vendor/jquery/jquery.min.js"></script>
    <script src="librerias/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
