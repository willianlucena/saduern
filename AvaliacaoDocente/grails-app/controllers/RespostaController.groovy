class RespostaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def respostaInstance = new Resposta()
        respostaInstance.properties = params
        [respostaInstanceList: Resposta.list(params), respostaInstanceTotal: Resposta.count(), questaoList: Questao.list(),respostaInstance: respostaInstance]
    }

    def create = {
        def respostaInstance = new Resposta()
        respostaInstance.properties = params
        return [respostaInstance: respostaInstance, questaoList: Questao.list()]
    }

    def save = {
        def respostaInstance = new Resposta(params)
        //println 'TESTE    ' + params
        println 'conceito: ' + respostaInstance.conceito
        println 'disciplina: ' + respostaInstance.disciplina
        println 'questao: ' + respostaInstance.questao
        for (String key in params.keySet()) {
            if(key.equals('conceito1')){
//                println 'entrou: ' + params.getAt(key)
//                Byte b = params.getAt(key)
//                println 'Byte '+b
                respostaInstance.conceito = params.getAt(key)
            }
        }
        respostaInstance.conceito -= 48
        println '%%%%%%%%%%%%%%%%%%   conceito: ' + respostaInstance.conceito

        if (respostaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'resposta.label', default: 'Resposta'), respostaInstance.id])}"
            redirect(action: "show", id: respostaInstance.id)
        }
        else {
            render(view: "create", model: [respostaInstance: respostaInstance])
        }
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
