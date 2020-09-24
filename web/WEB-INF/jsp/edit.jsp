<%-- 
    Document   : edit
    Created on : 23/09/2020, 09:10:00 PM
    Author     : César Huerta
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit page</title>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card">
                <div class="card-header bg-info">
                    <h4>Nuevo registro</h4>
                </div>
                <div class="card-body">
                    <form method="POST" >
                    
                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <div>
                                            <input name="nombre" type="text" class="form-control" id="nombre" placeholder="Ingresa tu nombre completo" value="${list[0].nombre}">
                                    </div>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="curp" class="form-label">CURP</label>
                                    <div>
                                        <input name="curp" type="text" class="form-control" id="curp" placeholder="Masrcara de curp" value="${list[0].curp}">
                                    </div>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="fechaNacimiento" class="form-label">Fecha de nacimiento</label>
                                    <div>
                                        <input name="nacimiento" type="text" class="form-control" id="fechaNacimiento" placeholder="Mascara de fecha" value="${list[0].nacimiento}">
                                    </div>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="edad" class="form-label">Edad</label>
                                    <div>
                                        <input name="edad" type="text" class="form-control" id="edad" placeholder=""  disabled value="${list[0].edad}">
                                    </div>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="correo" class="form-label">Correo</label>
                                    <div>
                                        <input name="correo" type="text" class="form-control" id="correo" placeholder="Mascara de correo" value="${list[0].correo}">
                                    </div>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="telefono" class="form-label">Numero de telefono</label>
                                    <div>
                                        <input name="telefono" type="text" class="form-control" id="telefono" placeholder="Mascara de telefono" value="${list[0].telefono}">
                                    </div>
                                </div>
                       
                        </div>
                        <div class="d-flex justify-content-around">
                            <input type="submit" class="btn btn-success btn-lg" value="Actualizar">
                            <a href="index.htm" class="btn btn-info btn-lg">Regresar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
