class ApuracaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def apurar = {
        List<Disciplina> disc = Disciplina.findAllByAvaliar("true")
        
        disc.each {
            println it
            Integer c1 = Resposta.countByDisciplinaAndConceito(it,1)
            Integer c2 = Resposta.countByDisciplinaAndConceito(it,2)
            Integer c3 = Resposta.countByDisciplinaAndConceito(it,3)
            Integer c4 = Resposta.countByDisciplinaAndConceito(it,4)
            Integer nulas = Resposta.countByDisciplinaAndConceito(it,0)
            Integer qtd = 0
            Double media = 0
            try {
                qtd = (Resposta.countByDisciplina(it)/14)
                media = (((c1*2.5)+(c2*5)+(c3*7.5)+(c4*10))/(qtd*(14-nulas)))
            } catch (Exception e) {
                println "divisao por zero =P"
            }

            Apuracao apurar = Apuracao.findByDisciplina(it)
            Apuracao apuracao = new Apuracao(disciplina:it,quantidade:qtd,conceito1:c1,conceito2:c2,conceito3:c3,conceito4:c4,media:media,nulas:nulas)
            if (apurar == null) {
                apuracao.save()
            } else {
                if (apurar.quantidade == apuracao.quantidade) {
                    println "disciplina ja apurada!"
                } else {
                    apurar.quantidade = apuracao.quantidade
                    apurar.conceito1 = apuracao.conceito1
                    apurar.conceito2 = apuracao.conceito2
                    apurar.conceito3 = apuracao.conceito3
                    apurar.conceito4 = apuracao.conceito4
                    apurar.media = apuracao.media
                    apurar.nulas = apuracao.nulas
                    apurar.save()
                }
            }
        }
        redirect(action: "list", params: params)
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [apuracaoInstanceList: Apuracao.list(params), apuracaoInstanceTotal: Apuracao.count()]
    }

    def create = {
        def apuracaoInstance = new Apuracao()
        apuracaoInstance.properties = params
        return [apuracaoInstance: apuracaoInstance]
    }

    def save = {
        def apuracaoInstance = new Apuracao(params)
        if (apuracaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'apuracao.label', default: 'Apuracao'), apuracaoInstance.id])}"
            redirect(action: "show", id: apuracaoInstance.id)
        }
        else {
            render(view: "create", model: [apuracaoInstance: apuracaoInstance])
        }
    }

    def show = {

        println "Mostrar na pagina da action 'show' o resultado por disciplina com o grafico e tals"
        def apuracaoInstance = Apuracao.get(params.id)
        if (!apuracaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'apuracao.label', default: 'Apuracao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [apuracaoInstance: apuracaoInstance]
        }
    }

    def edit = {
        def apuracaoInstance = Apuracao.get(params.id)
        if (!apuracaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'apuracao.label', default: 'Apuracao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [apuracaoInstance: apuracaoInstance]
        }
    }

    def update = {
        def apuracaoInstance = Apuracao.get(params.id)
        if (apuracaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (apuracaoInstance.version > version) {
                    
                    apuracaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'apuracao.label', default: 'Apuracao')] as Object[], "Another user has updated this Apuracao while you were editing")
                    render(view: "edit", model: [apuracaoInstance: apuracaoInstance])
                    return
                }
            }
            apuracaoInstance.properties = params
            if (!apuracaoInstance.hasErrors() && apuracaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'apuracao.label', default: 'Apuracao'), apuracaoInstance.id])}"
                redirect(action: "show", id: apuracaoInstance.id)
            }
            else {
                render(view: "edit", model: [apuracaoInstance: apuracaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'apuracao.label', default: 'Apuracao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def apuracaoInstance = Apuracao.get(params.id)
        if (apuracaoInstance) {
            try {
                apuracaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'apuracao.label', default: 'Apuracao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'apuracao.label', default: 'Apuracao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'apuracao.label', default: 'Apuracao'), params.id])}"
            redirect(action: "list")
        }
    }
}
