<%-- 
    Document   : index  Login
    Created on : 20-05-2020, 11:45:38
    Author     : Carlos Ron
--%>

<%@page import="dao.DocenteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Somos Mejores</title>


    </head>
    <body>
    <center><h1>Ingrese sus Datos</h1></center>
        <%
              /* if(  DocenteDAO.getSW()  ==  0)
               {
                     DocenteDAO.llenar();
               }
            */
         %>
        
        <!--
        <form action="ControladorLogin" method="POST">
            Docente:<input type="text" name="Docente" value="" /><br>
            Clave:<input type="password" name="clave" value="" /><br>
            
            <input type="submit" value="Aceptar" name="opcion" />
            
        </form>
         -->
        
         <div style="margin-top: 30px;" class="container">
            <div class="row">
                <form class="col s12" action="ControladorLogin" method="post" >
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="user" type="text" name="usuario" value="" class="validate" required="">
                            <label for="user">Usuario</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="password" type="password" input name="clave" value="" class="validate" required="">
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <button class="btn waves-effect waves-light" type="submit" value="Aceptar" name="opcion" >Enviar
                        <i class="material-icons right">send</i>
                    </button>
                    <button class="btn waves-effect waves-light" type="reset">Cancelar</button>
                </form>
            </div>
        </div>
        
        
        






        
        <!--
          <script>

            document.addEventListener('DOMContentLoaded', function () {
                // var elems = document.querySelectorAll('.sidenav');
                // var instances = M.Sidenav.init(elems);
                M.AutoInit();
            });
        </script>
        
       -->
      
        <script>
            $(document).ready(function () {
                //$('select').formSelect();  
                $(".dropdown-trigger").dropdown();
            });
        </script>
 
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
