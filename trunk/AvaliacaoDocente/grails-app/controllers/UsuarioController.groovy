/**
 * User controller.
 */
class UsuarioController {

	def authenticateService

	// the delete, save and update actions only accept POST requests
	static Map allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

	def index = {
		redirect action: list, params: params
	}

	def list = {

                if (!params.max) {
			params.max = 10
		}
		[personList: Usuario.list(params)]
	}

	def show = {
		def person = Usuario.get(params.id)
		if (!person) {
			flash.message = "Usuario not found with id $params.id"
			redirect action: list
			return
		}
		List roleNames = []
		for (role in person.authorities) {
			roleNames << role.authority
		}
		roleNames.sort { n1, n2 ->
			n1 <=> n2
		}
                //listar disciplinas
		List disciplinas = []
		for (disc in person.disciplina) {
			disciplinas << disc.nome
		}
		disciplinas.sort { n1, n2 ->
			n1 <=> n2
		}
		[person: person, roleNames: roleNames, disciplinas: disciplinas]
	}

	/**
	 * Pessoa: ação de exclusão. Antes de retirar uma pessoa existente,
         * deve ser retirado as permissões que ele possui.
	 */
	def delete = {

		def person = Usuario.get(params.id)
		if (person) {
			def authPrincipal = authenticateService.principal()
			// evitar a auto-excluir, se o usuário logado é um administrador
			if (!(authPrincipal instanceof String) && authPrincipal.username == person.username) {
				flash.message = "You can not delete yourself, please login as another admin and try again"
			}
			else {
				// primeiro, elimine essa pessoa da tabela 'permissao_people'
				Permissao.findAll().each { it.removeFromPeople(person) }
				person.delete()
				flash.message = "Usuario $params.id deleted."
			}
		}
		else {
			flash.message = "Usuario not found with id $params.id"
		}

		redirect action: list
	}

	def edit = {

		def person = Usuario.get(params.id)
		if (!person) {
			flash.message = "Usuario not found with id $params.id"
			redirect action: list
			return
		}

		return buildPersonModel(person)
	}

	/**
	 * Person update action.
	 */
	def update = {

		def person = Usuario.get(params.id)
		if (!person) {
			flash.message = "Usuario not found with id $params.id"
			redirect action: edit, id: params.id
			return
		}

		long version = params.version.toLong()
		if (person.version > version) {
			person.errors.rejectValue 'version', "person.optimistic.locking.failure",
				"Another user has updated this Usuario while you were editing."
				render view: 'edit', model: buildPersonModel(person)
			return
		}

		def oldPassword = person.passwd
		person.properties = params
		if (!params.passwd.equals(oldPassword)) {
			person.passwd = authenticateService.encodePassword(params.passwd)
		}
		if (person.save()) {
			Permissao.findAll().each { it.removeFromPeople(person) }
			addRoles(person)
                        addDisciplinas(person)
			redirect action: show, id: person.id
		}
		else {
			render view: 'edit', model: buildPersonModel(person)
		}
	}

	def create = {
		[person: new Usuario(params), authorityList: Permissao.list(), disciplinaList: Disciplina.list()]
	}

	/**
	 * Person save action.
	 */
	def save = {

		def person = new Usuario()
		person.properties = params
		person.passwd = authenticateService.encodePassword(params.passwd)
		if (person.save()) {
			addRoles(person)
                        addDisciplinas(person)
			redirect action: show, id: person.id
		}
		else {
			render view: 'create', model: [disciplinaList: Disciplina.list(), authorityList: Permissao.list(), person: person]
		}
	}

	private void addRoles(person) {
		for (String key in params.keySet()) {
			if (key.contains('ROLE') && 'on' == params.get(key)) {
				Permissao.findByAuthority(key).addToPeople(person)
			}
		}
	}

        //teste add disciplina
        private void addDisciplinas(person) {

                for (String key in params.keySet()) {
                    println key
			if (!key.contains('ROLE') && 'on' == params.get(key)) {
                           if(Disciplina.findByNome(key) != null) {
				Disciplina.findByNome(key).addToUsuario(person)
                           }
			}
		}

	}

	private Map buildPersonModel(person) {

		List roles = Permissao.list()
		roles.sort { r1, r2 ->
			r1.authority <=> r2.authority
		}
		Set userRoleNames = []
		for (role in person.authorities) {
			userRoleNames << role.authority
		}
		LinkedHashMap<Permissao, Boolean> roleMap = [:]
		for (role in roles) {
			roleMap[(role)] = userRoleNames.contains(role.authority)
		}
		//listar disciplinas
                List disciplinas = Disciplina.list()
		disciplinas.sort { r1, r2 ->
			r1.nome <=> r2.nome
		}
		Set userDisciplinas = []
		for (disc in person.disciplina) {
			userDisciplinas << disc.nome
		}
		LinkedHashMap<Disciplina, Boolean> disciplinaMap = [:]
		for (disc in disciplinas) {
			disciplinaMap[(disc)] = userDisciplinas.contains(disc.nome)
		}

		return [person: person, roleMap: roleMap, disciplinaMap: disciplinaMap]
	}
}
