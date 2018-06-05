

$('.actualizar').click(function(){
	
	var id=$(this).text();
	$.post('../control/buscarCatego.jsp',{ id : id},function(data){
		$('.nombreCat').val(data[0].nombre_categoria);
		$('.desCat').val(data[0].des_categoria);
		$('.idCat').val(data[0].id_categoria);
	},'json');
});