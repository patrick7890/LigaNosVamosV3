/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto.dao;

import dto.entidad.Liga;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Patricio
 */
@Stateless
public class LigaFacade extends AbstractFacade<Liga> {

    @PersistenceContext(unitName = "LigaNosVamosV2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LigaFacade() {
        super(Liga.class);
    }
    public int buscarIdTipo(String nombre) {
        Query query = em.createQuery("select id_tipo_usuario from TipoUsuario where descripcion= :idTipo");
        query.setParameter("idTipo", nombre);

        return query.getFirstResult();
    }
    
    
}
