
class Usuario {
    static transients = ['pass']

    static belongsTo = [Permissao, Disciplina, Curso]
    static hasMany = [authorities: Permissao, disciplina: Disciplina]

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
        nucleo (nullable: true, blank: true)

    }

}
