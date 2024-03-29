

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'resposta.label', default: 'Resposta')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
                            <td valign="top" class="name"><g:message code="resposta.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: respostaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="resposta.conceito.label" default="Conceito" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: respostaInstance, field: "conceito")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="resposta.disciplina.label" default="Disciplina" /></td>
                            
                            <td valign="top" class="value"><g:link controller="disciplina" action="show" id="${respostaInstance?.disciplina?.id}">${respostaInstance?.disciplina?.encodeAsHTML()}</g:link></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="resposta.semestreAvaliacao.label" default="Semestre da Avaliação" /></td>

                            <td valign="top" class="value">${fieldValue(bean: respostaInstance, field: "semestreAvaliacao")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="resposta.curso.label" default="Curso" /></td>
                            
                            <td valign="top" class="value"><g:link controller="curso" action="show" id="${respostaInstance?.curso?.id}">${respostaInstance?.curso?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="resposta.questao.label" default="Questao" /></td>
                            
                            <td valign="top" class="value"><g:link controller="questao" action="show" id="${respostaInstance?.questao?.id}">${respostaInstance?.questao?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${respostaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
