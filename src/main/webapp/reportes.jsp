<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Cliente" %>
<%@ page import="model.Pedido" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reportes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

    <h2 class="mb-4 text-center fw-bold">Panel de Reportes</h2>

    <!-- Clientes -->
    <div class="card mb-5 shadow-sm">
        <div class="card-header bg-success text-white fw-bold">
            Clientes Registrados
        </div>
        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
                        if (clientes != null) {
                            for (Cliente c : clientes) {
                    %>
                    <tr>
                        <td><%= c.getIdCliente() %></td>
                        <td><%= c.getNombre() %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Pedidos -->
    <div class="card mb-5 shadow-sm">
        <div class="card-header bg-primary text-white fw-bold">
            Pedidos Registrados - Polarizados
        </div>
        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>ID Pedido</th>
                        <th>Cliente</th>
                        <th>Material</th>
                        <th>Luz Visible</th>
                        <th>Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
                        if (pedidos != null) {
                            for (Pedido p : pedidos) {
                    %>
                    <tr>
                        <td><%= p.getIdPedido() %></td>
                        <td><%= p.getNombreCliente() %></td>
                        <td><%= p.getMaterial() %></td>
                        <td><%= p.getLuzVisible() %></td>
                        <td><%= p.getFechaPedido() %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Boton volver -->
    <div class="text-center">
        <a href="inicio" class="btn btn-secondary px-4">Volver al inicio</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
