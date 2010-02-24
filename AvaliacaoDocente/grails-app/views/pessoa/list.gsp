
<%@ page import="br.uern.natal.Pessoa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'pessoa.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'pessoa.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="permissao" title="${message(code: 'pessoa.permissao.label', default: 'Permissao')}" />
                        
                            <g:sortableColumn property="matricula" title="${message(code: 'pessoa.matricula.label', default: 'Matricula')}" />
                        
                            <g:sortableColumn property="senha" title="${message(code: 'pessoa.senha.label', default: 'Senha')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pessoaInstanceList}" status="i" var="pessoaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pessoaInstance.id}">${fieldValue(bean: pessoaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: pessoaInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: pessoaInstance, field: "permissao")}</td>
                        
                            <td>${fieldValue(bean: pessoaInstance, field: "matricula")}</td>
                        
                            <td>${fieldValue(bean: pessoaInstance, field: "senha")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pessoaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
