package br.uern.natal

class Resposta {

    Long id
    Disciplina disciplina
    Questao questao
    Byte conceito
    
    static belongsTo = Disciplina
    
    static constraints = {
        conceito (nullable:true,blank:true)
    }
   
}
