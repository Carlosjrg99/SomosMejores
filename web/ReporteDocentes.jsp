<%-- 
    Document   : Editar
    Created on : 21-05-2020, 11:30:43
    Author     : Carlos Ron
--%>

<%@page import="modelo.Docente"%>
<%@page import="dao.DocenteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Docente</title>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css--><script type="text/javascript" src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/js/materialize.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/pinzon1992/materialize_table_pagination/f9a8478f/js/pagination.js"></script>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <center><h1>Reporte Docentes</h1></center>
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
                        <th>Usuario
                        <th>Foto
                </tr>
              </thead>
              <tbody>
                    <%
                        String tipo;
                        for (Docente docente : DocenteDAO.obtenerDatos()) 
                        {
                            if(docente.getTipoUsuario()==4)
                            {
                                out.println("<tr>");
                                out.println("<td>" + docente.getRut() + "</td>");
                                out.println("<td>" + docente.getNombre() + "</td>");
                                out.println("<td>" + docente.getApellidoPaterno() + "</td>");
                                out.println("<td>" + docente.getApellidoMaterno() + "</td>");
                                out.println("<td>" + docente.getUsername() + "</td>");
                                out.println("<td> <img class='circle' src='fotos/" + docente.getFoto() + "' height='80' width='50'></td>");
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
    <!--JavaScript at end of body for optimized loading-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
