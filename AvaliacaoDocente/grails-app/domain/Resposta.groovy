
class Resposta {

    Long id
    Integer conceito
    String semestreAvaliacao
    String nucleo
    Disciplina disciplina
    Curso curso
    Questao questao

    static belongsTo = Disciplina
    
    static constraints = {
        conceito (nullable:false,blank:false)
        nucleo (nullable:false,blank:false)
        semestreAvaliacao (nullable:false,blank:false)
    }
   
}
