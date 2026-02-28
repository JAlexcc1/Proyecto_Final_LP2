<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Instalaciones</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-warning text-dark fw-bold text-center fs-5">
                    Instalaciones
                </div>
                <div class="card-body">
                    <form action="servicio" method="post">
                        <input type="hidden" name="tipo" value="instalaciones">

                        <div class="mb-3">
                            <label class="form-label fw-bold">Nombre del cliente:</label>
                            <input type="text" name="nombre" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Selecciona una opción:</label>
                            <select name="opcionInstalacion" class="form-select">
                                <option value="Tapizado de Techo">Tapizado de Techo</option>
                                <option value="Tapizado de Piso">Tapizado de Piso</option>
                                <option value="Confeccion de Fundas">Confeccion de Fundas</option>
                                <option value="Instalacion de Radio">Instalacion de Radio</option>
                                <option value="Instalacion de GPS">Instalacion de GPS</option>
                            </select>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-warning">Aceptar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>