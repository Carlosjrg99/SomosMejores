<%-- 
    Document   : MensajeOk
    Created on : 16-04-2020, 12:29:07
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR</title>
    </head>
    <body>
        <%
              String mensaje, retorno;
              
              mensaje=request.getParameter("mensaje");
              retorno=request.getParameter("retorno");
         %>
        
        
    <center>
        
        <h1>Error!</h1>

        <h3> <%=mensaje%></h3>

        <br><br><br>
        <a href="<%=retorno%>"><button class="btn waves-effect waves-light">Volver</button></a>
    </center>

    <!--JavaScript at end of body for optimized loading-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>