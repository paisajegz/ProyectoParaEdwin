package com.panaderia;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

	public static Connection obtenerConexion(){
		Connection conexion =null;
		try{
			String driver = "org.postgresql.Driver";
			String url = "jdbc:postgresql://localhost:5432/Paisa_Pan";
			String usuario = "postgres";
			String clave = "nacional12";
			
			Class.forName(driver);
			conexion = DriverManager.getConnection(url,usuario,clave);
			System.out.println("conexion: Ok");
		}
		catch(Exception e){
			System.out.println("Error:"+ e.toString());
		}
		return conexion;
	}
}
