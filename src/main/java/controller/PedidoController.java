package controller;

import dao.GestionDAO;
import model.Cliente;
import model.Pedido;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.*;

@WebServlet("/servicio")
public class PedidoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        request.setAttribute("tipo", tipo);

        if ("logotipos".equals(tipo)) {
            request.getRequestDispatcher("/formLogotipo.jsp").forward(request, response);
        } else if ("polarizado".equals(tipo)) {
            request.getRequestDispatcher("/formPolarizado.jsp").forward(request, response);
        } else if ("instalaciones".equals(tipo)) {
            request.getRequestDispatcher("/formInstalaciones.jsp").forward(request, response);
        } else if ("reportes".equals(tipo)) {
            GestionDAO dao = new GestionDAO();
            request.setAttribute("clientes", dao.obtenerClientes());
            request.setAttribute("pedidos", dao.obtenerPedidos());
            request.setAttribute("pedidosLogotipo", dao.obtenerPedidosLogotipo());
            request.setAttribute("pedidosInstalacion", dao.obtenerPedidosInstalacion());
            request.getRequestDispatcher("/reportes.jsp").forward(request, response);
        }   
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String tipo = request.getParameter("tipo");

        if ("logotipos".equals(tipo)) {
            Cliente cliente = new Cliente();
            cliente.setNombre(request.getParameter("nombre"));
            GestionDAO dao = new GestionDAO();
            int idCliente = dao.guardarCliente(cliente);

            PedidoLogotipo pedido = new PedidoLogotipo();
            pedido.setIdCliente(idCliente);
            pedido.setServicioSeleccionado(request.getParameter("opcionLogotipo"));
            dao.guardarPedidoLogotipo(pedido);

            request.getRequestDispatcher("/confirmacionLogotipo.jsp").forward(request, response);

        } else if ("instalaciones".equals(tipo)) {
            Cliente cliente = new Cliente();
            cliente.setNombre(request.getParameter("nombre"));
            GestionDAO dao = new GestionDAO();
            int idCliente = dao.guardarCliente(cliente);

            PedidoInstalacion pedido = new PedidoInstalacion();
            pedido.setIdCliente(idCliente);
            pedido.setServicioSeleccionado(request.getParameter("opcionInstalacion"));
            dao.guardarPedidoInstalacion(pedido);

            request.getRequestDispatcher("/confirmacionInstalaciones.jsp").forward(request, response);  
                
        } else if ("polarizado".equals(tipo)) {
            Cliente cliente = new Cliente();
            cliente.setNombre(request.getParameter("nombre"));
            GestionDAO dao = new GestionDAO();
            int idCliente = dao.guardarCliente(cliente);

            Pedido pedido = new Pedido();
            pedido.setMaterial(request.getParameter("material"));
            pedido.setLuzVisible(request.getParameter("luzVisible"));
            pedido.setIdCliente(idCliente);
            dao.guardarPedido(pedido);
            request.getRequestDispatcher("/confirmacionPolarizado.jsp").forward(request, response);
        }
    }
}