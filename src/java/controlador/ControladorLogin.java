/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

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
import modelo.Docente;

/**
 *
 * @author admin
 */
public class ControladorLogin extends HttpServlet {

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
        
        
        
        /*
             Enviar hasta el lunes 11, 23:55 horas... a la manito.
        
        */
        String usuario, clave;
        
        //paso1:
        //recuperar datos del form
        usuario=request.getParameter("usuario");
        clave=request.getParameter("clave");
              
        HttpSession sesion = request.getSession(true);  //inicio una sesión
        
         sesion.setAttribute("usuario", null);
         sesion.setAttribute("estadoSesion", "off");
                 
        
        //paso2
        // validar si el usuario existe   login (usuario, clave) 
        //   (!= null)  si, entonce muestro menú
        //  (null)  no, mensaje de error y botón volver al login (index)       
        
        Docente user=DocenteDAO.login(usuario, clave);
        
        if(user != null)
        {
            //encontrado
            //grabar objeto en sesión
            //enviar al index
            //Qué tipo de usuario es?            
            sesion.setAttribute("usuario", user);
            sesion.setAttribute("estadoSesion", "on");    
            
            switch(user.getTipoUsuario())
            {
                case 1:
                    response.sendRedirect("menuAdmin.jsp");
                    break;
                case 2:
                    response.sendRedirect("menuDirector.jsp");
                    break;
                case 3:
                    response.sendRedirect("menuCoordinador.jsp");
                    break;
                case 4:
                    response.sendRedirect("menuDocente.jsp");
                    break;
                default:
                    response.sendRedirect("MensajeError.jsp?mensaje=Error, usuario o clave incorrectos&retorno=index.jsp");
                    break;
            }
              
             /*
             if( user.getTipoUsuario() == 3)
            {
                 response.sendRedirect("menuDirector.jsp");
            }            
             
             if( user.getTipoUsuario() == 4)
            {
                 response.sendRedirect("menuDirector.jsp");
            }     */       
             //pendiente capturar los otros casos, tarea para usted. validar los casos 3 (cliente) y 4 (gerente)
        }
        else{
            //error no existe
            //dejar sesión en false
            //mensaje de error volver al index           
            
            response.sendRedirect("MensajeError.jsp?mensaje=Error, usuario o clave incorrectos&retorno=index.jsp");
        }
        
        
        
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorLogin at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(ControladorLogin.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ControladorLogin.class.getName()).log(Level.SEVERE, null, ex);
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
