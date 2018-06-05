package com.panaderia.modelo;

public class Producto {

	private int id;
	private String nombreProducto;
	private String precioProducto;
	private String fotoProducto;
	private String desProducto;
	private String desCategoria;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombreProducto() {
		return nombreProducto;
	}
	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	public String getPrecioProducto() {
		return precioProducto;
	}
	public void setPrecioProducto(String precioProducto) {
		this.precioProducto = precioProducto;
	}
	public String getFotoProducto() {
		return fotoProducto;
	}
	public void setFotoProducto(String fotoProducto) {
		this.fotoProducto = fotoProducto;
	}
	public String getDesProducto() {
		return desProducto;
	}
	public void setDesProducto(String desProducto) {
		this.desProducto = desProducto;
	}
	public String getDesCategoria() {
		return desCategoria;
	}
	public void setDesCategoria(String desCategoria) {
		this.desCategoria = desCategoria;
	}
}
