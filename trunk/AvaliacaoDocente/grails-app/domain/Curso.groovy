
class Curso {

    Long id
    String nome
    String codigo

    String toString(){
        nome
    }

    static constraints = {
        nome (nullable:true,blank:true)
        codigo (nullable:true,blank:true)
    }
}
