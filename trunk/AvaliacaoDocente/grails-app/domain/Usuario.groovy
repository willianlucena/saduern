/**
 * User domain class.
 */
class Usuario {
    static transients = ['pass']
    static hasMany = [authorities: Permissao, disciplina: Disciplina]

    static belongsTo = [Permissao, Disciplina]

    String username
    String userRealName
    /** MD5 Password */
    String passwd
    boolean enabled
    String email
    boolean emailShow
    String description = ''
    /** plain password to create a MD5 password */
    String pass = '[secret]'

    String matricula

    String toString(){
        userRealName
    }

    static constraints = {
        username(blank: false, unique: true)
        userRealName(blank: false)
        passwd(blank: false)
        enabled()
        matricula(nullable:false,blank:false,unique:true)
    }
}
