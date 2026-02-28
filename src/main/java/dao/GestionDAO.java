package dao;

import connection.ConexionDB;
import model.Cliente;
import model.Pedido;
import model.Servicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GestionDAO {

    // Obtener todos los servicios
    public List<Servicio> obtenerServicios() {
        List<Servicio> lista = new ArrayList<>();
        try {
            Connection conn = ConexionDB.getConexion();
            String sql = "SELECT * FROM servicios";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Servicio s = new Servicio();
                s.setIdServicio(rs.getInt("idServicio"));
                s.setLogotipos(rs.getString("logotipos"));
                s.setPolarizado(rs.getString("polarizado"));
                s.setInstalaciones(rs.getString("instalaciones"));
                lista.add(s);
            }
        } catch (Exception e) {
            System.out.println("Error al obtener servicios: " + e.getMessage());
        }
        return lista;
    }

    // Guardar cliente y retornar su ID generado
    public int guardarCliente(Cliente cliente) {
        int idGenerado = -1;
        try {
            Connection conn = ConexionDB.getConexion();
            String sql = "INSERT INTO clientes (nombre) VALUES (?)";
            PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, cliente.getNombre());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idGenerado = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error al guardar cliente: " + e.getMessage());
        }
        return idGenerado;
    }

    // Guardar pedido
    public void guardarPedido(Pedido pedido) {
        try {
            Connection conn = ConexionDB.getConexion();
            String sql = "INSERT INTO pedidos (material, luzVisible, idCliente) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pedido.getMaterial());
            ps.setString(2, pedido.getLuzVisible());
            ps.setInt(3, pedido.getIdCliente());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al guardar pedido: " + e.getMessage());
        }
    }
    
    public List<Cliente> obtenerClientes() {
        List<Cliente> lista = new ArrayList<>();
        try {
            Connection conn = ConexionDB.getConexion();
            String sql = "SELECT * FROM clientes";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setIdCliente(rs.getInt("idCliente"));
                c.setNombre(rs.getString("nombre"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error al obtener clientes: " + e.getMessage());
        }
        return lista;
    }

    public List<Pedido> obtenerPedidos() {
        List<Pedido> lista = new ArrayList<>();
        try {
            Connection conn = ConexionDB.getConexion();
            String sql = "SELECT p.idPedido, p.material, p.luzVisible, p.fechaPedido, c.nombre " +
                         "FROM pedidos p JOIN clientes c ON p.idCliente = c.idCliente";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pedido p = new Pedido();
                p.setIdPedido(rs.getInt("idPedido"));
                p.setMaterial(rs.getString("material"));
                p.setLuzVisible(rs.getString("luzVisible"));
                p.setFechaPedido(rs.getString("fechaPedido"));
                p.setNombreCliente(rs.getString("nombre"));
                lista.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error al obtener pedidos: " + e.getMessage());
        }
        return lista;
    }
    
}