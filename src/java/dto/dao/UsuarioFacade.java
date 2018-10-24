/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto.dao;

import dto.entidad.Usuario;
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

    @PersistenceContext(unitName = "LigaNosVamosV3PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }

    public boolean login(String correo, String pass) {
        Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.correoUsuario= :correoUsuario and u.passUsuario= :passUsuario");
        query.setParameter("correoUsuario", correo);
        query.setParameter("passUsuario", pass);
        return query.getResultList().size() > 0;

    }

}
