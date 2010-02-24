package br.uern.natal

class Questao {
    
    Long id
    String pergunta

    static hasMany = [respostas: Resposta]

    String toString(){
        pergunta
    }

    static constraints = {
        pergunta (nullable:true,blank:true)
    }
}
