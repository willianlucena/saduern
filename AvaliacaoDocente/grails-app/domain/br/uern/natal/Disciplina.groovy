package br.uern.natal

class Disciplina {

    Long id
    String nome
    String codigo
    String nucleo
    Float pontuacao
    Curso curso

    static hasMany = [pessoa: Pessoa, resposta:Resposta]
    static belongsTo = Curso

    String toString(){
        nome
    }

    static constraints = {
        nome (nullable:true,blank:true)
        codigo (nullable:true,blank:true)
        nucleo (nullable:true,blank:true)
        pontuacao (nullable:true,blank:true)
    }
}
