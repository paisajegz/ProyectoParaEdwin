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
    <div><table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Direccion</th>
      <th scope="col">Cantidad Producto</th>
      <th scope="col">Pan</th>
      <th scope="col">Usuario</th>
      <th scope="col">Estado</th>
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
String sql="SELECT id_domicilios, dirrecion_domicilio, cantidad_producto, (SELECT nombre_pan FROM public.pan WHERE id_pan=pan_id_pan) AS pan,(SELECT nombre_usuario FROM public.usuario WHERE id_usuario=usuario_id_usuario) as usuario , estado FROM public.domicilios;";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet res = ps.executeQuery();
while(res.next()){
	out.println( "<tr>"+
    "<td >"+res.getString("id_domicilios")+"</td>"+
    "<td>"+res.getString("dirrecion_domicilio")+"</td>"+
    "<td>"+res.getString("cantidad_producto")+"</td>"+
    "<td>"+res.getString("pan")+"</td>"+
    "<td>"+res.getString("usuario")+"</td>"+
    "<td>"+res.getString("estado")+"</td>"+
    "<td><a href='../control/venta/actualizaVenta.jsp?id="+res.getString("id_domicilios")+"'>actuailizar</a></td>"+
    "<td><a href='../control/venta/eliminaVenta.jsp?id="+res.getString("id_domicilios")+"'>eliminar</a></td>"+
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
