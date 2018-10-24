/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto.dao;

import dto.entidad.Usuario;
import dto.entidad.TipoUsuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Patricio
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "LigaNosVamosV2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }

    public TipoUsuario buscarTipo(int tipo) {
        Query query = em.createQuery("SELECT t FROM TipoUsuario t WHERE t.idTipoUsuario= :idTipo");
        query.setParameter("idTipo", tipo);
        TipoUsuario t = (TipoUsuario) query.getSingleResult();
        return t;
    }

    public Usuario login(String correo, String pass) {
        try {
            Query query=em.createNamedQuery("Usuario.Login");
            query.setParameter("correoUsuario", correo);
            query.setParameter("passUsuario", pass);
            Usuario u = (Usuario) query.getSingleResult();
            return u;
        } catch (Exception e) {
            return null;
        }

    }
}
