<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD</title>
    </head>

    <body>

    <section>
        <div class="container mt-4">
            <div class="card-header bg-info text-white">                
                <h3>Formulario de registro de usuarios</h3>
            </div>
        </div>
        <div class="container mt-4">
            <div class="d-flex justify-content-end">
                <a href="add.htm" class="btn btn-success">Agregar</a>
            </div>
        </div>
        <div class="container mt-4">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">CURP</th>
                        <th scope="col">Fecha de nacimiento</th>
                        <th scope="col">Edad</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="data" items="${list}">
                        <tr>
                            <td>${data.id}</td>
                            <td>${data.nombre}</td>
                            <td>${data.curp}</td>
                            <td>${data.nacimiento}</td>
                            <td>${data.edad}</td>
                            <td>${data.correo}</td>
                            <td>${data.telefono}</td>
                            <td>
                                <a href="edit.htm?id=${data.id}" class="btn btn-warning btn-block">Edit</a>
                                <a href="delete.htm=id=${data.id}" class="btn btn-danger btn-block">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>

    
    <script></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" integrity="sha512-pHVGpX7F/27yZ0ISY+VVjyULApbDlD0/X0rgGbTqCE7WFW5MezNTWG/dnhtbBuICzsd0WQPgpE4REBLv+UqChw==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
</body>
</html>
