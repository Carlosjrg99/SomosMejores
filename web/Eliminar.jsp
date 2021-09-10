<%-- 
    Document   : eliminar
    Created on : 14-04-2020, 17:35:20
    Author     : admin
--%>

<%@page import="modelo.Docente"%>
<%@page import="dao.DocenteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css--><script type="text/javascript" src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/js/materialize.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/pinzon1992/materialize_table_pagination/f9a8478f/js/pagination.js"></script>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>

        <%
            String rut = "";

            rut = request.getParameter("rut");

            //out.println("rut = "+rut);
            Docente docente = DocenteDAO.buscar(rut);
            //validar si es null

        %>

        
        
        
        
        
    <div class="container">
        <div class="row">
        <h1>Eliminar Usuario</h1>
            <form class="col s12" action="Controlador" method="POST">
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" name="rut" value="<%=docente.getRut()%>"><br>
                        <label for="rut">Rut</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" name="marca" value="<%=docente.getNombre()%>"><br>    
                        <label for="marca">Nombre</label>
                    </div>
                </div>
                <button class="btn waves-effect waves-light" type="submit" name="opcion" value="Eliminar"> Eliminar
                </button>
                <button class="btn waves-effect waves-light" name="opcion" value="Cancelar" type="reset">Cancelar</button>   
                <button class="btn waves-effect waves-light" onclick="goBack()">Regresar</button>
            </form>
        </div>
    </div>     

        <br><br><br>
    <center>
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
        </center>
    <script>
        function goBack() 
        {
            window.history.back();
        }
    </script>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
