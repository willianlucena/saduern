import org.grails.plugins.springsecurity.service.AuthenticateService

class RespostaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def authenticateService
    static Usuario user
    static Disciplina disc
    static Curso curso

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def respostaInstance = new Resposta()
        respostaInstance.properties = params

        def userPrincipal = authenticateService.principal()
        user = Usuario.findByUsername(userPrincipal.getUsername())

        // TESTE
        def disciplinaInstanceTotal = user.disciplina.count()
        def disciplinaInstanceList =  user.disciplina

//        def disciplinaInstanceList = DisciplinaUsuario.findAllByVotouAndUsuario("false", user)
//        def disciplinaInstanceTotal = disciplinaInstanceList.size()
//        println disciplinaInstanceList
//        println disciplinaInstanceTotal

        [respostaInstanceList: Resposta.list(params), respostaInstanceTotal: Resposta.count(), 
            respostaInstance: respostaInstance,
            disciplinaInstanceList:disciplinaInstanceList, disciplinaInstanceTotal:disciplinaInstanceTotal]
    }

    def create = {
        def respostaInstance = new Resposta()
        def disciplinaInstance = Disciplina.get(params.id) // em testes ainda ... qqr coisa deletar essa linha =D
        disc = disciplinaInstance

        def userPrincipal = authenticateService.principal()
        def usuarioInstance = Usuario.findByUsername(userPrincipal.getUsername())
        user = usuarioInstance
        curso = usuarioInstance.curso

        respostaInstance.properties = params
        return [respostaInstance: respostaInstance, questaoList: Questao.list(),disciplinaInstance:disciplinaInstance,usuarioInstance:usuarioInstance, curso:curso]
    }

    def save = {
        int i = 0

        params.disciplina = disc
        params.nucleo = user.nucleo
        params.curso = curso
        params.semestreAvaliacao = curso.semestreAvaliacao

        def respostaInstance = new Resposta(params)
        String key
        while (true) {
            key = params.keySet()
            i ++
            if(i > 14){
                break
            }
            respostaInstance.questao = Questao.findById(i)
            try {
                respostaInstance.conceito = Integer.parseInt(params.get('pergunta' + i))
            } catch(NumberFormatException e) {
                respostaInstance.conceito = 0
            }
            if (respostaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.created.message', args: [message(code: 'resposta.label', default: 'Resposta'), respostaInstance.id])}"
                // redirect (action: "show", id: respostaInstance.id)
            }
            else {
                //render(view: "create", model: [respostaInstance: respostaInstance])
                println 'ERROR !!!'
            }
            respostaInstance = new Resposta(params)
        }
        //flash.message = "${message(code: 'default.created.message', args: [message(code: 'resposta.label', default: 'Resposta'), respostaInstance.id])}"
        //redirect(action: "show", id: respostaInstance.id)
        redirect (action: "list", id: respostaInstance.id)
        //redirect(action: "show")
    }

    def show = {
        def respostaInstance = Resposta.get(params.id)
        if (!respostaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resposta.label', default: 'Resposta'), params.id])}"
            redirect(action: "list")
        }
        else {
            [respostaInstance: respostaInstance]
        }
    }

    def edit = {
        def respostaInstance = Resposta.get(params.id)
        if (!respostaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resposta.label', default: 'Resposta'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [respostaInstance: respostaInstance]
        }
    }

    def update = {
        def respostaInstance = Resposta.get(params.id)
        if (respostaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (respostaInstance.version > version) {

                    respostaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'resposta.label', default: 'Resposta')] as Object[], "Another user has updated this Resposta while you were editing")
                    render(view: "edit", model: [respostaInstance: respostaInstance])
                    return
                }
            }
            respostaInstance.properties = params
            if (!respostaInstance.hasErrors() && respostaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'resposta.label', default: 'Resposta'), respostaInstance.id])}"
                redirect(action: "show", id: respostaInstance.id)
            }
            else {
                render(view: "edit", model: [respostaInstance: respostaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resposta.label', default: 'Resposta'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def respostaInstance = Resposta.get(params.id)
        if (respostaInstance) {
            try {
                respostaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'resposta.label', default: 'Resposta'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'resposta.label', default: 'Resposta'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resposta.label', default: 'Resposta'), params.id])}"
            redirect(action: "list")
        }
    }
}
