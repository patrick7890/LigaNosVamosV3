/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto.entidad;

import java.io.Serializable;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Patricio
 */
@Entity
@Table(name = "integrantes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Integrantes.findAll", query = "SELECT i FROM Integrantes i")
    , @NamedQuery(name = "Integrantes.findByIntegranteId", query = "SELECT i FROM Integrantes i WHERE i.integranteId = :integranteId")
    , @NamedQuery(name = "Integrantes.findByRutIntegrante", query = "SELECT i FROM Integrantes i WHERE i.rutIntegrante = :rutIntegrante")
    , @NamedQuery(name = "Integrantes.findByNombreIntegrante", query = "SELECT i FROM Integrantes i WHERE i.nombreIntegrante = :nombreIntegrante")
    , @NamedQuery(name = "Integrantes.findByNick", query = "SELECT i FROM Integrantes i WHERE i.nick = :nick")
    , @NamedQuery(name = "Integrantes.findByEstadoInt", query = "SELECT i FROM Integrantes i WHERE i.estadoInt = :estadoInt")})
public class Integrantes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "integrante_id")
    private Integer integranteId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 13)
    @Column(name = "rut_integrante")
    private String rutIntegrante;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre_integrante")
    private String nombreIntegrante;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nick")
    private String nick;
    @Basic(optional = false)
    @NotNull
    @Column(name = "estado_int")
    private short estadoInt;
    @JoinColumn(name = "equipo_equipo_id", referencedColumnName = "equipo_id")
    @ManyToOne(optional = false)
    private Equipo equipoEquipoId;
    @JoinColumn(name = "imagen_id_imagen", referencedColumnName = "id_imagen")
    @ManyToOne
    private Imagen imagenIdImagen;

    public Integrantes() {
    }

    public Integrantes(Integer integranteId) {
        this.integranteId = integranteId;
    }

    public Integrantes(Integer integranteId, String rutIntegrante, String nombreIntegrante, String nick, short estadoInt) {
        this.integranteId = integranteId;
        this.rutIntegrante = rutIntegrante;
        this.nombreIntegrante = nombreIntegrante;
        this.nick = nick;
        this.estadoInt = estadoInt;
    }

    public Integrantes(Integer integranteId, String rut, String nombre, String nick, byte estado, Equipo e) {
        this.integranteId = integranteId;
        this.rutIntegrante = rut;
        this.nombreIntegrante = nombre;
        this.nick = nick;
        this.estadoInt = estado;
        this.equipoEquipoId = e;
    }

    public Integer getIntegranteId() {
        return integranteId;
    }

    public void setIntegranteId(Integer integranteId) {
        this.integranteId = integranteId;
    }

    public String getRutIntegrante() {
        return rutIntegrante;
    }

    public void setRutIntegrante(String rutIntegrante) {
        this.rutIntegrante = rutIntegrante;
    }

    public String getNombreIntegrante() {
        return nombreIntegrante;
    }

    public void setNombreIntegrante(String nombreIntegrante) {
        this.nombreIntegrante = nombreIntegrante;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public short getEstadoInt() {
        return estadoInt;
    }

    public void setEstadoInt(short estadoInt) {
        this.estadoInt = estadoInt;
    }

    public Equipo getEquipoEquipoId() {
        return equipoEquipoId;
    }

    public void setEquipoEquipoId(Equipo equipoEquipoId) {
        this.equipoEquipoId = equipoEquipoId;
    }

    public Imagen getImagenIdImagen() {
        return imagenIdImagen;
    }

    public void setImagenIdImagen(Imagen imagenIdImagen) {
        this.imagenIdImagen = imagenIdImagen;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (integranteId != null ? integranteId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Integrantes)) {
            return false;
        }
        Integrantes other = (Integrantes) object;
        if ((this.integranteId == null && other.integranteId != null) || (this.integranteId != null && !this.integranteId.equals(other.integranteId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.entidad.Integrantes[ integranteId=" + integranteId + " ]";
    }

}
