
class QuestaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [questaoInstanceList: Questao.list(params), questaoInstanceTotal: Questao.count()]
    }

    def create = {
        def questaoInstance = new Questao()
        questaoInstance.properties = params
        return [questaoInstance: questaoInstance]
    }

    def save = {
        def questaoInstance = new Questao(params)
        if (questaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'questao.label', default: 'Questao'), questaoInstance.id])}"
            redirect(action: "show", id: questaoInstance.id)
        }
        else {
            render(view: "create", model: [questaoInstance: questaoInstance])
        }
    }

    def show = {
        def questaoInstance = Questao.get(params.id)
        if (!questaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questao.label', default: 'Questao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [questaoInstance: questaoInstance]
        }
    }

    def edit = {
        def questaoInstance = Questao.get(params.id)
        if (!questaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questao.label', default: 'Questao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [questaoInstance: questaoInstance]
        }
    }

    def update = {
        def questaoInstance = Questao.get(params.id)
        if (questaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (questaoInstance.version > version) {
                    
                    questaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'questao.label', default: 'Questao')] as Object[], "Another user has updated this Questao while you were editing")
                    render(view: "edit", model: [questaoInstance: questaoInstance])
                    return
                }
            }
            questaoInstance.properties = params
            if (!questaoInstance.hasErrors() && questaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'questao.label', default: 'Questao'), questaoInstance.id])}"
                redirect(action: "show", id: questaoInstance.id)
            }
            else {
                render(view: "edit", model: [questaoInstance: questaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questao.label', default: 'Questao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def questaoInstance = Questao.get(params.id)
        if (questaoInstance) {
            try {
                questaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'questao.label', default: 'Questao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'questao.label', default: 'Questao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questao.label', default: 'Questao'), params.id])}"
            redirect(action: "list")
        }
    }
}
