<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Cliente" %>
<%@ page import="model.Pedido" %>
<%@ page import="model.PedidoLogotipo" %>
<%@ page import="model.PedidoInstalacion" %>
<!DOCTYPE html>
<html>
<head>
    <title>Actualizar Reportes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">

    <h2 class="mb-4 text-center fw-bold">Actualizar Reportes</h2>

    <!-- Clientes -->
    <div class="card mb-5 shadow-sm">
        <div class="card-header bg-success text-white fw-bold">Clientes Registrados</div>
        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-dark">
                    <tr><th>ID</th><th>Nombre</th><th>Guardar</th><th>Eliminar</th></tr>
                </thead>
                <tbody>
                <%
                    List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
                    if (clientes != null) {
                        for (Cliente c : clientes) {
                %>
                <tr>
                    <form action="servicio" method="post">
                        <input type="hidden" name="tipo" value="actualizarCliente">
                        <input type="hidden" name="idCliente" value="<%= c.getIdCliente() %>">
                        <td><%= c.getIdCliente() %></td>
                        <td><input type="text" name="nombre" value="<%= c.getNombre() %>" class="form-control form-control-sm"></td>
                        <td><button type="submit" class="btn btn-sm btn-success">Guardar</button></td>
                    </form>
                    <form action="servicio" method="post" onsubmit="return confirm('¿Seguro que deseas eliminar este cliente y todos sus pedidos?')">
                        <input type="hidden" name="tipo" value="eliminarCliente">
                        <input type="hidden" name="idCliente" value="<%= c.getIdCliente() %>">
                        <td><button type="submit" class="btn btn-sm btn-danger">Eliminar</button></td>
                    </form>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Pedidos Polarizado -->
<div class="card mb-5 shadow-sm">
    <div class="card-header bg-primary text-white fw-bold">Pedidos - Polarizados</div>
    <div class="card-body p-0">
        <table class="table table-striped table-hover mb-0">
            <thead class="table-dark">
                <tr><th>ID</th><th>Cliente</th><th>Material</th><th>Luz Visible</th><th>Fecha</th><th>Acción</th></tr>
            </thead>
            <tbody>
            <%
                List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
                if (pedidos != null) {
                    for (Pedido p : pedidos) {
            %>
            <tr>
                <form action="servicio" method="post">
                    <input type="hidden" name="tipo" value="actualizarPolarizado">
                    <input type="hidden" name="idPedido" value="<%= p.getIdPedido() %>">
                    <td><%= p.getIdPedido() %></td>
                    <td><%= p.getNombreCliente() %></td>
                    <td>
                        <select name="material" class="form-select form-select-sm">
                            <option value="nanoCarbono" <%= "nanoCarbono".equals(p.getMaterial()) ? "selected" : "" %>>nanoCarbono</option>
                            <option value="nanoCeramico" <%= "nanoCeramico".equals(p.getMaterial()) ? "selected" : "" %>>nanoCeramico</option>
                            <option value="Crystalline" <%= "Crystalline".equals(p.getMaterial()) ? "selected" : "" %>>Crystalline</option>
                        </select>
                    </td>
                    <td>
                        <select name="luzVisible" class="form-select form-select-sm">
                            <option value="5%" <%= "5%".equals(p.getLuzVisible()) ? "selected" : "" %>>5%</option>
                            <option value="20%" <%= "20%".equals(p.getLuzVisible()) ? "selected" : "" %>>20%</option>
                            <option value="35%" <%= "35%".equals(p.getLuzVisible()) ? "selected" : "" %>>35%</option>
                            <option value="50%" <%= "50%".equals(p.getLuzVisible()) ? "selected" : "" %>>50%</option>
                        </select>
                    </td>
                    <td><%= p.getFechaPedido() %></td>
                    <td><button type="submit" class="btn btn-sm btn-primary">Guardar</button></td>
                </form>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>


    <!-- Pedidos Logotipo -->
    <div class="card mb-5 shadow-sm">
        <div class="card-header bg-success text-white fw-bold">Pedidos - Logotipos</div>
        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-dark">
                    <tr><th>ID</th><th>Cliente</th><th>Servicio</th><th>Fecha</th><th>Acción</th></tr>
                </thead>
                <tbody>
                <%
                    List<PedidoLogotipo> pedidosLogotipo = (List<PedidoLogotipo>) request.getAttribute("pedidosLogotipo");
                    if (pedidosLogotipo != null) {
                        for (PedidoLogotipo pl : pedidosLogotipo) {
                %>
                <tr>
                    <form action="servicio" method="post">
                        <input type="hidden" name="tipo" value="actualizarLogotipo">
                        <input type="hidden" name="idPedidoLogotipo" value="<%= pl.getIdPedidoLogotipo() %>">
                        <td><%= pl.getIdPedidoLogotipo() %></td>
                        <td><%= pl.getNombreCliente() %></td>
                        <td>
                            <select name="servicioSeleccionado" class="form-select form-select-sm">
                                <option value="Placa Provisional" <%= "Placa Provisional".equals(pl.getServicioSeleccionado()) ? "selected" : "" %>>Placa Provisional</option>
                                <option value="Tapasol" <%= "Tapasol".equals(pl.getServicioSeleccionado()) ? "selected" : "" %>>Tapasol</option>
                                <option value="Forrado de faros" <%= "Forrado de faros".equals(pl.getServicioSeleccionado()) ? "selected" : "" %>>Forrado de faros</option>
                                <option value="Forrado de techo" <%= "Forrado de techo".equals(pl.getServicioSeleccionado()) ? "selected" : "" %>>Forrado de techo</option>
                                <option value="Forrado de pisaderas" <%= "Forrado de pisaderas".equals(pl.getServicioSeleccionado()) ? "selected" : "" %>>Forrado de pisaderas</option>
                                <option value="Manijas" <%= "Manijas".equals(pl.getServicioSeleccionado()) ? "selected" : "" %>>Manijas</option>
                            </select>
                        </td>
                        <td><%= pl.getFechaPedido() %></td>
                        <td><button type="submit" class="btn btn-sm btn-success">Guardar</button></td>
                    </form>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Pedidos Instalaciones -->
    <div class="card mb-5 shadow-sm">
        <div class="card-header bg-warning fw-bold">Pedidos - Instalaciones</div>
        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-dark">
                    <tr><th>ID</th><th>Cliente</th><th>Servicio</th><th>Fecha</th><th>Acción</th></tr>
                </thead>
                <tbody>
                <%
                    List<PedidoInstalacion> pedidosInstalacion = (List<PedidoInstalacion>) request.getAttribute("pedidosInstalacion");
                    if (pedidosInstalacion != null) {
                        for (PedidoInstalacion pi : pedidosInstalacion) {
                %>
                <tr>
                    <form action="servicio" method="post">
                        <input type="hidden" name="tipo" value="actualizarInstalacion">
                        <input type="hidden" name="idPedidoInstalacion" value="<%= pi.getIdPedidoInstalacion() %>">
                        <td><%= pi.getIdPedidoInstalacion() %></td>
                        <td><%= pi.getNombreCliente() %></td>
                        <td>
                            <select name="servicioSeleccionado" class="form-select form-select-sm">
                                <option value="Tapizado de Techo" <%= "Tapizado de Techo".equals(pi.getServicioSeleccionado()) ? "selected" : "" %>>Tapizado de Techo</option>
                                <option value="Tapizado de Piso" <%= "Tapizado de Piso".equals(pi.getServicioSeleccionado()) ? "selected" : "" %>>Tapizado de Piso</option>
                                <option value="Confeccion de Fundas" <%= "Confeccion de Fundas".equals(pi.getServicioSeleccionado()) ? "selected" : "" %>>Confeccion de Fundas</option>
                                <option value="Instalacion de Radio" <%= "Instalacion de Radio".equals(pi.getServicioSeleccionado()) ? "selected" : "" %>>Instalacion de Radio</option>
                                <option value="Instalacion de GPS" <%= "Instalacion de GPS".equals(pi.getServicioSeleccionado()) ? "selected" : "" %>>Instalacion de GPS</option>
                            </select>
                        </td>
                        <td><%= pi.getFechaPedido() %></td>
                        <td><button type="submit" class="btn btn-sm btn-warning">Guardar</button></td>
                    </form>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="text-center">
        <a href="servicio?tipo=reportes" class="btn btn-secondary px-4">Volver a Reportes</a>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>