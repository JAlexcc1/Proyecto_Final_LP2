<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logotipo Vehicular</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-success text-white fw-bold text-center fs-5">
                    Logotipo Vehicular
                </div>
                <div class="card-body">
                    <form action="servicio" method="post">
                        <input type="hidden" name="tipo" value="logotipos">

                        <div class="mb-3">
                            <label class="form-label fw-bold">Nombre del cliente:</label>
                            <input type="text" name="nombre" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Selecciona una opción:</label>
                            <select name="opcionLogotipo" class="form-select">
                                <option value="Placa Provisional">Placa Provisional</option>
                                <option value="Tapasol">Tapasol</option>
                                <option value="Forrado de faros">Forrado de faros</option>
                                <option value="Forrado de techo">Forrado de techo</option>
                                <option value="Forrado de pisaderas">Forrado de pisaderas</option>
                                <option value="Manijas">Manijas</option>
                            </select>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">Aceptar</button>
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