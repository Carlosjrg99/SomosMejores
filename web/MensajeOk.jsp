<%-- 
    Document   : MensajeOk
    Created on : 16-04-2020, 12:29:07
    Author     : admin
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
        <title>OK</title>
    </head>
    <body>
        <%
              String mensaje;
              String username;
              mensaje=request.getParameter("mensaje");
              username=request.getParameter("username");
         %>
        
        
    <center>
        
        <h1>Bien!</h1>

        <h3> <%=mensaje+"<br><br>"+username%></h3>

        <br><br><br>
        <button class="btn waves-effect waves-light" onclick="goBack()">Volver</button>
        <script>
        function goBack() 
        {
            window.history.back();
        }
        </script>
    </center>

    <!--JavaScript at end of body for optimized loading-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>
