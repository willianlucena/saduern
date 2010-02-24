package br.uern.natal

class Departamento {

    Long id
    String nome

    String toString(){
        nome
    }
    
    static constraints = {
        nome (nullable:true,blank:true)
    }
}
