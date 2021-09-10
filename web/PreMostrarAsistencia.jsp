<%-- 
    Document   : PreMostrarAsistencia
    Created on : 26/05/2020, 03:38:03 PM
    Author     : Carlo
--%>

<%@page import="modelo.Docente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css--><script type="text/javascript" src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/js/materialize.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/pinzon1992/materialize_table_pagination/f9a8478f/js/pagination.js"></script>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FECHAS</title>
    </head>
    <body>
        
    <div class="container">
        <div class="row">
            <h1>Elegir Fecha</h1>
            <form class="col s12" action="Controlador" method="POST">
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" class="datepicker" name="calendario">
                        <label for="calendario">Seleccionar Fecha</label>
                    </div>
                </div>
                <div class="row">
                    <div>
                    <p>
                      <label>
                          <input name="filtro" type="radio" value="Si" required=""/>
                        <span>Filtrar</span>
                      </label>
                    </p>
                    <p>
                      <label>
                          <input name="filtro" type="radio" value="No" required=""/>
                        <span>No Filtrar</span>
                      </label>
                    </p>
                    </div>
                </div>
                <button class="btn waves-effect waves-light" type="submit" name="opcion" value="Fecha">Continuar
                </button>
                <button class="btn waves-effect waves-light" type="reset">Cancelar</button>
                <button class="btn waves-effect waves-light" onclick="goBack()">Regresar</button>
            </form>
        </div>
    </div>     
        
        <script>
        document.addEventListener('DOMContentLoaded', function() 
        {
            var elems = document.querySelectorAll('.datepicker');
            var instances = M.Datepicker.init(elems, 
            {
                format:'dd/mm/yyyy',
                showClearBtn:true,
                i18n:{
                    clear:'remover',
                    cancel:'cancelar',
                    done:'elegir'
                },
                disableWeekends:true
            });
         });
                
        
        function goBack() 
        {
            window.history.back();
        }        
        </script>
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
                                out.println("<a class='btn waves-effect waves-light' href='menuCoordinador.jsp'>Volver</a>");
                                break;
                        case 4:
                                out.println("<a class='btn waves-effect waves-light' href='menuDocente.jsp'>Volver</a>");
                                break;
                        default:
                                response.sendRedirect("MensajeError.jsp?mensaje=Error, usuario no auatorizado&retorno=index.jsp");
                                break;
                    }
                
                }
                %>
        </center>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
