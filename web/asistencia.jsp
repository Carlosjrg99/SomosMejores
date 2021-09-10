<%-- 
    Document   : asistencia
    Created on : 24/05/2020, 10:43:44 PM
    Author     : Carlo
--%>

<%@page import="dao.DocenteDAO"%>
<%@page import="modelo.Docente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <title>Ingreso Rut</title>
    </head>
    <body>
        
    <div class="container">
        <div class="row">
            <h1>Buscar RUT</h1>
            <form class="col s12" action="Controlador" method="POST">
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" name="rut" id="rut" class="validate" required="">
                        <label for="rut">Rut</label>
                    </div>
                </div>
                <button class="btn waves-effect waves-light" type="submit" name="opcion" value="Autocompletar">Continuar
                </button>
                <button class="btn waves-effect waves-light" type="reset">Cancelar</button>
                <button class="btn waves-effect waves-light" onclick="goBack()">Regresar</button>
            </form>
        </div>
    </div>     
        <script>
                function goBack() 
                {
                    window.history.back();
                }
        </script>
        
        <center><%
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
                                out.println("<a class='btn waves-effect waves-light' style='margin-bottom:15px;' href='menuCoordinador.jsp'>Volver</a>");
                                break;
                        case 4:
                                response.sendRedirect("MensajeError.jsp?mensaje=Error, usuario no auatorizado&retorno=index.jsp");
                                break;
                        default:
                                response.sendRedirect("MensajeError.jsp?mensaje=Error, usuario no auatorizado&retorno=index.jsp");
                                break;
                    }
                
                }
                %></center>
        
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
 