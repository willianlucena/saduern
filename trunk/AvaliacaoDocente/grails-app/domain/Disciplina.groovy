
class Disciplina {

    Long id
    String nome
    String codigo
    String nucleo
    String semestre
    String situacao

    static hasMany = [usuario: Usuario, resposta: Resposta]
    static belongsTo = [departamento: Departamento]

    String toString(){
        nome
    }

    static constraints = {
        nome (nullable:true, blank:true)
        codigo (nullable:true, blank:true)
        nucleo (nullable:true, blank:true)
        semestre (nullable:false, blank:false)
        situacao (nullable:false, blank:false)
    }
}