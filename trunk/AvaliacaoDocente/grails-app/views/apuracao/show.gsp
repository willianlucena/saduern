

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'apuracao.label', default: 'Apuracao')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        .....<br/>
        ...."Mostrar na pagina da action 'show' o resultado por disciplina com o grafico e tals"
        <br/>.....
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="apuracao.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: apuracaoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="apuracao.disciplina.label" default="Disciplina" /></td>
                            
                            <td valign="top" class="value"><g:link controller="disciplina" action="show" id="${apuracaoInstance?.disciplina?.id}">${apuracaoInstance?.disciplina?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="apuracao.quantidade.label" default="Quantidade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: apuracaoInstance, field: "quantidade")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="apuracao.conceito1.label" default="Conceito1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: apuracaoInstance, field: "conceito1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="apuracao.conceito2.label" default="Conceito2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: apuracaoInstance, field: "conceito2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="apuracao.conceito3.label" default="Conceito3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: apuracaoInstance, field: "conceito3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="apuracao.conceito4.label" default="Conceito4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: apuracaoInstance, field: "conceito4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="apuracao.nulas.label" default="Nulas" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: apuracaoInstance, field: "nulas")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="apuracao.media.label" default="Media" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: apuracaoInstance, field: "media")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${apuracaoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
