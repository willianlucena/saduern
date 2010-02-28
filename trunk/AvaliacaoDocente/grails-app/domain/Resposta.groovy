
class Resposta {

    Long id
    Disciplina disciplina
    Questao questao
    Integer conceito
    Curso curso
    String semestreAvaliacao

    static belongsTo = Disciplina
    
    static constraints = {
        conceito (nullable:true,blank:true)
    }
   
}
