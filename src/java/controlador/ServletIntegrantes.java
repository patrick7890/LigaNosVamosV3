/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dto.dao.IntegrantesFacade;
import dto.dao.EquipoFacade;
import dto.entidad.Equipo;
import dto.entidad.Integrantes;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lennon
 */
@WebServlet(name = "ServletIntegrantes", urlPatterns = {"/ServletIntegrantes"})
public class ServletIntegrantes extends HttpServlet {

    @EJB
    private EquipoFacade equipoFacade;

    @EJB
    private IntegrantesFacade integranteFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String opcion = request.getParameter("btnAccion");

        switch (opcion) {
            case "Registar":
                agregar(request, response);
                break;
            case "Eliminar":
                eliminar(request, response);
                break;
            case "Listar":
                listar(request, response);
                break;
            case "Actualizar":
                actualizar(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int equipo = Integer.parseInt(request.getParameter("ddlEquipo"));
            Equipo e = equipoFacade.find(equipo);

            for (int i = 1; i < 4; i++) {
                String rut = request.getParameter("txtRut" + i);
                String nombre = request.getParameter("txtNombre" + i);
                String nick = request.getParameter("txtNick" + i);
                byte estado = 1;
                if (rut != "" || nombre != "" || nick != "") {

                    Integrantes in = new Integrantes(null, rut, nombre, nick, estado, e);

                    if (integranteFacade.create(in)) {
                        //imagen(request, response, in);

                        String mensaje = "<div class='alert alert-success text-center'>Intengrante Agregado</div>";
                        request.getSession().setAttribute("mensaje", mensaje);

                    } else {
                        String mensaje = "<div class='alert alert-danger text-center'>No se Pudo Registar</div>";
                        request.getSession().setAttribute("mensaje", mensaje);
                    }
                }
            }
        } catch (Exception e) {
            String mensaje = "<div class='alert alert-danger text-center'>Ocurrio un error insesperado " + e.getMessage() + "</div>";
            request.getSession().setAttribute("mensaje", mensaje);

        } finally {
            response.sendRedirect("Integrantes/registro.jsp");
        }

    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            String rut = request.getParameter("txtRut");
            String nombre = request.getParameter("txtNombre");
            String nick = request.getParameter("txtNick");
            byte estado = Byte.parseByte(request.getParameter("ddlEstado"));
            int equipo = Integer.parseInt(request.getParameter("ddlEquipo"));
            Integer id = Integer.parseInt(request.getParameter("id"));
            Equipo e = equipoFacade.find(equipo);

            Integrantes in = new Integrantes(id, rut, nombre, nick, estado, e);

            if (integranteFacade.remove(in)) {
                //imagen(request, response, in);

                String mensaje = "<div class='alert alert-success text-center'>Intengrante Eliminado</div>";
                request.getSession().setAttribute("mensaje", mensaje);

            } else {
                String mensaje = "<div class='alert alert-danger text-center'>No se Pudo Eliminar</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            }

        } catch (Exception e) {
            String mensaje = "<div class='alert alert-danger text-center'>Ocurrio un error insesperado " + e.getMessage() + "</div>";
            request.getSession().setAttribute("mensaje", mensaje);

        } finally {
            response.sendRedirect("Integrantes/administrar.jsp");
        }

    }

    private void listar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            String rut = request.getParameter("txtRut");
            String nombre = request.getParameter("txtNombre");
            String nick = request.getParameter("txtNick");
            byte estado = Byte.parseByte(request.getParameter("ddlEstado"));
            int equipo = Integer.parseInt(request.getParameter("ddlEquipo"));
            Integer id = Integer.parseInt(request.getParameter("id"));
            Equipo e = equipoFacade.find(equipo);

            if (rut != "" || nombre != "" || nick != "") {

                Integrantes in = new Integrantes(id, rut, nombre, nick, estado, e);

                if (integranteFacade.edit(in)) {
                    //imagen(request, response, in);

                    String mensaje = "<div class='alert alert-success text-center'>Intengrante Actualizado</div>";
                    request.getSession().setAttribute("mensaje", mensaje);

                } else {
                    String mensaje = "<div class='alert alert-danger text-center'>No se Pudo Actualizar</div>";
                    request.getSession().setAttribute("mensaje", mensaje);
                }

            }
        } catch (Exception e) {
            String mensaje = "<div class='alert alert-danger text-center'>Ocurrio un error insesperado " + e.getMessage() + "</div>";
            request.getSession().setAttribute("mensaje", mensaje);

        } finally {
            response.sendRedirect("Integrantes/administrar.jsp");
        }

    }

}
