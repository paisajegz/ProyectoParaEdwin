$('.actualizar').click(function(){
	var id=$(this).text();
	$.post('../control/producto/buscarProducto.jsp', { id : id },function(data){
		console.log(data);
		$('.id_pan').val(data[0].id_pan);
		$('.precio_pan').val(data[0].precio_pan);
		$('.nombre_pan').val(data[0].nombre_pan);
		$('.des_pan').val(data[0].des_pan);
	},'json');
});