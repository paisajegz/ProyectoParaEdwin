$('.item-categoria').click(function(){
	var nombreProducto = $(this).text();
	$.post('control/producto/mostrarProductos.jsp',{nombreProducto : nombreProducto},function(data){
		$('.cont-producto').text('');
		for(var i=0 ; i < data.length; i++){
			$('.cont-producto').append("<div class='col-lg-4 col-md-6 mb-4'>"+
              "<div class='card h-100'>"+
                "<a href='#'><img class='card-img-top' src='img/pan/"+data[0].foto_pan+"' alt=''></a>" + 
                "<div class='card-body'>"+
                  "<h4 class='card-title'>"+
                    "<a href='#'>"+data[i].nombre_pan+"</a>"+
                  "</h4>"+
                  "<h5>"+data[i].precio_pan+" C.O.P </h5>"+
                  "<p class='card-text'>"+data[0].des_pan+"</p>"+
                "</div>"+
                "<div class='card-footer'>"+
                	"<center>"+
                	"<a href='compra/compraProducto.jsp?id="+data[0].id_pan+"'>Comprar producto</a>"+
                	"</center>"+  
                "</div>"+
              "</div>"+
            "</div>");
		}
	},'json');
});