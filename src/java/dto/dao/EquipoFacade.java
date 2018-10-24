/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto.dao;

import dto.entidad.Equipo;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Patricio
 */
@Stateless
public class EquipoFacade extends AbstractFacade<Equipo> {

    @PersistenceContext(unitName = "LigaNosVamosV3PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EquipoFacade() {
        super(Equipo.class);
    }

    public int buscarPorNombre(String equipo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
