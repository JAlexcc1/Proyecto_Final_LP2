<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tapasol / Polarizado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white fw-bold text-center fs-5">
                    Tapasol / Polarizado
                </div>
                <div class="card-body">
                    <form action="servicio" method="post">
                        <input type="hidden" name="tipo" value="polarizado">

                        <div class="mb-3">
                            <label class="form-label fw-bold">Nombre del cliente:</label>
                            <input type="text" name="nombre" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Material:</label>
                            <select name="material" class="form-select">
                                <option value="nanoCarbono">nanoCarbono</option>
                                <option value="nanoCeramico">nanoCeramico</option>
                                <option value="Crystalline">Crystalline</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Luz Visible:</label>
                            <select name="luzVisible" class="form-select">
                                <option value="5%">5%</option>
                                <option value="20%">20%</option>
                                <option value="35%">35%</option>
                                <option value="50%">50%</option>
                            </select>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Guardar</button>
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