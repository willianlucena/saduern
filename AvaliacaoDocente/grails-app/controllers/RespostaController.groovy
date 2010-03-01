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
        int i = 0
        def respostaInstance = new Resposta(params)
        for (String key in params.keySet()) {
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
