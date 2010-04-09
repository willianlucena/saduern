

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'disciplina.label', default: 'Disciplina')}" />
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
            <g:hasErrors bean="${disciplinaInstance}">
            <div class="errors">
                <g:renderErrors bean="${disciplinaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="disciplina.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${disciplinaInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="disciplina.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${disciplinaInstance?.codigo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="semestre"><g:message code="disciplina.semestre.label" default="Semestre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'semestre', 'errors')}">
                                    <g:textField name="semestre" value="${disciplinaInstance?.semestre}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="situacao"><g:message code="disciplina.situacao.label" default="Situação" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'situacao', 'errors')}">
                                    <g:textField name="situacao" value="${disciplinaInstance?.situacao}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="departamento"><g:message code="disciplina.departamento.label" default="Departamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'departamento', 'errors')}">
                                    <g:select name="departamento.id" from="${Departamento.list()}" optionKey="id" value="${disciplinaInstance?.departamento?.id}"  />
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
