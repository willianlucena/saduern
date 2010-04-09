
class Disciplina {

    Long id
    String nome
    String codigo
    String semestre
    String situacao
    Boolean avaliar

    static hasMany = [usuario: Usuario, resposta: Resposta]
    static belongsTo = [departamento: Departamento]

    String toString(){
        nome
    }

    static constraints = {
        nome (nullable:true, blank:true)
        codigo (nullable:true, blank:true)
        semestre (nullable:false, blank:false)
        situacao (nullable:false, blank:false)
        avaliar (nullable:true, blank:true)
    }
}
