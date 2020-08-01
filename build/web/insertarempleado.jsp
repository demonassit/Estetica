<%-- 
    Document   : insertarempleado
    Created on : 1/08/2020, 07:13:31 AM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page language="java" import="java.sql.*, java.util.*, java.text.*"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Empleado</title>
    </head>
    <body>
        <h1>Bienvenidos</h1>
<%
    //codigo java
    //Establecer la conexion con la BD
    Connection con = null;
    String url, user, pass, driver;
    url = "jdbc:mysql://localhost/Estetica";
    user = "root";
    pass = "n0m3l0";
    
    driver = "com.mysq.jdbc.Driver";
    
    try{
        
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, pass);
        System.out.println("Si se conecto a la BD");
        
        //otro try para saber si inserta
        try{
            Statement ps = con.createStatement();
            String nom, appat, apmat, email, puesto, password;
            int edad;
            
            //obtener los parametros del index
            
            nom = request.getParameter("nombre");
            appat = request.getParameter("appat");
            apmat = request.getParameter("apmat");
            edad = Integer.parseInt(request.getParameter("edad"));
            email = request.getParameter("email");
            puesto = request.getParameter("puesto");
            password = request.getParameter("password");
            
            String q;
            
            q = "insert into mempleado (nom_emp, appat_emp, "
                    + "apmat_emp, edad_emp, email_emp, puesto_emp, pass_emp)"
                    + "values ('"+nom+"', '"+appat+"', '"+apmat+"', '"+edad+"',"
                    + "'"+email+"', '"+puesto+"', '"+password+"')";
            
            con.close();
            
            %>
        <h1>Empleado Registrado con exito</h1>
        
        <%
        }catch(SQLException ex){
            System.out.println("No encontro la tabla");
            System.out.println(ex.getMessage());
            System.out.println(ex.getSQLState());
        
            %>
        <h1>Error al Conectar con la Tabla verifique los datos del formulario</h1>
        
        <%
        }
        
    }catch(Exception e){
        System.out.println("No se conecto a la BD");
        System.out.println(e.getMessage());
        System.out.println(e.getStackTrace());
    

        %>
        <h1>Error al Conectar con la BD</h1>
        <%
    }

%>        
        <br>
        <a href="index.html" >Regresar al Menu</a>
    
        
        
    </body>
</html>
