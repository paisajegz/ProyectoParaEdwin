package com.panaderia.modelo;

public class Venta {

	private String id;
	private String dirrecion;
	private String cantidad;
	private int idPan;
	private int idUser;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDirrecion() {
		return dirrecion;
	}
	public void setDirrecion(String dirrecion) {
		this.dirrecion = dirrecion;
	}
	public String getCantidad() {
		return cantidad;
	}
	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}
	public int getIdPan() {
		return idPan;
	}
	public void setIdPan(int idPan) {
		this.idPan = idPan;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	
	
}
