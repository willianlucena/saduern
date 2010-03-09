class DisciplinaUsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [disciplinaUsuarioInstanceList: DisciplinaUsuario.list(params), disciplinaUsuarioInstanceTotal: DisciplinaUsuario.count()]
    }

    def create = {
        def disciplinaUsuarioInstance = new DisciplinaUsuario()
        disciplinaUsuarioInstance.properties = params
        return [disciplinaUsuarioInstance: disciplinaUsuarioInstance]
    }

    def save = {
        def disciplinaUsuarioInstance = new DisciplinaUsuario(params)
        if (disciplinaUsuarioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario'), disciplinaUsuarioInstance.id])}"
            redirect(action: "show", id: disciplinaUsuarioInstance.id)
        }
        else {
            render(view: "create", model: [disciplinaUsuarioInstance: disciplinaUsuarioInstance])
        }
    }

    def show = {
        def disciplinaUsuarioInstance = DisciplinaUsuario.get(params.id)
        if (!disciplinaUsuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            [disciplinaUsuarioInstance: disciplinaUsuarioInstance]
        }
    }

    def edit = {
        def disciplinaUsuarioInstance = DisciplinaUsuario.get(params.id)
        if (!disciplinaUsuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [disciplinaUsuarioInstance: disciplinaUsuarioInstance]
        }
    }

    def update = {
        def disciplinaUsuarioInstance = DisciplinaUsuario.get(params.id)
        if (disciplinaUsuarioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (disciplinaUsuarioInstance.version > version) {
                    
                    disciplinaUsuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario')] as Object[], "Another user has updated this DisciplinaUsuario while you were editing")
                    render(view: "edit", model: [disciplinaUsuarioInstance: disciplinaUsuarioInstance])
                    return
                }
            }
            disciplinaUsuarioInstance.properties = params
            if (!disciplinaUsuarioInstance.hasErrors() && disciplinaUsuarioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario'), disciplinaUsuarioInstance.id])}"
                redirect(action: "show", id: disciplinaUsuarioInstance.id)
            }
            else {
                render(view: "edit", model: [disciplinaUsuarioInstance: disciplinaUsuarioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def disciplinaUsuarioInstance = DisciplinaUsuario.get(params.id)
        if (disciplinaUsuarioInstance) {
            try {
                disciplinaUsuarioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario'), params.id])}"
            redirect(action: "list")
        }
    }
}
