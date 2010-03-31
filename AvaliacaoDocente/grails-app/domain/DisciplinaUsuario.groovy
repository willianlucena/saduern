
class DisciplinaUsuario implements Serializable {
    Long id
    Usuario usuario
    Disciplina disciplina
    Boolean votou
    
    static mapping = {
        table 'disciplina_usuario'
        id composite: [ 'usuario', 'disciplina']
        version false
    }

    static constraints = {
        usuario (nullable: false, blank: false)
        disciplina (nullable: false, blank: false)
    }
}

