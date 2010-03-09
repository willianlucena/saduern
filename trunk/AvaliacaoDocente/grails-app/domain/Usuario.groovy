
class Usuario {
    static transients = ['pass']
    static hasMany = [authorities: Permissao, disciplina: Disciplina]
    static belongsTo = [Permissao, Disciplina, Curso]

    String username
    String userRealName
    /** MD5 Password */
    String passwd
    boolean enabled
    String email
    
    /** plain password to create a MD5 password */
    String pass = '[secret]'

    String matricula
    Curso curso
    String semestreIngresso
    String nucleo

    String toString(){
        userRealName
    }

    static constraints = {
        username(blank: false, unique: true)
        userRealName(blank: false)
        passwd(blank: false)
        enabled()
        matricula(nullable: false, blank: false ,unique: true)
        semestreIngresso (nullable: false, blank: false)
        //description (nullable: true, blank: true)
        nucleo (nullable: true, blank: true)

    }

    // num serve pra nada e eu nao sei tirar ¬¬
    //culpa do acegi
    //boolean email_show = false
    //String description = ""
}
