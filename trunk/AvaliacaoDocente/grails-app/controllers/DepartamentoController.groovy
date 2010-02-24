
class DepartamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [departamentoInstanceList: Departamento.list(params), departamentoInstanceTotal: Departamento.count()]
    }

    def create = {
        def departamentoInstance = new Departamento()
        departamentoInstance.properties = params
        return [departamentoInstance: departamentoInstance]
    }

    def save = {
        def departamentoInstance = new Departamento(params)
        if (departamentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])}"
            redirect(action: "show", id: departamentoInstance.id)
        }
        else {
            render(view: "create", model: [departamentoInstance: departamentoInstance])
        }
    }

    def show = {
        def departamentoInstance = Departamento.get(params.id)
        if (!departamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [departamentoInstance: departamentoInstance]
        }
    }

    def edit = {
        def departamentoInstance = Departamento.get(params.id)
        if (!departamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [departamentoInstance: departamentoInstance]
        }
    }

    def update = {
        def departamentoInstance = Departamento.get(params.id)
        if (departamentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (departamentoInstance.version > version) {
                    
                    departamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'departamento.label', default: 'Departamento')] as Object[], "Another user has updated this Departamento while you were editing")
                    render(view: "edit", model: [departamentoInstance: departamentoInstance])
                    return
                }
            }
            departamentoInstance.properties = params
            if (!departamentoInstance.hasErrors() && departamentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])}"
                redirect(action: "show", id: departamentoInstance.id)
            }
            else {
                render(view: "edit", model: [departamentoInstance: departamentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def departamentoInstance = Departamento.get(params.id)
        if (departamentoInstance) {
            try {
                departamentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'departamento.label', default: 'Departamento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'departamento.label', default: 'Departamento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), params.id])}"
            redirect(action: "list")
        }
    }
}
