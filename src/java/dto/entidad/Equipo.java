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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "equipo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Equipo.findAll", query = "SELECT e FROM Equipo e")
    , @NamedQuery(name = "Equipo.findByEquipoId", query = "SELECT e FROM Equipo e WHERE e.equipoId = :equipoId")
    , @NamedQuery(name = "Equipo.findByNombreEquipo", query = "SELECT e FROM Equipo e WHERE e.nombreEquipo = :nombreEquipo")
    , @NamedQuery(name = "Equipo.findByEstadoEquipo", query = "SELECT e FROM Equipo e WHERE e.estadoEquipo = :estadoEquipo")})
public class Equipo implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "equipoEquipoId")
    private List<Match> matchList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "equipoEquipoId")
    private List<Integrantes> integrantesList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "equipo_id")
    private Integer equipoId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre_equipo")
    private String nombreEquipo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "estado_equipo")
    private short estadoEquipo;
    @JoinColumn(name = "imagen_id_imagen", referencedColumnName = "id_imagen")
    @ManyToOne
    private Imagen imagenIdImagen;
    @JoinColumn(name = "liga_liga_id", referencedColumnName = "liga_id")
    @ManyToOne
    private Liga ligaLigaId;
    @JoinColumn(name = "tipo_liga_idtipo_liga", referencedColumnName = "idtipo_liga")
    @ManyToOne(optional = false)
    private TipoLiga tipoLigaIdtipoLiga;
    @JoinColumn(name = "usuario_usuario_id", referencedColumnName = "usuario_id")
    @ManyToOne(optional = false)
    private Usuario usuarioUsuarioId;

    public Equipo() {
    }

    public Equipo(Integer equipoId) {
        this.equipoId = equipoId;
    }

    public Equipo(Integer equipoId, String nombreEquipo, short estadoEquipo) {
        this.equipoId = equipoId;
        this.nombreEquipo = nombreEquipo;
        this.estadoEquipo = estadoEquipo;
    }

    public Equipo(Integer id, String nombre, byte estado, Usuario u, TipoLiga t) {
        this.equipoId = id;
        this.nombreEquipo = nombre;
        this.estadoEquipo = estado;
        this.usuarioUsuarioId = u;
        this.tipoLigaIdtipoLiga = t;
    }

    public Integer getEquipoId() {
        return equipoId;
    }

    public void setEquipoId(Integer equipoId) {
        this.equipoId = equipoId;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }

    public short getEstadoEquipo() {
        return estadoEquipo;
    }

    public void setEstadoEquipo(short estadoEquipo) {
        this.estadoEquipo = estadoEquipo;
    }

    public Imagen getImagenIdImagen() {
        return imagenIdImagen;
    }

    public void setImagenIdImagen(Imagen imagenIdImagen) {
        this.imagenIdImagen = imagenIdImagen;
    }

    public Liga getLigaLigaId() {
        return ligaLigaId;
    }

    public void setLigaLigaId(Liga ligaLigaId) {
        this.ligaLigaId = ligaLigaId;
    }

    public TipoLiga getTipoLigaIdtipoLiga() {
        return tipoLigaIdtipoLiga;
    }

    public void setTipoLigaIdtipoLiga(TipoLiga tipoLigaIdtipoLiga) {
        this.tipoLigaIdtipoLiga = tipoLigaIdtipoLiga;
    }

    public Usuario getUsuarioUsuarioId() {
        return usuarioUsuarioId;
    }

    public void setUsuarioUsuarioId(Usuario usuarioUsuarioId) {
        this.usuarioUsuarioId = usuarioUsuarioId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (equipoId != null ? equipoId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Equipo)) {
            return false;
        }
        Equipo other = (Equipo) object;
        if ((this.equipoId == null && other.equipoId != null) || (this.equipoId != null && !this.equipoId.equals(other.equipoId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.entidad.Equipo[ equipoId=" + equipoId + " ]";
    }

    @XmlTransient
    public List<Match> getMatchList() {
        return matchList;
    }

    public void setMatchList(List<Match> matchList) {
        this.matchList = matchList;
    }

    @XmlTransient
    public List<Integrantes> getIntegrantesList() {
        return integrantesList;
    }

    public void setIntegrantesList(List<Integrantes> integrantesList) {
        this.integrantesList = integrantesList;
    }

}
