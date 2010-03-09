
class Curso {

    Long id
    String nome
    String semestreAvaliacao

    String toString(){
        nome
    }

    static constraints = {
        nome (nullable:true,blank:true)
        semestreAvaliacao (nullable:false,blank:false)
    }
}
