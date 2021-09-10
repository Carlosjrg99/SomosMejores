<%-- 
    Document   : Grabar
    Created on : 25/05/2020, 04:01:09 PM
    Author     : Carlo
--%>

<%@page import="modelo.Docente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar</title>
    </head>
    <body>
    <%
        String rut;
        rut=request.getParameter("rut");
    %>
    <div class="container">
        <div class="row">
            <h1>MODIFICAR</h1>
            <form class="col s12" action="Controlador" method="POST">
                <div class="row">
                    <div class="input-field col s12">
                        <input placeholder="Rut"type="text" name="rut" id="disabled" class="validate" required="" value="<%=rut%>">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" name="nombre" class="validate">
                        <label for="nombre">Nombre</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" name="apellidoPaterno" class="validate">
                        <label for="apellidoPaterno">Apellido Paterno</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" name="apellidoMaterno" class="validate">
                        <label for="apellidoMaterno">Apellido Materno</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="password" name="password" class="validate">
                        <label for="password">Password</label>
                    </div>
                </div>
                <button class="btn waves-effect waves-light" type="submit" name="opcion" value="Modificar">Modificar
                </button>
                <button class="btn waves-effect waves-light" type="reset">Cancelar</button>
                <button class="btn waves-effect waves-light" onclick="goBack()">Regresar</button>
            </form>
        </div>
    </div>     
                    
             
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
                                out.println("<a class='btn waves-effect waves-light' style='margin-bottom:15px;' href='menuAdmin.jsp'>Volver</a>");
                                break;
                        case 2:
                                out.println("<a class='btn waves-effect waves-light' style='margin-bottom:15px;' href='menuDirector.jsp'>Volver</a>");
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
