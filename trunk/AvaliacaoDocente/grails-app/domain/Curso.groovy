
class Curso {

    Long id
    String nome
    Departamento departamento

    static hasMany = [disciplina : Disciplina]
    static belongsTo = Departamento

    String toString(){
        nome
    }

    static constraints = {
        nome (nullable:true,blank:true)
    }
}
