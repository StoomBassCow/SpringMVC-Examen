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
        <script src="https://unpkg.com/imask"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit page</title>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card">
                <div class="card-header bg-info text-light">
                    <h4>Editar registro de ${list[0].nombre}</h4>
                </div>
                <div class="card-body">
                    <form method="POST" >

                        <div class="row">
                            <div class="form-group col-lg-6 col-md-4 col-sm-12">
                                <label for="nombre" class="form-label">Nombre</label>
                                <div>
                                    <input  name="nombre" type="text" class="form-control" id="nombre" placeholder="Ingresa tu nombre completo" value="${list[0].nombre}">
                                </div>
                            </div>
                            <div class="form-group col-lg-6 col-md-4 col-sm-12">
                                <label for="curp" class="form-label">CURP</label>
                                <div>
                                    <input name="curp" type="text" class="form-control" id="curp" placeholder="Masrcara de curp" value="${list[0].curp}">
                                </div>
                            </div>
                            <div class="form-group col-lg-6 col-md-4 col-sm-12">
                                <label for="nacimiento" class="form-label">Fecha de nacimiento</label>
                                <div>
                                    <input name="nacimiento" type="date" class="form-control" id="nacimiento" onchange="calcular_edad()" placeholder="Mascara de fecha" value="${list[0].nacimiento}">
                                </div>
                            </div>
                            <div class="form-group col-lg-6 col-md-4 col-sm-12">
                                <label for="edad" class="form-label">Edad</label>
                                <div>
                                    <input name="edad" type="text" class="form-control" id="edad" placeholder=""  disabled value="${list[0].edad}">
                                </div>
                            </div>
                            <div class="form-group col-lg-6 col-md-4 col-sm-12">
                                <label for="correo" class="form-label">Correo</label>
                                <div>
                                    <input name="correo" type="text" class="form-control" id="correo" placeholder="Mascara de correo" value="${list[0].correo}">
                                </div>
                            </div>
                            <div class="form-group col-lg-6 col-md-4 col-sm-12">
                                <label for="telefono" class="form-label">Numero de telefono</label>
                                <div>
                                    <input name="telefono" type="text" class="form-control" id="telefono" placeholder="Mascara de telefono" value="${list[0].telefono}">
                                </div>
                            </div>

                        </div>
                        <div class="d-flex justify-content-around">
                            <input type="submit" onclick="return validar();" class="btn btn-success btn-lg" value="Actualizar">
                            <a href="index.htm" class="btn btn-info btn-lg">Regresar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" integrity="sha512-pHVGpX7F/27yZ0ISY+VVjyULApbDlD0/X0rgGbTqCE7WFW5MezNTWG/dnhtbBuICzsd0WQPgpE4REBLv+UqChw==" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>



        <script>

            var phone = document.getElementById("telefono");
            var maskOptions = {
                mask: '(000)000-00-00'
            };
            var mask = IMask(phone, maskOptions);
        </script>



        



        <script>
            function calcular_edad() {
                var birth_date = new Date(document.getElementById("nacimiento").value);
                var birth_date_day = birth_date.getDate();
                var birth_date_month = birth_date.getMonth();
                var birth_date_year = birth_date.getFullYear();

                var today_date = new Date();
                var today_day = today_date.getDate();
                var today_month = today_date.getMonth();
                var today_year = today_date.getFullYear();

                var calculated_age = 0;

                if (today_month > birth_date_month)
                    calculated_age = today_year - birth_date_year;
                else if (today_month == birth_date_month) {
                    if (today_day > birth_date_day)
                        calculated_age = today_year - birth_date_year;
                    else
                        calculated_age = today_year - birth_date_year - 1;
                } else
                    calculated_age = today_year - birth_date_year - 1;

                var output_value = calculated_age;
                document.getElementById("edad").value = calculated_age;

            }
        </script>
        
       <script>
            function validar() {

                var nombre, curp, nacimiento, edad, correo, telefono, expresion;
                nombre = document.getElementById("nombre").value;
                curp = document.getElementById("curp").value;
                nacimiento = document.getElementById("nacimiento").value;
                edad = document.getElementById("edad").value;
                correo = document.getElementById("correo").value;
                telefono = document.getElementById("telefono").value;
                expresion = /\w+@\w+\.+[a-z]/;

                if (nombre === "" || nombre === null || curp === "" || nacimiento === "" || edad === "" || correo === "" || telefono === "") {

                    alert("Todos los campos son obligatorios");
                    return false;
                } else if (nombre.length > 100) {
                    alert("El nombre es muy grande");
                    return false;
                } else if (curp.length > 18 || curp.length < 18) {
                    alert("El CURP debe contener 18 digitos, revisalo nuevamente");
                    return false;
                } else if (!expresion.test(correo)) {
                    alert("El correo que ingresaste no es valido");
                    return false;
                }
            }
        </script>
    </body>
</html>
