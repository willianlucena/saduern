
class Resposta {

    Long id
    Disciplina disciplina
    Questao questao
    Boolean conceito
    Curso curso
    
    static belongsTo = Disciplina
    
    static constraints = {
        conceito (nullable:true,blank:true)
    }
   
}
