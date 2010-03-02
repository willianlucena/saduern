
function select(controller, action){
    if(action=="contato")
        controller="";
    var path = new Array("avaliacao","curso", "departamento", "disciplina", "mapeamento", "permissao", "questao", "resposta","usuario");
    switch(controller){
        case path[0]:
            avaliacao = document.getElementById("linkAvaliacao");
            avaliacao.className="avaliacao selected";
            avaliacao.style.color="#333";
            break;
        case path[1]:
            curso = document.getElementById("linkCurso");
            curso.className="curso selected";
            curso.style.color="#333";
            break;
        case path[2]:
            departamento = document.getElementById("linkDepartamento");
            departamento.className="departamento selected";
            departamento.style.color="#333";
            break;
        case path[3]:
            disciplina = document.getElementById("linkDisciplina");
            disciplina.className="disciplina selected";
            disciplina.style.color="#333";
            break;
        case path[4]:
            mapeamento = document.getElementById("linkMapeamento");
            mapeamento.className="mapeamento selected";
            mapeamento.style.color="#333";
            break;
        case path[5]:
            permissao = document.getElementById("linkPermissao");
            permissao.className="permissao selected";
            permissao.style.color="#333";
            break;
        case path[6]:
            questao = document.getElementById("linkQuestao");
            questao.className="questao selected";
            questao.style.color="#333";
            break;
        case path[7]:
            resposta = document.getElementById("linkResposta");
            resposta.className="resposta selected";
            resposta.style.color="#333";
            break;
        case path[8]:
            usuario = document.getElementById("linkUsuario");
            usuario.className="usuario selected";
            usuario.style.color="#333";
            break;
        default:
            document.getElementById("main-menu").style.visibility="hidden";
            document.getElementById("quick-search").style.visibility="hidden";
            break;
    }

}

