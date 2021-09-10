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
import modelo.Asistencia;

/**
 *
 * @author Carlo
 */
public class AsistenciaDAO 
{
    private static Connection connect;
    private static Statement state;
    
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

    public static boolean agregar(Asistencia asistencia) throws SQLException
    {
        boolean estado=false;
             conectar();
             state.executeUpdate("INSERT INTO asistencia VALUES('"+asistencia.getId()+
                     "','"+asistencia.getRut()+"','"+asistencia.getNombre()+"','"+asistencia.getApellidoPaterno()+"','"
                     +asistencia.getApellidoMaterno()+"','"+asistencia.getFecha()+
                     "','"+asistencia.getHora()+"','"+asistencia.getHoraSalida()+"',"
                     +asistencia.getActiva()+");");
             connect.close();
             estado = true;
        return estado;
    }
    
    /*public static String generarID(String rut) throws SQLException 
    {
        ArrayList<Asistencia> alAsistencias = new ArrayList();
        String username="";
        String usernamecito;
        String id="AS-", idcito=id+"0";
        int i=1;
        conectar();    
        ResultSet result = state.executeQuery("SELECT * FROM asistencia");
        alAsistencias = getArreglo(result);
        for(Asistencia asistencia:alAsistencias)
        {
            if(idcito.equals(asistencia.getId()))
            {
                idcito = id + i;
            }
        }
        return idcito;
    }*/
    
    public static Asistencia buscar(String rut) throws SQLException
    {
        Asistencia asis = new Asistencia();
        conectar();    
        ResultSet result = state.executeQuery("SELECT * FROM asistencia WHERE rut='"+rut+"';");
        while(result.next())
        {
            asis.setId((int)result.getObject(1));
            asis.setRut((String)result.getObject(2));
            asis.setNombre((String)result.getObject(3));
            asis.setApellidoPaterno((String)result.getObject(4));
            asis.setApellidoMaterno((String)result.getObject(5));
            asis.setFecha((String)result.getObject(6));
            asis.setHora((String)result.getObject(7));
            asis.setHoraSalida((String)result.getObject(8));
            asis.setActiva((int)result.getObject(9));
        }
        connect.close();
        return asis;    
    }

    public static boolean revisionFecha(String rut, String fecha) throws SQLException
    {
        conectar();    
        ResultSet result = state.executeQuery("SELECT * FROM asistencia WHERE rut='"+rut+"' AND fecha='"+fecha+"';");
        if(result.next())
        {
           connect.close();
           return true;
        }
        else
        {
            connect.close();
            return false;
        }
    }

    
    public static boolean salida(String rut, String fecha, String hora) throws SQLException
    {
        Asistencia asis = new Asistencia();
        conectar();    
        state.executeUpdate("UPDATE asistencia SET horaSalida='"+hora+"' WHERE rut='"+rut+"' AND fecha='"+fecha+"';");
        connect.close();
        return true;
    }
    
    public static ArrayList<Asistencia> getArreglo(ResultSet result) throws SQLException
    {
        ArrayList<Asistencia> arreglo = new ArrayList();
        while(result.next())
        {
            Asistencia asis = new Asistencia();
            asis.setId((int)result.getObject(1));
            asis.setRut((String)result.getObject(2));
            asis.setNombre((String)result.getObject(3));
            asis.setApellidoPaterno((String)result.getObject(4));
            asis.setApellidoMaterno((String)result.getObject(5));
            asis.setFecha((String)result.getObject(6));
            asis.setHora((String)result.getObject(7));
            asis.setHoraSalida((String)result.getObject(8));
            asis.setActiva((int)result.getObject(9));
            arreglo.add(asis);
        }
        return arreglo;
    }
    
    public static ArrayList<Asistencia> obtenerDatos() throws SQLException
    {
        ArrayList<Asistencia> alAsistencias = new ArrayList();
        conectar();
        ResultSet result = state.executeQuery("SELECT * FROM asistencia;");
        alAsistencias = getArreglo(result);
        connect.close();
        return alAsistencias;
    }
}
