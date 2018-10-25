/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dto.dao.EquipoFacade;
import dto.dao.TipoLigaFacade;
import dto.dao.UsuarioFacade;
import dto.entidad.Equipo;
import dto.entidad.TipoLiga;
import dto.entidad.Usuario;
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
@WebServlet(name = "ServletEquipo", urlPatterns = {"/ServletEquipo"})
public class ServletEquipo extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    @EJB
    private EquipoFacade equipoFacade;
    @EJB
    private TipoLigaFacade TipoLigaFacade;

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
        response.setContentType("text/html;charset=UTF-8");
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
            case "Inscribir":
                inscribir(request, response);
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

            String nombre = request.getParameter("txtNombre");
            int idUsu = Integer.parseInt(request.getParameter("txtidUsu"));
            int tipo = Integer.parseInt(request.getParameter("ddlTipo"));
            byte estado = 0;
            Usuario u = usuarioFacade.find(idUsu);
            TipoLiga t = TipoLigaFacade.find(tipo);
            Equipo e = new Equipo(null, nombre, estado, u, t);

            if (equipoFacade.create(e)) {
                //imagen(request, response, e);

                String mensaje = "<div class='alert alert-success text-center'>Equipo Agregado</div>";
                request.getSession().setAttribute("mensaje", mensaje);

            } else {
                String mensaje = "<div class='alert alert-danger text-center'>No se Pudo Registar</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            }
        } catch (Exception e) {
        } finally {
            response.sendRedirect("Equipos/registro.jsp");
        }

    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("idUsu"));

            Equipo equipo = equipoFacade.find(id);

            if (equipoFacade.remove(equipo)) {
                String mensaje = "<div class='alert alert-success text-center'>Equipo Eliminado</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            } else {
                String mensaje = "<div class='alert alert-danger text-center'>No se Pudo Eliminar al Equipo</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            }
        } catch (Exception e) {
            String mensaje = "<div class='alert alert-danger text-center'>Error inesperado </div>";
            request.getSession().setAttribute("mensaje", mensaje);
        } finally {
            listar(request, response);
        }

    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {

            if (equipoFacade.findAll() != null) {
                request.getSession().setAttribute("listaUsu", equipoFacade.findAll());
            } else {
                String mensaje = "<div class='alert alert-danger text-center'>No se encontraron Equipos</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            }
        } catch (Exception e) {
            String mensaje = "<div class='alert alert-danger text-center'>Error inesperado</div>";
            request.getSession().setAttribute("mensaje", mensaje);
        } finally {
            response.sendRedirect("Equipos/administrar.jsp");
        }

    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) {
//        String nombreEquipo = request.getParameter("txtNombreEquipo");
//            String tipo = request.getParameter("tipo");
//            String nombreUsu = request.getParameter("usu");
//            String liga = request.getParameter("liga");
//            
//            byte estado = Byte.parseByte(request.getParameter("ddlEstado"));
//            
//            Equipo e = new Equipo(nombreEquipo, l, ti, usu, estado);
//            if (dao.buscar(nombreEquipo) != null) {
//                if (dao.actualizar(e)) {
//                    e.setEstadoEquipo(estado);
//                    String mensaje = "<div class='alert alert-success text-center'>Equipo Actualizado</div>";
//                    request.getSession().setAttribute("mensaje", mensaje);
//                } else {
//                    String mensaje = "<div class='alert alert-danger text-center'>No se Pudo Actualizar</div>";
//                    request.getSession().setAttribute("mensaje", mensaje);
//                }
//            } else {
//                String mensaje = "<div class='alert alert-danger text-center'>El correo ya esta registrado</div>";
//                request.getSession().setAttribute("mensaje", mensaje);
//            }
//        } catch (Exception e) {
//            String mensaje = "<div class='alert alert-danger text-center'>Ocurrio un error insesperado" + e.getMessage() + "</div>";
//            request.getSession().setAttribute("mensaje", mensaje);
//        } finally {
//            listar(request, response);
//        }
    }

    private void inscribir(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
