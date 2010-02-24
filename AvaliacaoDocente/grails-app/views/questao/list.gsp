
<%@ page import="br.uern.natal.Questao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'questao.label', default: 'Questao')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'questao.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="pergunta" title="${message(code: 'questao.pergunta.label', default: 'Pergunta')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${questaoInstanceList}" status="i" var="questaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${questaoInstance.id}">${fieldValue(bean: questaoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: questaoInstance, field: "pergunta")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${questaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
