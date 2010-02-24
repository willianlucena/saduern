
class Disciplina {

    Long id
    String nome
    String codigo
    String nucleo
    Float pontuacao

    static hasMany = [usuario: Usuario, resposta:Resposta]
    static belongsTo = [curso: Curso]

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
