
class Apuracao {
    Long id
    Disciplina disciplina
    Integer quantidade
    Integer conceito1
    Integer conceito2
    Integer conceito3
    Integer conceito4
    Integer nulas
    Double media

    static constraints = {
        disciplina (nullable: false, blank: false ,unique: true)
        quantidade (nullable: true, blank: true)
        conceito1 (nullable: true, blank: true)
        conceito2 (nullable: true, blank: true)
        conceito3 (nullable: true, blank: true)
        conceito4 (nullable: true, blank: true)
        nulas (nullable: true, blank: true)
        media (nullable: true, blank: true)
    }
}

