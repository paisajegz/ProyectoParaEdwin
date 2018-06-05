<!DOCTYPE html>
<html lang="en">
<%@ page import="com.panaderia.modelo.Producto" %>
<%@ page import="com.panaderia.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"  %>
<%


String id = request.getParameter("id");

Producto producto = new Producto();
Connection con  = Conexion.obtenerConexion();
String sql="SELECT id_pan, nombre_pan, precio_pan  FROM public.pan WHERE id_pan=?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, Integer.parseInt(id));
ResultSet res = ps.executeQuery();
if(res.next()){
	producto.setNombreProducto(res.getString("nombre_pan"));
	producto.setId(res.getInt("id_pan"));
	producto.setPrecioProducto(res.getString("precio_pan"));
}
%>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="../librerias/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../librerias/css/shop-homepage.css" rel="stylesheet">

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
	<div style="width:500px;">
		<h1>EDITAR DATOS ADMINISTRADOR</h1>
		<form action="../control/venta/subirVentas.jsp" method="POST">
		<input type="hidden" name="id-pan" value="<% out.print(producto.getId());%>">
		<input type="hidden" name="precio-pan" class="precio-pan" value="<% out.print(producto.getPrecioProducto());%>">
  <div class="form-group">
    <label for="nombre">nombre del producto: <% out.print(producto.getNombreProducto()); %></label> 
    <input type="hidden" class="form-control"  name="nombre" id="nombre" value="<%out.print(producto.getNombreProducto());%>">
  </div>
  <div class="form-group">
    <label for="cantidad" class="cantidad">cantidad del producto: 1</label>
    <input type="hidden" class="form-control cantidad-pan"  name="cantidad" id="cantidad" value="1">
  	<div class="row">
  	<div class="col-lg-6">
  	<center>
  	<a class=" btn btn-primary btn-mas">MAS</a>
  	</center>
  	</div>
  	<div class="col-lg-6">
  	<center>
  	<a class="btn btn-primary btn-menos">MENOS</a>
  	</center>
  	</div>
  	</div>
  </div>
    <div class="form-group">
    <label for="dirrecion">Digite Dirrecion</label>
    <input type="text" class="form-control" placeholder="Digite dirrecion" id="dirrecion" name="dirrecion" required>
  </div>
  <div class="form-group">
    <label class="precio-total">Precio Total: <% out.println(producto.getPrecioProducto()); %></label>
    <input type="hidden" name="precio-total" class="precio-final" value="<% out.print(producto.getPrecioProducto());%>">
  </div>
  <button type="submit" class="btn btn-primary">Enviar</button>
</form> 
</div>	
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
	<script>
		$('.btn-mas').click(function(){
			var precioProducto= parseInt($('.precio-pan').val());
			var cantidad = parseInt($('.cantidad-pan').val());
			cantidad++;
			$('.cantidad').text("cantidad produdcto: " + cantidad);
			$('.cantidad-pan').val(cantidad);
			$('.precio-total').text("Precio Total: " +  (cantidad*precioProducto) );
			$('.precio-final').val((cantidad*precioProducto));
		});
		
		$('.btn-menos').click(function(){
			var precioProducto= parseInt($('.precio-pan').val());
			var cantidad = parseInt($('.cantidad-pan').val());
			if(cantidad > 1){
			cantidad--;
			$('.cantidad').text("cantidad produdcto: " + cantidad);
			$('.cantidad-pan').val(cantidad);
			$('.precio-total').text("Precio Total: " +  (cantidad*precioProducto) );
			$('.precio-final').val((cantidad*precioProducto));
			}
		});
	</script>
  </body>

</html>
