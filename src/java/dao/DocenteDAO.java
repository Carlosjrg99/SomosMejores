/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Docente;

/**
 *
 * @author Carlos Ron
 */
public class DocenteDAO
{
    private static Connection connect;
    private static Statement state;
    private static int sw=0;
    
    public static void conectar()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/somos_mejores","root",null);
            state = connect.createStatement();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

    public static int getSW()
    {
         return sw;
    }
 
    public static String revisionUsuario(String nombre, String apellido) throws SQLException
    {
        ArrayList<Docente> alDocentes = new ArrayList();
        String username="";
        String usernamecito;
        int i=0;
        conectar();    
        ResultSet result = state.executeQuery("SELECT * FROM docente");
        alDocentes = getArreglo(result);
        username = nombre.charAt(0)+apellido;
        username = username.toLowerCase();
        for(Docente docentito : alDocentes)
        {
            usernamecito = username+i;
            if(docentito.getUsername().equals(usernamecito))
                {
                    i++;
                }
        }
        username = username+i;
        return username;
    }
    
    public static boolean revisarRut(String rut) throws SQLException
    {
        Docente doc = new Docente();
        conectar();    
        ResultSet result = state.executeQuery("SELECT * FROM docente WHERE rut='"
                           +rut+"';");
        while(result.next())
        {
            doc.setRut((String)result.getObject(1));
            doc.setNombre((String)result.getObject(2));
            doc.setApellidoPaterno((String)result.getObject(3));
            doc.setApellidoMaterno((String)result.getObject(4));
            doc.setTipoUsuario((int)result.getObject(5));
            doc.setFoto((String)result.getObject(6));
            doc.setUsername((String)result.getObject(7));
            doc.setPassword((String)result.getObject(8));
            doc.setEstado((int)result.getObject(9));
            if(doc.getRut().equals(rut))
            {
                connect.close();
                return false;
            }
        }
        connect.close();
        return true;
     }
    
    public static boolean  agregar(Docente docente) throws SQLException
    {
        boolean estado=false;
        if(!revisarRut(docente.getRut()))
        {
            return estado;
        }
        conectar();
        state.executeUpdate("INSERT INTO docente VALUES('"+docente.getRut()+
                "','"+docente.getNombre()+"','"+docente.getApellidoPaterno()+"','"
                +docente.getApellidoMaterno()+"',"+docente.getTipoUsuario()+
                ",'"+docente.getFoto()+"','"+docente.getUsername()+"','"
                +docente.getPassword()+"',"+docente.getEstado()+");");
        connect.close();
        estado = true;
        return estado;
    }
    
    public static Docente buscar(String rut) throws SQLException
    {
        Docente doc = new Docente();
        conectar();    
        ResultSet result = state.executeQuery("SELECT * FROM docente WHERE rut='"+rut+"';");
        while(result.next())
        {
            doc.setRut((String)result.getObject(1));
            doc.setNombre((String)result.getObject(2));
            doc.setApellidoPaterno((String)result.getObject(3));
            doc.setApellidoMaterno((String)result.getObject(4));
            doc.setTipoUsuario((int)result.getObject(5));
            doc.setFoto((String)result.getObject(6));
            doc.setUsername((String)result.getObject(7));
            doc.setPassword((String)result.getObject(8));
            doc.setEstado((int)result.getObject(9));
        }
        connect.close();
        return doc;
    }
    
    public static boolean  eliminar(String rut) throws SQLException
    {
        boolean estado=false;
        conectar();
        state.executeUpdate("DELETE FROM docente WHERE rut='"+rut+"';");
        connect.close();
        estado = true;
        return estado;         
    }    
    
    public static boolean  modificar(Docente docente) throws SQLException
    {
        boolean estado=false;
        conectar();
        if(!docente.getNombre().isEmpty())
        {
            state.executeUpdate("UPDATE docente SET nombre='"
                    +docente.getNombre()+"' WHERE rut='"+docente.getRut()+"';");
            estado = true;
        }
        if(!docente.getApellidoPaterno().isEmpty())
        {
            state.executeUpdate("UPDATE docente SET apellidoPaterno='"
                    +docente.getApellidoPaterno()+"' WHERE rut='"+docente.getRut()+"';");
            estado = true;
        }
        if(!docente.getApellidoMaterno().isEmpty())
        {
            state.executeUpdate("UPDATE docente SET apellidoMaterno='"
                    +docente.getApellidoMaterno()+"' WHERE rut='"+docente.getRut()+"';");
            estado = true;
        }
        if(!docente.getPassword().isEmpty())
        {
            state.executeUpdate("UPDATE docente SET password='"
                    +docente.getPassword()+"' WHERE rut='"+docente.getRut()+"';");
            estado = true;
        }
        connect.close();
        return estado;         
    }  
    
    
    public static ArrayList<Docente> getArreglo(ResultSet result) throws SQLException
    {
        ArrayList<Docente> arreglo = new ArrayList();
        while(result.next())
        {
            Docente doc = new Docente();
            doc.setRut((String)result.getObject(1));
            doc.setNombre((String)result.getObject(2));
            doc.setApellidoPaterno((String)result.getObject(3));
            doc.setApellidoMaterno((String)result.getObject(4));
            doc.setTipoUsuario((int)result.getObject(5));
            doc.setFoto((String)result.getObject(6));
            doc.setUsername((String)result.getObject(7));
            doc.setPassword((String)result.getObject(8));
            doc.setEstado((int)result.getObject(9));
            arreglo.add(doc);
        }
        return arreglo;
    }
    
    public static ArrayList<Docente> obtenerDatos() throws SQLException
    {
        ArrayList<Docente> alDocentes = new ArrayList();
        conectar();    
        ResultSet result = state.executeQuery("SELECT * FROM docente;");
        alDocentes = getArreglo(result);
        connect.close();
        return alDocentes;
    }
    
    
    public static Docente login(String user,String pass) throws SQLException
    {
        Docente doc = new Docente();
        conectar();    
        ResultSet result = state.executeQuery("SELECT * FROM docente WHERE username='"
                           +user+"' AND password='"+pass+"';");
        while(result.next())
        {
            doc.setRut((String)result.getObject(1));
            doc.setNombre((String)result.getObject(2));
            doc.setApellidoPaterno((String)result.getObject(3));
            doc.setApellidoMaterno((String)result.getObject(4));
            doc.setTipoUsuario((int)result.getObject(5));
            doc.setFoto((String)result.getObject(6));
            doc.setUsername((String)result.getObject(7));
            doc.setPassword((String)result.getObject(8));
            doc.setEstado((int)result.getObject(9));
        }
        connect.close();
        return doc;
     }
}