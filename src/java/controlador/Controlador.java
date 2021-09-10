/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dao.AsistenciaDAO;
import dao.DocenteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Asistencia;
import modelo.Docente;

/**
 *
 * @author Carlos Ron
 */
public class Controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String rut = "";
        String nombre = "";
        String apellidoPaterno="";
        String apellidoMaterno="";
        int tipoUsuario=0;
        String foto="";
        String username="";
        String password="";
        int estado=0;
        String opcion=request.getParameter("opcion");


       /* foto=request.getParameter("foto");
        username=request.getParameter("username");
        password=request.getParameter("password");
        if(request.getParameter("estado").equals("on"))
        {
            estado=1;
        }
        else
        {
            response.sendRedirect("CerrarSesion.jsp");
        }
        opcion = request.getParameter("opcion");*/
       /*if(opcion.equals("prueba"))
       {
            if(!request.getParameter("password").equals(request.getParameter("passwordConfirmacion")))
            {
                response.sendRedirect("MensajeError.jsp?mensaje=Password no coincide&retorno=Grabar.jsp");
            }
                password=request.getParameter("password");
       }*/
       
        if (opcion.equals("Grabar")) 
        {
            rut=request.getParameter("rut");
            nombre=request.getParameter("nombre");
            apellidoPaterno=request.getParameter("apellidoPaterno");
            apellidoMaterno=request.getParameter("apellidoMaterno");
            password=request.getParameter("password");
            switch (request.getParameter("tipoUsuario")) 
            {
                case "administrador":
                    tipoUsuario=1;
                    break;
                case "directorCarrera":
                    tipoUsuario=2;
                    break;
                case "coordinador":
                    tipoUsuario=3;
                    break;
                case "docente":
                    tipoUsuario=4;
                    break;
                default:
                    break;
            }
            foto="foto3.jpg";
            //boolean prueba = DocenteDAO.revisionRut(rut);
            /*if(!prueba)
            {
                //response.sendRedirect("MensajeError.jsp?mensaje=Rut ya existente&retorno=Grabar.jsp");
            }*/
            username = DocenteDAO.revisionUsuario(nombre, apellidoPaterno);
                //response.sendRedirect("MensajeOk.jsp?mensaje=Usuario agregado<br>Su username es: &username="+rut+" "+nombre+" "+username+" "+apellidoPaterno+" "+apellidoMaterno+" "+password);
            Docente docente=new Docente(rut, nombre, apellidoPaterno, apellidoMaterno, tipoUsuario, foto, username, password, estado);
            
            
            if(DocenteDAO.agregar(docente) == true)
            {
            //bien
                response.sendRedirect("MensajeOk.jsp?mensaje=Usuario agregado<br>Su username es: &username="+username);

                  
            }else{
                 //error
                response.sendRedirect("MensajeError.jsp?mensaje=Rut ya existente&retorno=Grabar.jsp");
            }
        }

        if(opcion.equals("Autocompletar"))
        {
            Docente user=null;
            String estadoSesion="off";

            HttpSession sesion = request.getSession(true);

            user=(Docente)sesion.getAttribute("usuario");
            
            Docente docente;
            rut=request.getParameter("rut");
            if(!DocenteDAO.revisarRut(rut))
            {
                docente=DocenteDAO.buscar(rut);
                request.setAttribute("rut", rut);
                request.setAttribute("nombre", docente.getNombre());
                request.setAttribute("apellidoPaterno", docente.getApellidoPaterno());
                request.setAttribute("apellidoMaterno", docente.getApellidoMaterno());
                request.getRequestDispatcher("asistenciaTiempo.jsp").forward(request, response);
            }
            else
            {
                response.sendRedirect("MensajeError.jsp?mensaje=El rut no existe&retorno=asistencia.jsp");
            }
            //if(user.getRut().equals(rut))
            //{
            //}
            //else
            //{
              //  
            //}
            //response.sendRedirect("asistenciaTiempo.jsp?rut="+docente.getRut()+"&nombre="+docente.getNombre()+"?apellidoPaterno"+docente.getApellidoPaterno()+"&apellidoMaterno"+docente.getApellidoMaterno());
            
        }
        
        if(opcion.equals("Asistir"))
        {
            String hora, fecha, id;
            fecha=request.getParameter("fecha");
            hora=request.getParameter("hora");
            rut=request.getParameter("rut");
            nombre=request.getParameter("nombre");
            apellidoPaterno=request.getParameter("apellidoPaterno");
            apellidoMaterno=request.getParameter("apellidoMaterno");
            //id=AsistenciaDAO.generarID(rut);
            if(!AsistenciaDAO.revisionFecha(rut, fecha))
            {
                Asistencia asistencia = new Asistencia(0,rut, nombre, apellidoPaterno, apellidoMaterno, fecha, hora, "No Registrada",1);
                    if(AsistenciaDAO.agregar(asistencia))
                    {
                    //bien
                        response.sendRedirect("MensajeOk.jsp?mensaje=Asistencia registrada<br>&username=:)");
                    }
            }
            else
            {
                if(AsistenciaDAO.salida(rut, fecha, hora))
                {
                    //bien
                        response.sendRedirect("MensajeOk.jsp?mensaje=Salida registrada<br>&username=:)");
                }
            }
            //response.sendRedirect("asistenciaTiempo.jsp");
            //response.sendRedirect("asistenciaTiempo.jsp?rut="+docente.getRut()+"&nombre="+docente.getNombre()+"?apellidoPaterno"+docente.getApellidoPaterno()+"&apellidoMaterno"+docente.getApellidoMaterno());           
        }
        if(opcion.equals("Fecha"))
        {
            String fecha;
            String filtro;
            fecha=request.getParameter("calendario");
            filtro=request.getParameter("filtro");
            request.setAttribute("fecha", fecha);
            request.setAttribute("filtro", filtro);
            request.getRequestDispatcher("MostrarAsistencia.jsp").forward(request, response);
        }
        
        if (opcion.equals("Modificar")) {
            rut=request.getParameter("rut");
            nombre="";
            apellidoPaterno="";
            apellidoMaterno="";
            password="";
            tipoUsuario=0;
            if(!request.getParameter("nombre").isEmpty())
            {
                nombre=request.getParameter("nombre");
            }
            if(!request.getParameter("apellidoPaterno").isEmpty())
            {
                apellidoPaterno=request.getParameter("apellidoPaterno");
            }
            if(!request.getParameter("apellidoMaterno").isEmpty())
            {
                apellidoMaterno=request.getParameter("apellidoMaterno");
            }
            if(!request.getParameter("password").isEmpty())
            {
                password=request.getParameter("password");
            }
            Docente docente = new Docente(rut, nombre, apellidoPaterno, apellidoMaterno, 0, "", "", password, 0);

            if (DocenteDAO.modificar(docente) == true) 
            {
                //bien, modificado
                
                response.sendRedirect("MensajeOk.jsp?mensaje=Datos modificados...&username=:)");

            } else 
            {
                //mal, no modificó
                response.sendRedirect("MensajeError.jsp?mensaje=Error, no hubo modificion&retorno=Editar.jsp");
            }
        }

        if (opcion.equals("Eliminar")) {
            rut=request.getParameter("rut");
            if (DocenteDAO.eliminar(rut) == true) {
                //bien...modificado
                response.sendRedirect("MensajeOk.jsp?mensaje=Datos eliminados...&username=:)");
            } else {
                //error...

            }

        }

        if (opcion.equals("grabar")) 
        {
            response.sendRedirect("Grabar.jsp");
        }
        
        if (opcion.equals("Editar"))
        {
            response.sendRedirect("Editar.jsp");
        }

        if (opcion.equals("Buscar")) 
        {
            response.sendRedirect("Mostrar.jsp?rut=" + rut);
        }

        if (opcion.equals("Listar")) 
        {
            response.sendRedirect("Listar.jsp");
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");
            out.println("</head>");
            out.println("<body>");
            // out.println("<h1>rut= " + rut + "</h1>");
            //  out.println("<h1>nombre  = " + nombre + "</h1>");
            //   out.println("<h1>opcion = " + opcion + "</h1>");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
