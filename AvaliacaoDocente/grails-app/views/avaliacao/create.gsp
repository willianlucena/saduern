

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'avaliacao.label', default: 'Avaliacao')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${avaliacaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${avaliacaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pontuacao"><g:message code="avaliacao.pontuacao.label" default="Pontuacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: avaliacaoInstance, field: 'pontuacao', 'errors')}">
                                    <input name="pontuacao" value="${fieldValue(bean: avaliacaoInstance, field: 'pontuacao')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataAvaliacao"><g:message code="avaliacao.dataAvaliacao.label" default="Data Avaliacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: avaliacaoInstance, field: 'dataAvaliacao', 'errors')}">
                                    <g:datePicker name="dataAvaliacao" precision="day" value="${avaliacaoInstance?.dataAvaliacao}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="semestre"><g:message code="avaliacao.semestre.label" default="Semestre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: avaliacaoInstance, field: 'semestre', 'errors')}">
                                    <input name="semestre" value="${avaliacaoInstance?.semestre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="disciplina"><g:message code="avaliacao.disciplina.label" default="Disciplina" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: avaliacaoInstance, field: 'disciplina', 'errors')}">
                                    <g:select name="disciplina.id" from="${Disciplina.list()}" optionKey="id" value="${avaliacaoInstance?.disciplina?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
