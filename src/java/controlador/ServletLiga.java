/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dto.dao.LigaFacade;
import dto.dao.TipoLigaFacade;
import dto.entidad.Liga;
import dto.entidad.TipoLiga;
import java.io.IOException;

import java.sql.Date;
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
@WebServlet(name = "ServletLiga", urlPatterns = {"/ServletLiga"})
public class ServletLiga extends HttpServlet {

    @EJB
    private LigaFacade ligaFacade;
    @EJB
    private TipoLigaFacade TligaFacade;

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
            case "Iniciar":
                iniciarLiga(request, response);
                break;
            default:
                redirectLiga(request, response);
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
            String nombreLiga = request.getParameter("txtNombreLiga");
            Date fechaini = Date.valueOf(request.getParameter("dateFechaIni"));
            Date fechater = Date.valueOf(request.getParameter("dateFechaTer"));
            String lugar = request.getParameter("txtLugar");
            int tipo = Integer.parseInt(request.getParameter("ddlTipo"));

            TipoLiga t = TligaFacade.find(tipo);

            Liga l = new Liga(null, nombreLiga, fechaini, fechater, lugar, t);
            if (ligaFacade.create(l)) {
                String mensaje = "<div class='alert alert-success text-center'>Liga Agregado</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            } else {
                String mensaje = "<div class='alert alert-danger text-center'>No se Pudo Registar</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            }
            /*
            String hora = request.getParameter("HoraIni") + ":00";
            String fecha = request.getParameter("dateFechaIni");
            Time h = Time.valueOf(hora);
            Date f=Date.valueOf(fecha);
            String fullDate = fecha + " " + hora;
            Long f=Date.parse(fullDate);
            mensaje = f;
            request.getSession().setAttribute("mensaje", mensaje);*/
        } catch (Exception e) {
            String mensaje = "<div class='alert alert-danger text-center'>Ocurrio un error insesperado " + e.getMessage() + "</div>";
            request.getSession().setAttribute("mensaje", mensaje);
        } finally {
            response.sendRedirect("Ligas/crearLiga.jsp");
        }

    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("idUsu"));
            dto.entidad.Liga liga = ligaFacade.find(id);
            if (ligaFacade.remove(liga)) {
                String mensaje = "<div class='alert alert-success text-center'>Liga Eliminado</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            } else {
                String mensaje = "<div class='alert alert-danger text-center'>No se Pudo Eliminar al Liga</div>";
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

            if (ligaFacade.findAll() != null) {
                request.getSession().setAttribute("listaUsu", ligaFacade.findAll());
            } else {
                String mensaje = "<div class='alert alert-danger text-center'>No se encontraron Liga</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            }
        } catch (Exception e) {
            String mensaje = "<div class='alert alert-danger text-center'>Error inesperado</div>";
            request.getSession().setAttribute("mensaje", mensaje);
        } finally {
            response.sendRedirect("Index.jsp");
        }
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {

            int var = Integer.parseInt(request.getParameter("txt"));
            String nombreLiga = request.getParameter("txtNombreLiga");
            Date fechaini = Date.valueOf(request.getParameter("dateFechaIni"));
            Date fechater = Date.valueOf(request.getParameter("dateFechaTer"));
            String lugar = request.getParameter("txtLugar");
            int tipo = Integer.parseInt(request.getParameter("ddlTipo"));

            TipoLiga t = TligaFacade.find(tipo);
            Liga l = new Liga(null, nombreLiga, fechaini, fechater, lugar, t);

            if (ligaFacade.edit(l)) {
                String mensaje = "<div class='alert alert-success text-center'>Liga Actualizado</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            } else {
                String mensaje = "<div class='alert alert-danger text-center'>No se Pudo Actualizar</div>";
                request.getSession().setAttribute("mensaje", mensaje);
            }

        } catch (Exception e) {
            String mensaje = "<div class='alert alert-danger text-center'>Ocurrio un error insesperado" + e.getMessage() + "</div>";
            request.getSession().setAttribute("mensaje", mensaje);
        } finally {
            listar(request, response);
        }
    }

    private void redirectLiga(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String Liga = request.getParameter("idLiga");
            request.getSession().setAttribute("idliga", Liga);
            response.sendRedirect("Torneo/bracket2.jsp");
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
    }

    private void iniciarLiga(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String Liga = request.getParameter("idLiga");
            request.getSession().setAttribute("idliga", Liga);
            response.sendRedirect("Torneo/IniciarTorneo.jsp");
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
    }

}
