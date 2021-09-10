<%-- 
    Document   : Editar
    Created on : 21-05-2020, 11:30:43
    Author     : Carlos Ron
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Docente"%>
<%@page import="dao.AsistenciaDAO"%>
<%@page import="modelo.Asistencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salida</title>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css--><script type="text/javascript" src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/js/materialize.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/pinzon1992/materialize_table_pagination/f9a8478f/js/pagination.js"></script>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <center><h1>Salidas no Registradas</h1></center>
    <script>
    $(document).ready(function(){
        $('#myTable').pageMe({
            pagerSelector:'#myPager',
            activeColor: 'blue',
            prevText:'Anterior',
            nextText:'Siguiente',
            showPrevNext:true,
            hidePageNumbers:false,
            perPage:3
        });
    });
    </script>
    <div class="row">
        <div class="col s12 m12 l6 offset-l2 center">
            <!--<input type="text" id="search" placeholder="Type to search..." />-->
            <table cellpadding="1" cellspacing="1" class="table table-hover" id="myTable">
              <thead>
                <tr>
                        <th>Rut
                        <th>Nombre
                        <th>Apellido 1
                        <th>Apellido 2
                        <th>Fecha
                        <th>Hora Entrada
                        <th>Hora Salida
                </tr>
              </thead>
              <tbody>
                    <%
                        String tipo;
                        ArrayList<Asistencia> asistencia = AsistenciaDAO.obtenerDatos();
                        for (Asistencia asis:asistencia) {
                            if(asis.getHoraSalida().equals("No Registrada"))
                            {
                                out.println("<tr>");
                                out.println("<td>" + asis.getRut() + "</td>");
                                out.println("<td>" + asis.getNombre() + "</td>");
                                out.println("<td>" + asis.getApellidoPaterno() + "</td>");
                                out.println("<td>" + asis.getApellidoMaterno() + "</td>");
                                out.println("<td>" + asis.getFecha()+ "</td>");
                                out.println("<td>" + asis.getHora()+ "</td>");
                                out.println("<td>No Registrada</td>");
                                out.println("</tr>");
                            }
                        }
                    %>
                    </tbody>
            </table>
            <div class="col-md-12 center text-center">
                <span class="left" id="total_reg"></span>
                <ul class="pagination pager" id="myPager"></ul>
            </div>
        </div>
    </div>
    <br><br><br>
    <center><button class="btn waves-effect waves-light" style="margin-bottom: 20px;" onclick="goBack()">Regresar</button></center>
    <script>
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
