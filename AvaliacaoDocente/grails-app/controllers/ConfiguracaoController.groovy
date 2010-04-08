class ConfiguracaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [configuracaoInstanceList: Configuracao.list(params), configuracaoInstanceTotal: Configuracao.count()]
    }

    def create = {
        def configuracaoInstance = new Configuracao()
        configuracaoInstance.properties = params
        return [configuracaoInstance: configuracaoInstance, disciplinaList: Disciplina.list()]
    }

    def save = {
        def configuracaoInstance = new Configuracao(params)
        if (configuracaoInstance.save(flush: true)) {
            addDisciplinas(configuracaoInstance)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), configuracaoInstance.id])}"
            redirect(action: "show", id: configuracaoInstance.id)
        }
        else {
            render(view: "create", model: [configuracaoInstance: configuracaoInstance])
        }
    }

    private void addDisciplinas(configuracaoInstance) {
        println params
        Disciplina disciplina = new Disciplina()
        for (def key in params.keySet()) {
            if (!key.contains('ROLE') && 'on' == params.get(key)) {
                disciplina = Disciplina.findByNome(key)
                if(disciplina != null) {
                    disciplina.avaliar = true
                    disciplina.save(flush: true)
                }
            }
        }
    }

    def show = {
        def configuracaoInstance = Configuracao.get(params.id)
        if (!configuracaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), params.id])}"
            redirect(action: "list")
        }
        else {
            List disciplinas = []
            for (disc in Disciplina.findAllByAvaliar("true")) {
                disciplinas << disc.nome
            }
            disciplinas.sort { n1, n2 ->
                n1 <=> n2
            }
            [configuracaoInstance: configuracaoInstance, disciplinas: disciplinas]
        }
    }

    def edit = {
        def configuracaoInstance = Configuracao.get(params.id)

        if (!configuracaoInstance) {
            flash.message = "Configuração not found with id $params.id"
            redirect action: list
            return
        }

        return buildConfigModel(configuracaoInstance)
    }

    def update = {
        println params
        def configuracaoInstance = Configuracao.get(params.id)
        if (configuracaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (configuracaoInstance.version > version) {
                    
                    configuracaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'configuracao.label', default: 'Configuracao')] as Object[], "Another user has updated this Configuracao while you were editing")
                    render(view: "edit", model: [configuracaoInstance: configuracaoInstance])
                    return
                }
            }
            configuracaoInstance.properties = params
            if (!configuracaoInstance.hasErrors() && configuracaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), configuracaoInstance.id])}"
                redirect(action: "show", id: configuracaoInstance.id)
            }
            else {
                render(view: "edit", model: [configuracaoInstance: configuracaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def configuracaoInstance = Configuracao.get(params.id)
        if (configuracaoInstance) {
            try {
                configuracaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), params.id])}"
            redirect(action: "list")
        }
    }
    private Map buildConfigModel(config) {

        //listar disciplinas
        List disciplinas = Disciplina.list()
        disciplinas.sort { r1, r2 ->
            r1.nome <=> r2.nome
        }
        Set userDisciplinas = []
        for (disc in Disciplina.findAllByAvaliar("true")) {
            userDisciplinas << disc.nome
        }
        LinkedHashMap<Disciplina, Boolean> disciplinaMap = [:]
        for (disc in disciplinas) {
            disciplinaMap[(disc)] = userDisciplinas.contains(disc.nome)
        }
        return [config: config, disciplinaMap: disciplinaMap]
    }
}
