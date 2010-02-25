

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'disciplina.label', default: 'Disciplina')}" />
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
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'disciplina.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'disciplina.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="codigo" title="${message(code: 'disciplina.codigo.label', default: 'Codigo')}" />
                        
                            <g:sortableColumn property="nucleo" title="${message(code: 'disciplina.nucleo.label', default: 'Nucleo')}" />
                        
                            <!--<g:sortableColumn property="pontuacao" title="${message(code: 'disciplina.pontuacao.label', default: 'Pontuacao')}" />-->
                        
                            <th><g:message code="disciplina.curso.label" default="Curso" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${disciplinaInstanceList}" status="i" var="disciplinaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${disciplinaInstance.id}">${fieldValue(bean: disciplinaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: disciplinaInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: disciplinaInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: disciplinaInstance, field: "nucleo")}</td>
                        
                            <!--<td>${fieldValue(bean: disciplinaInstance, field: "pontuacao")}</td>-->
                        
                            <td>${fieldValue(bean: disciplinaInstance, field: "curso")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${disciplinaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
