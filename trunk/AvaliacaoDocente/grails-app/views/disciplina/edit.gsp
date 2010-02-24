

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'disciplina.label', default: 'Disciplina')}" />
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
            <g:hasErrors bean="${disciplinaInstance}">
            <div class="errors">
                <g:renderErrors bean="${disciplinaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${disciplinaInstance?.id}" />
                <g:hiddenField name="version" value="${disciplinaInstance?.version}" />
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
                                  <label for="resposta"><g:message code="disciplina.resposta.label" default="Resposta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'resposta', 'errors')}">
                                    
<ul>
<g:each in="${disciplinaInstance?.resposta?}" var="r">
    <li><g:link controller="resposta" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="resposta" action="create" params="['disciplina.id': disciplinaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resposta.label', default: 'Resposta')])}</g:link>

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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuario"><g:message code="disciplina.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario" from="${Usuario.list()}" multiple="yes" optionKey="id" size="5" value="${disciplinaInstance?.usuario}" />
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
