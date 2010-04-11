

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'configuracao.label', default: 'Configuracao')}" />
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
            <g:hasErrors bean="${configuracaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${configuracaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="semestreAvaliacao"><g:message code="configuracao.semestreAvaliacao.label" default="Semestre Avaliacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: configuracaoInstance, field: 'semestreAvaliacao', 'errors')}">
                                    <input name="semestreAvaliacao" value="${configuracaoInstance?.semestreAvaliacao}" />
                                </td>
                            </tr>
                            <g:each in="${disciplinaList}">
                              <tr>
				<td valign="top" class="name" align="left">${it.nome.encodeAsHTML()}</td>
				<td align="left"><g:checkBox optionKey="id" name="${it.nome}"/></td>
                              </tr>
                            </g:each>
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
