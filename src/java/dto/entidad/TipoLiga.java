/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto.entidad;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Patricio
 */
@Entity
@Table(name = "tipo_liga")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoLiga.findAll", query = "SELECT t FROM TipoLiga t")
    , @NamedQuery(name = "TipoLiga.findByIdtipoLiga", query = "SELECT t FROM TipoLiga t WHERE t.idtipoLiga = :idtipoLiga")
    , @NamedQuery(name = "TipoLiga.findByDescripcion", query = "SELECT t FROM TipoLiga t WHERE t.descripcion = :descripcion")})
public class TipoLiga implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipo_liga")
    private Integer idtipoLiga;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "descripcion")
    private String descripcion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoLigaIdtipoLiga")
    private List<Liga> ligaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoLigaIdtipoLiga")
    private List<Equipo> equipoList;

    public TipoLiga() {
    }

    public TipoLiga(Integer idtipoLiga) {
        this.idtipoLiga = idtipoLiga;
    }

    public TipoLiga(Integer idtipoLiga, String descripcion) {
        this.idtipoLiga = idtipoLiga;
        this.descripcion = descripcion;
    }

    public Integer getIdtipoLiga() {
        return idtipoLiga;
    }

    public void setIdtipoLiga(Integer idtipoLiga) {
        this.idtipoLiga = idtipoLiga;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public List<Liga> getLigaList() {
        return ligaList;
    }

    public void setLigaList(List<Liga> ligaList) {
        this.ligaList = ligaList;
    }

    @XmlTransient
    public List<Equipo> getEquipoList() {
        return equipoList;
    }

    public void setEquipoList(List<Equipo> equipoList) {
        this.equipoList = equipoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoLiga != null ? idtipoLiga.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoLiga)) {
            return false;
        }
        TipoLiga other = (TipoLiga) object;
        if ((this.idtipoLiga == null && other.idtipoLiga != null) || (this.idtipoLiga != null && !this.idtipoLiga.equals(other.idtipoLiga))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.entidad.TipoLiga[ idtipoLiga=" + idtipoLiga + " ]";
    }
    
}
