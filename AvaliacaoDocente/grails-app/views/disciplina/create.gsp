

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
                                    <label for="nucleo"><g:message code="disciplina.nucleo.label" default="Nucleo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'nucleo', 'errors')}">
                                    <g:textField name="nucleo" value="${disciplinaInstance?.nucleo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pontuacao"><g:message code="disciplina.pontuacao.label" default="Pontuacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'pontuacao', 'errors')}">
                                    <g:textField name="pontuacao" value="${fieldValue(bean: disciplinaInstance, field: 'pontuacao')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="curso"><g:message code="disciplina.curso.label" default="Curso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'curso', 'errors')}">
                                    <g:select name="curso.id" from="${Curso.list()}" optionKey="id" value="${disciplinaInstance?.curso?.id}"  />
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
