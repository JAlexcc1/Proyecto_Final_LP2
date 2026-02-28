<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Servicio" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion Servicios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">


    <div class="text-center mb-5">
        <h1 class="fw-bold">Bienvenido</h1>
        <p class="text-muted fs-5">Selecciona un servicio para continuar</p>
    </div>

    <div class="row justify-content-center">
        <%
            List<Servicio> servicios = (List<Servicio>) request.getAttribute("servicios");
            if (servicios != null && !servicios.isEmpty()) {
                Servicio s = servicios.get(0);
        %>

        <div class="col-md-6 d-flex flex-column gap-4">

            <!-- Logotipos -->
            <div class="card shadow-sm text-center">
                <div class="card-header bg-success text-white fw-bold">
                    Logotipo Vehicular
                </div>
                <div class="card-body">
                    <p class="card-text text-muted">Diseño y aplicación de logotipos vehiculares.</p>
                    <a href="servicio?tipo=logotipos" class="btn btn-success"><%= s.getLogotipos() %></a>
                </div>
            </div>

            <!-- Polarizado -->
            <div class="card shadow-sm text-center">
                <div class="card-header bg-primary text-white fw-bold">
                    Tapasol / Polarizado
                </div>
                <div class="card-body">
                    <p class="card-text text-muted">Aplicación de láminas y polarizado vehicular.</p>
                    <a href="servicio?tipo=polarizado" class="btn btn-primary"><%= s.getPolarizado() %></a>
                </div>
            </div>

            <!-- Instalaciones -->
            <div class="card shadow-sm text-center">
                <div class="card-header bg-warning text-dark fw-bold">
                    Instalaciones
                </div>
                <div class="card-body">
                    <p class="card-text text-muted">Instalación de accesorios y equipos vehiculares.</p>
                    <a href="servicio?tipo=instalaciones" class="btn btn-warning"><%= s.getInstalaciones() %></a>
                </div>
            </div>

        </div>

        <% } %>
        
    </div>
        <!-- Boton Reportes abajo -->
   			 <div class="text-center mt-4">
    		    <a href="servicio?tipo=reportes" class="btn btn-secondary px-4">Reportes</a>
   			 </div>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>