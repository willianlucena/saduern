

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'questao.label', default: 'Questao')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${questaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${questaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${questaoInstance?.id}" />
                <g:hiddenField name="version" value="${questaoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pergunta"><g:message code="questao.pergunta.label" default="Pergunta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questaoInstance, field: 'pergunta', 'errors')}">
                                    <g:textField name="pergunta" value="${questaoInstance?.pergunta}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="respostas"><g:message code="questao.respostas.label" default="Respostas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questaoInstance, field: 'respostas', 'errors')}">
                                    
<ul>
<g:each in="${questaoInstance?.respostas?}" var="r">
    <li><g:link controller="resposta" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="resposta" action="create" params="['questao.id': questaoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resposta.label', default: 'Resposta')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
