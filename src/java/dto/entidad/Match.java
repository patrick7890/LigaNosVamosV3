/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto.entidad;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Patricio
 */
@Entity
@Table(name = "match")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Match.findAll", query = "SELECT m FROM Match m")
    , @NamedQuery(name = "Match.findByIdmatch", query = "SELECT m FROM Match m WHERE m.idmatch = :idmatch")
    , @NamedQuery(name = "Match.findByMatch", query = "SELECT m FROM Match m WHERE m.match = :match")
    , @NamedQuery(name = "Match.findByFechaMatch", query = "SELECT m FROM Match m WHERE m.fechaMatch = :fechaMatch")})
public class Match implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmatch")
    private Integer idmatch;
    @Basic(optional = false)
    @NotNull
    @Column(name = "match")
    private int match;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_match")
    @Temporal(TemporalType.DATE)
    private Date fechaMatch;
    @JoinColumn(name = "equipo_equipo_id", referencedColumnName = "equipo_id")
    @ManyToOne(optional = false)
    private Equipo equipoEquipoId;
    @JoinColumn(name = "liga_liga_id", referencedColumnName = "liga_id")
    @ManyToOne(optional = false)
    private Liga ligaLigaId;

    public Match() {
    }

    public Match(Integer idmatch) {
        this.idmatch = idmatch;
    }

    public Match(Integer idmatch, int match, Date fechaMatch) {
        this.idmatch = idmatch;
        this.match = match;
        this.fechaMatch = fechaMatch;
    }

    public Integer getIdmatch() {
        return idmatch;
    }

    public void setIdmatch(Integer idmatch) {
        this.idmatch = idmatch;
    }

    public int getMatch() {
        return match;
    }

    public void setMatch(int match) {
        this.match = match;
    }

    public Date getFechaMatch() {
        return fechaMatch;
    }

    public void setFechaMatch(Date fechaMatch) {
        this.fechaMatch = fechaMatch;
    }

    public Equipo getEquipoEquipoId() {
        return equipoEquipoId;
    }

    public void setEquipoEquipoId(Equipo equipoEquipoId) {
        this.equipoEquipoId = equipoEquipoId;
    }

    public Liga getLigaLigaId() {
        return ligaLigaId;
    }

    public void setLigaLigaId(Liga ligaLigaId) {
        this.ligaLigaId = ligaLigaId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmatch != null ? idmatch.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Match)) {
            return false;
        }
        Match other = (Match) object;
        if ((this.idmatch == null && other.idmatch != null) || (this.idmatch != null && !this.idmatch.equals(other.idmatch))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.entidad.Match[ idmatch=" + idmatch + " ]";
    }
    
}
