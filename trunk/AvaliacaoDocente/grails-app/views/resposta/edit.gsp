

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'resposta.label', default: 'Resposta')}" />
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
            <g:hasErrors bean="${respostaInstance}">
            <div class="errors">
                <g:renderErrors bean="${respostaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${respostaInstance?.id}" />
                <g:hiddenField name="version" value="${respostaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="conceito"><g:message code="resposta.conceito.label" default="Conceito" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: respostaInstance, field: 'conceito', 'errors')}">
                                    <g:textField name="conceito" value="${fieldValue(bean: respostaInstance, field: 'conceito')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="disciplina"><g:message code="resposta.disciplina.label" default="Disciplina" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: respostaInstance, field: 'disciplina', 'errors')}">
                                    <g:select name="disciplina.id" from="${Disciplina.list()}" optionKey="id" value="${respostaInstance?.disciplina?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="curso"><g:message code="resposta.curso.label" default="Curso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: respostaInstance, field: 'curso', 'errors')}">
                                    <g:select name="curso.id" from="${Curso.list()}" optionKey="id" value="${respostaInstance?.curso?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="questao"><g:message code="resposta.questao.label" default="Questao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: respostaInstance, field: 'questao', 'errors')}">
                                    <g:select name="questao.id" from="${Questao.list()}" optionKey="id" value="${respostaInstance?.questao?.id}"  />
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
