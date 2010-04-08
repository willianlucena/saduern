

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'apuracao.label', default: 'Apuracao')}" />
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
            <g:hasErrors bean="${apuracaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${apuracaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${apuracaoInstance?.id}" />
                <g:hiddenField name="version" value="${apuracaoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="disciplina"><g:message code="apuracao.disciplina.label" default="Disciplina" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apuracaoInstance, field: 'disciplina', 'errors')}">
                                    <g:select name="disciplina.id" from="${Disciplina.list()}" optionKey="id" value="${apuracaoInstance?.disciplina?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantidade"><g:message code="apuracao.quantidade.label" default="Quantidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apuracaoInstance, field: 'quantidade', 'errors')}">
                                    <g:textField name="quantidade" value="${fieldValue(bean: apuracaoInstance, field: 'quantidade')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="conceito1"><g:message code="apuracao.conceito1.label" default="Conceito1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apuracaoInstance, field: 'conceito1', 'errors')}">
                                    <g:textField name="conceito1" value="${fieldValue(bean: apuracaoInstance, field: 'conceito1')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="conceito2"><g:message code="apuracao.conceito2.label" default="Conceito2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apuracaoInstance, field: 'conceito2', 'errors')}">
                                    <g:textField name="conceito2" value="${fieldValue(bean: apuracaoInstance, field: 'conceito2')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="conceito3"><g:message code="apuracao.conceito3.label" default="Conceito3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apuracaoInstance, field: 'conceito3', 'errors')}">
                                    <g:textField name="conceito3" value="${fieldValue(bean: apuracaoInstance, field: 'conceito3')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="conceito4"><g:message code="apuracao.conceito4.label" default="Conceito4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apuracaoInstance, field: 'conceito4', 'errors')}">
                                    <g:textField name="conceito4" value="${fieldValue(bean: apuracaoInstance, field: 'conceito4')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nulas"><g:message code="apuracao.nulas.label" default="Nulas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apuracaoInstance, field: 'nulas', 'errors')}">
                                    <g:textField name="nulas" value="${fieldValue(bean: apuracaoInstance, field: 'nulas')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="media"><g:message code="apuracao.media.label" default="Media" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apuracaoInstance, field: 'media', 'errors')}">
                                    <g:textField name="media" value="${fieldValue(bean: apuracaoInstance, field: 'media')}" />
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
