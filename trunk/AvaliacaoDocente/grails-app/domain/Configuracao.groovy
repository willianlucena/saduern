
class Configuracao {
    Long id
    String semestreAvaliacao

    static constraints = {
        semestreAvaliacao (nullable:true,blank:true)
    }
}

