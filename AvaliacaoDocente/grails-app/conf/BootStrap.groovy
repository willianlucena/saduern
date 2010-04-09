class BootStrap {
    def authenticateService

    def init = { servletContext ->
        //ainda nao ta funcionado ... =/
        if(!Usuario.findAll()){
            def curso = new Curso(nome:"teste",semestreAvaliacao:"1234").save()
            def mapeamento = new Mapeamento(url:"/usuario/**",configAttribute:"ROLE_ADMIN")
            def usuario = new Usuario(username:"root", userRealName:"Admin", enabled:true, email:"teste@teste.que.legal",passwd:authenticateService.encodePassword("root"),description:"teste",emailShow:true,matricula:"007010000",curso:curso)
            def permissao =  new Permissao(description: 'root', authority:'ROLE_ADMIN')
            mapeamento.save()
            permissao.save()
            usuario.save()
            permissao.addToPeople(usuario)
            usuario.addToAuthorities(permissao)
            println Usuario.findAll()
        }else{
            println "já existe usuario"
        }
    }
    def destroy = {
    }
} 