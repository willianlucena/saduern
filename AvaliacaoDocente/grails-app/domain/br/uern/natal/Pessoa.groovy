package br.uern.natal

class Pessoa {
    
    Long id
    String nome
    Byte permissao
    String matricula
    String senha
   
    static hasMany = [disciplina:Disciplina]
    static belongsTo = Disciplina

    String toString(){
        nome
    }

    static constraints = {
        nome (nullable:true,blank:true)
        permissao (nullable:true,blank:true)
        matricula (nullable:false,blank:false)
        senha (nullable:false,blank:false)
    }
}
