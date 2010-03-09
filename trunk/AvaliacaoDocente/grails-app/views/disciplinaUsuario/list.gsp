

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'disciplinaUsuario.id.label', default: 'Id')}" />
                        
                            <th><g:message code="disciplinaUsuario.disciplina.label" default="Disciplina" /></th>
                   	    
                            <th><g:message code="disciplinaUsuario.usuario.label" default="Usuario" /></th>
                   	    
                            <g:sortableColumn property="votou" title="${message(code: 'disciplinaUsuario.votou.label', default: 'Votou')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${disciplinaUsuarioInstanceList}" status="i" var="disciplinaUsuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${disciplinaUsuarioInstance.id}">${fieldValue(bean: disciplinaUsuarioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: disciplinaUsuarioInstance, field: "disciplina")}</td>
                        
                            <td>${fieldValue(bean: disciplinaUsuarioInstance, field: "usuario")}</td>
                        
                            <td><g:formatBoolean boolean="${disciplinaUsuarioInstance.votou}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${disciplinaUsuarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
