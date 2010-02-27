

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'resposta.label', default: 'Resposta')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
            <g:each in="${questaoList}" status="i" var="questao">
                  ${fieldValue(bean: questao, field: "id")}) ${fieldValue(bean: questao, field: "pergunta")}:<br/>
            </g:each>


<!--                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'resposta.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="conceito" title="${message(code: 'resposta.conceito.label', default: 'Conceito')}" />
                        
                            <th><g:message code="resposta.disciplina.label" default="Disciplina" /></th>
                   	    
                            <th><g:message code="resposta.curso.label" default="Curso" /></th>
                   	    
                            <th><g:message code="resposta.questao.label" default="Questao" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${respostaInstanceList}" status="i" var="respostaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${respostaInstance.id}">${fieldValue(bean: respostaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: respostaInstance, field: "conceito")}</td>
                        
                            <td>${fieldValue(bean: respostaInstance, field: "disciplina")}</td>
                        
                            <td>${fieldValue(bean: respostaInstance, field: "curso")}</td>
                        
                            <td>${fieldValue(bean: respostaInstance, field: "questao")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>-->
            </div>
            <div class="paginateButtons">
                <g:paginate total="${respostaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
