<%-- 
    Document   : index
    Created on : 14-05-2020, 16:33:11
    Author     : Carlos Ron
--%>

<%@page import="modelo.Docente"%>
<%@page import="dao.DocenteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD</title>
        
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    </head>
    <body>      
    <div class="container">
        <div class="row">
            <h1>CRUD de DOCENTES</h1>
            <form class="col s12" action="Controlador" method="POST">
                <button class="btn waves-effect waves-light" type="submit" name="opcion" value="grabar"> Grabar
                </button>
                <button class="btn waves-effect waves-light" type="submit" name="opcion" value="Editar"> Editar
                </button>
                <%
                Docente user=null;
                String estadoSesion="off";

                HttpSession sesion = request.getSession(true);

                user=(Docente)sesion.getAttribute("usuario");
                estadoSesion=(String) sesion.getAttribute("estadoSesion");   

                if(estadoSesion == null )
                {
                     response.sendRedirect("MensajeError.jsp?mensaje=Error, usuario no auatorizado&retorno=index.jsp");
                }       
               else{
                    //Docente válido
                    // tiene nivel de acceso?
                    switch(user.getTipoUsuario())
                    {
                        case 1:
                                out.println("<a class='btn waves-effect waves-light' href='menuAdmin.jsp'>Volver</a>");
                                break;
                        case 2:
                                out.println("<a class='btn waves-effect waves-light' href='menuDirector.jsp'>Volver</a>");
                                break;
                        case 3:
                                response.sendRedirect("MensajeError.jsp?mensaje=Error, usuario no auatorizado&retorno=index.jsp");
                                break;
                        case 4:
                                response.sendRedirect("MensajeError.jsp?mensaje=Error, usuario no auatorizado&retorno=index.jsp");
                                break;
                        default:
                                response.sendRedirect("MensajeError.jsp?mensaje=Error, usuario no auatorizado&retorno=index.jsp");
                                break;
                    }
                }
                %>
            </form>
        </div>
    </div>     
         
        
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
