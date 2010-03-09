

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'disciplinaUsuario.label', default: 'DisciplinaUsuario')}" />
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
            <g:hasErrors bean="${disciplinaUsuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${disciplinaUsuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="disciplina"><g:message code="disciplinaUsuario.disciplina.label" default="Disciplina" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaUsuarioInstance, field: 'disciplina', 'errors')}">
                                    <g:select name="disciplina.id" from="${Disciplina.list()}" optionKey="id" value="${disciplinaUsuarioInstance?.disciplina?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario"><g:message code="disciplinaUsuario.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaUsuarioInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${Usuario.list()}" optionKey="id" value="${disciplinaUsuarioInstance?.usuario?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="votou"><g:message code="disciplinaUsuario.votou.label" default="Votou" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplinaUsuarioInstance, field: 'votou', 'errors')}">
                                    <g:checkBox name="votou" value="${disciplinaUsuarioInstance?.votou}" />
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
