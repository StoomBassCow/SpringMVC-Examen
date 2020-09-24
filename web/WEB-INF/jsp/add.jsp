<%-- 
    Document   : add
    Created on : 23/09/2020, 02:53:24 PM
    Author     : César Huerta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
        <script src="https://unpkg.com/imask"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add page</title>
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
                                    <input required name="nombre" type="text" class="form-control" id="nombre" placeholder="Ingresa tu nombre completo">
                                </div>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="curp" class="form-label">CURP</label>
                                <div>
                                    <input name="curp" type="text" class="form-control" id="curp" placeholder="Masrcara de curp">
                                </div>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="nacimiento" class="form-label">Fecha de nacimiento</label>
                                <div>
                                    <input name="nacimiento" type="text" class="form-control" id="nacimiento" placeholder="">
                                </div>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="edad" class="form-label">Edad</label>
                                <div>
                                    <input name="edad" type="text" class="form-control" id="edad" placeholder=""  disabled>
                                </div>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="correo" class="form-label">Correo</label>
                                <div>
                                    <input name="correo" type="text" class="form-control" id="correo" placeholder="example@fakemail.com">
                                </div>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="telefono" class="form-label">Numero de telefono</label>
                                <div>
                                    <input  name="telefono" type="phone" class="form-control" id="telefono" placeholder="(000)000-00-00">
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-around">

                            <input type="submit" class="btn btn-success btn-lg" value="Agregar">
                            <a href="index.htm" class="btn btn-info btn-lg">Regresar</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" integrity="sha512-pHVGpX7F/27yZ0ISY+VVjyULApbDlD0/X0rgGbTqCE7WFW5MezNTWG/dnhtbBuICzsd0WQPgpE4REBLv+UqChw==" crossorigin="anonymous"></script>
        <script>


            var phone = document.getElementById("telefono");

            var maskOptions = {
                mask: '(000)000-00-00'
            };
            var mask = IMask(phone, maskOptions);





            var dateMask = IMask(
                    document.getElementById('nacimiento'),
                    {
                        mask: Date,
                        min: new Date(1990, 0, 1),
                        max: new Date(2020, 0, 1),
                        lazy: false
                    });



            var dispatchMask = IMask(element, {
                mask: [
                    {
                        mask: '+00 {21} 0 000 0000',
                        startsWith: '30',
                        lazy: false,
                        country: 'Greece'
                    },
                    {
                        mask: '+0 000 000-00-00',
                        startsWith: '7',
                        lazy: false,
                        country: 'Russia'
                    },
                    {
                        mask: '+00-0000-000000',
                        startsWith: '91',
                        lazy: false,
                        country: 'India'
                    },
                    {
                        mask: '0000000000000',
                        startsWith: '',
                        country: 'unknown'
                    }
                ],
                dispatch: function (appended, dynamicMasked) {
                    var number = (dynamicMasked.value + appended).replace(/\D/g, '');

                    return dynamicMasked.compiledMasks.find(function (m) {
                        return number.indexOf(m.startsWith) === 0;
                    });
                }
            }
            )


            var fecha = document.getElementById("nacimiento")

            function calcularEdad(fecha) {
                var hoy = new Date();
                var cumpleanos = new Date(fecha);
                var edad = hoy.getFullYear() - cumpleanos.getFullYear();
                var m = hoy.getMonth() - cumpleanos.getMonth();

                if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
                    edad--;
                }

                return edad;
            }
            
           document.querySelector("edad").textContent = calcularEdad(fecha);
            
        </script>


    </body>
</html>
