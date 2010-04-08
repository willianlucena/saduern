
class DisciplinaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [disciplinaInstanceList: Disciplina.list(params), disciplinaInstanceTotal: Disciplina.count()]
    }

    def create = {
        def disciplinaInstance = new Disciplina()
        disciplinaInstance.properties = params
        return [disciplinaInstance: disciplinaInstance]
    }

    def save = {
        def disciplinaInstance = new Disciplina(params)
        if (disciplinaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), disciplinaInstance.id])}"
            redirect(action: "show", id: disciplinaInstance.id)
        }
        else {
            render(view: "create", model: [disciplinaInstance: disciplinaInstance])
        }
    }

    def show = {
        def disciplinaInstance = Disciplina.get(params.id)
        if (!disciplinaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), params.id])}"
            redirect(action: "list")
        }
        else {
            [disciplinaInstance: disciplinaInstance]
        }
    }

    def edit = {
        def disciplinaInstance = Disciplina.get(params.id)
        if (!disciplinaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [disciplinaInstance: disciplinaInstance]
        }
    }

    def update = {
        def disciplinaInstance = Disciplina.get(params.id)
        if (disciplinaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (disciplinaInstance.version > version) {
                    
                    disciplinaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'disciplina.label', default: 'Disciplina')] as Object[], "Another user has updated this Disciplina while you were editing")
                    render(view: "edit", model: [disciplinaInstance: disciplinaInstance])
                    return
                }
            }
            disciplinaInstance.properties = params
            if (!disciplinaInstance.hasErrors() && disciplinaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), disciplinaInstance.id])}"
                redirect(action: "show", id: disciplinaInstance.id)
            }
            else {
                render(view: "edit", model: [disciplinaInstance: disciplinaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def disciplinaInstance = Disciplina.get(params.id)
        if (disciplinaInstance) {
            try {
                disciplinaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), params.id])}"
            redirect(action: "list")
        }
    }
}
