

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'avaliacao.label', default: 'Avaliacao')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'avaliacao.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="pontuacao" title="${message(code: 'avaliacao.pontuacao.label', default: 'Pontuacao')}" />
                        
                            <g:sortableColumn property="dataAvaliacao" title="${message(code: 'avaliacao.dataAvaliacao.label', default: 'Data Avaliacao')}" />
                        
                            <g:sortableColumn property="semestre" title="${message(code: 'avaliacao.semestre.label', default: 'Semestre')}" />
                        
                            <th><g:message code="avaliacao.disciplina.label" default="Disciplina" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${avaliacaoInstanceList}" status="i" var="avaliacaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${avaliacaoInstance.id}">${fieldValue(bean: avaliacaoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: avaliacaoInstance, field: "pontuacao")}</td>
                        
                            <td><g:formatDate date="${avaliacaoInstance.dataAvaliacao}" /></td>
                        
                            <td>${fieldValue(bean: avaliacaoInstance, field: "semestre")}</td>
                        
                            <td>${fieldValue(bean: avaliacaoInstance, field: "disciplina")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${avaliacaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
