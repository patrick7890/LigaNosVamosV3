/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto.entidad;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Patricio
 */
@Entity
@Table(name = "liga")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Liga.findAll", query = "SELECT l FROM Liga l")
    , @NamedQuery(name = "Liga.findByLigaId", query = "SELECT l FROM Liga l WHERE l.ligaId = :ligaId")
    , @NamedQuery(name = "Liga.findByNombreLiga", query = "SELECT l FROM Liga l WHERE l.nombreLiga = :nombreLiga")
    , @NamedQuery(name = "Liga.findByFechaInicio", query = "SELECT l FROM Liga l WHERE l.fechaInicio = :fechaInicio")
    , @NamedQuery(name = "Liga.findByFechaTermino", query = "SELECT l FROM Liga l WHERE l.fechaTermino = :fechaTermino")
    , @NamedQuery(name = "Liga.findByLugar", query = "SELECT l FROM Liga l WHERE l.lugar = :lugar")
    , @NamedQuery(name = "Liga.findByGanador", query = "SELECT l FROM Liga l WHERE l.ganador = :ganador")})
public class Liga implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "liga_id")
    private Integer ligaId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre_liga")
    private String nombreLiga;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_inicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_termino")
    @Temporal(TemporalType.DATE)
    private Date fechaTermino;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "lugar")
    private String lugar;
    @Size(max = 45)
    @Column(name = "ganador")
    private String ganador;
    @JoinColumn(name = "imagen_id_imagen", referencedColumnName = "id_imagen")
    @ManyToOne
    private Imagen imagenIdImagen;
    @JoinColumn(name = "tipo_liga_idtipo_liga", referencedColumnName = "idtipo_liga")
    @ManyToOne(optional = false)
    private TipoLiga tipoLigaIdtipoLiga;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ligaLigaId")
    private List<Equipo> equipoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ligaLigaId")
    private List<Match> matchList;

    public Liga() {
    }

    public Liga(Integer ligaId) {
        this.ligaId = ligaId;
    }

    public Liga(Integer ligaId, String nombreLiga, Date fechaInicio, Date fechaTermino, String lugar) {
        this.ligaId = ligaId;
        this.nombreLiga = nombreLiga;
        this.fechaInicio = fechaInicio;
        this.fechaTermino = fechaTermino;
        this.lugar = lugar;
    }

    public Liga(String nombreLiga, Date fechaini, Date fechater, String lugar) {
        this.nombreLiga = nombreLiga;
        this.fechaInicio = fechaini;
        this.fechaTermino = fechater;
        this.lugar = lugar;
    }

    public Liga(Integer id, String nombreLiga,Date fechaini, Date fechater, String lugar, TipoLiga t) {
        this.ligaId = id;
        this.nombreLiga = nombreLiga;
        this.fechaInicio = fechaini;
        this.fechaTermino = fechater;
        this.lugar = lugar;
        this.tipoLigaIdtipoLiga=t;
    }

    public Integer getLigaId() {
        return ligaId;
    }

    public void setLigaId(Integer ligaId) {
        this.ligaId = ligaId;
    }

    public String getNombreLiga() {
        return nombreLiga;
    }

    public void setNombreLiga(String nombreLiga) {
        this.nombreLiga = nombreLiga;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaTermino() {
        return fechaTermino;
    }

    public void setFechaTermino(Date fechaTermino) {
        this.fechaTermino = fechaTermino;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getGanador() {
        return ganador;
    }

    public void setGanador(String ganador) {
        this.ganador = ganador;
    }

    public Imagen getImagenIdImagen() {
        return imagenIdImagen;
    }

    public void setImagenIdImagen(Imagen imagenIdImagen) {
        this.imagenIdImagen = imagenIdImagen;
    }

    public TipoLiga getTipoLigaIdtipoLiga() {
        return tipoLigaIdtipoLiga;
    }

    public void setTipoLigaIdtipoLiga(TipoLiga tipoLigaIdtipoLiga) {
        this.tipoLigaIdtipoLiga = tipoLigaIdtipoLiga;
    }

    @XmlTransient
    public List<Equipo> getEquipoList() {
        return equipoList;
    }

    public void setEquipoList(List<Equipo> equipoList) {
        this.equipoList = equipoList;
    }

    @XmlTransient
    public List<Match> getMatchList() {
        return matchList;
    }

    public void setMatchList(List<Match> matchList) {
        this.matchList = matchList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ligaId != null ? ligaId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Liga)) {
            return false;
        }
        Liga other = (Liga) object;
        if ((this.ligaId == null && other.ligaId != null) || (this.ligaId != null && !this.ligaId.equals(other.ligaId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.entidad.Liga[ ligaId=" + ligaId + " ]";
    }
    
}
