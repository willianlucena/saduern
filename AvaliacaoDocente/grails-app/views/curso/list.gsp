

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'curso.id.label', default: 'Id')}" />
                            <g:sortableColumn property="codigo" title="${message(code: 'curso.codigo.label', default: 'Código')}" />
                            <g:sortableColumn property="nome" title="${message(code: 'curso.nome.label', default: 'Nome')}" />
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cursoInstanceList}" status="i" var="cursoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: cursoInstance, field: "id")}</td>
                            <td>${fieldValue(bean: cursoInstance, field: "codigo")}</td>
                            <td>${fieldValue(bean: cursoInstance, field: "nome")}</td>
                            <td class="actionButtons">
                                <span class="actionButton">
                                    <g:link action="show" id="${cursoInstance.id}">Show</g:link>
                                </span>
                            </td>
                        </tr>

                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cursoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
