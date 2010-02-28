
class Avaliacao {

    Float pontuacao
    Date dataAvaliacao
    String semestre

    static belongsTo = [disciplina: Disciplina]
    
    static constraints = {
        pontuacao(nullable: false, blank: false)
        dataAvaliacao(nullable: false, blank: false)
        semestre(nullable: false, blank: false)
    }
}
