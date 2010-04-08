

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'apuracao.label', default: 'Apuracao')}" />
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
                            <th><g:message code="apuracao.disciplina.label" default="Disciplina" /></th>
                            <g:sortableColumn property="quantidade" title="${message(code: 'apuracao.quantidade.label', default: 'Quantidade')}" />
                            <g:sortableColumn property="conceito1" title="${message(code: 'apuracao.conceito1.label', default: 'Conceito 1')}" />
                            <g:sortableColumn property="conceito2" title="${message(code: 'apuracao.conceito2.label', default: 'Conceito 2')}" />
                            <g:sortableColumn property="conceito3" title="${message(code: 'apuracao.conceito3.label', default: 'Conceito 3')}" />
                            <g:sortableColumn property="conceito4" title="${message(code: 'apuracao.conceito4.label', default: 'Conceito 4')}" />
                            <g:sortableColumn property="nulas" title="${message(code: 'apuracao.nulas.label', default: 'Nulas')}" />
                            <g:sortableColumn property="media" title="${message(code: 'apuracao.media.label', default: 'Média')}" />
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${apuracaoInstanceList}" status="i" var="apuracaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: apuracaoInstance, field: "disciplina")}</td>
                            <td>${fieldValue(bean: apuracaoInstance, field: "quantidade")}</td>
                            <td>${fieldValue(bean: apuracaoInstance, field: "conceito1")}</td>
                            <td>${fieldValue(bean: apuracaoInstance, field: "conceito2")}</td>
                            <td>${fieldValue(bean: apuracaoInstance, field: "conceito3")}</td>
                            <td>${fieldValue(bean: apuracaoInstance, field: "conceito4")}</td>
                            <td>${fieldValue(bean: apuracaoInstance, field: "nulas")}</td>
                            <td>${fieldValue(bean: apuracaoInstance, field: "media")}</td>
                            <td class="actionButtons">
                                <span class="actionButton">
                                    <g:link action="show" id="${apuracaoInstance.id}">Detalhes</g:link>
                                </span>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${apuracaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
