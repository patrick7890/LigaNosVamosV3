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
    public TipoUsuario buscarIdTipo(int tipo){
        Query query = em.createQuery("select * from TipoUsuario where id_tipo_usuario= :idTipo");
        query.setParameter("idTipo",tipo);
        TipoUsuario t=new TipoUsuario();
        List<TipoUsuario> des =query.getResultList();
        for (TipoUsuario de : des) {
            t.setIdTipoUsuario(de.getIdTipoUsuario());
            t.setDescripcion(de.getDescripcion());
        }
        return t;
    }
}
