
class DisciplinaUsuario {
    Long id
    Usuario usuario
    Disciplina disciplina
    Boolean votou
    
    static mapping = {
        table 'disciplina_usuario'
        version false

    }

    static constraints = {
        id (nullable: false, blank: false, unique: true)
        disciplina (nullable: false, blank: false)
        usuario (nullable: false, blank: false)
    }
}

