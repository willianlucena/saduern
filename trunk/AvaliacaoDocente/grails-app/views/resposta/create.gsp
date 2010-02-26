

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'resposta.label', default: 'Resposta')}" />
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
            <g:hasErrors bean="${respostaInstance}">
            <div class="errors">
                <g:renderErrors bean="${respostaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="conceito"><g:message code="resposta.conceito.label" default="Conceito" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: respostaInstance, field: 'conceito', 'errors')}">
                                    <!--<g:textField name="conceito" value="${fieldValue(bean: respostaInstance, field: 'conceito')}" />-->
                                    <!--Conceito 5<g:checkBox name="5" value="${fieldValue(bean: respostaInstance, field: 'conceito')}"/><br/>-->
                                    <g:radio name="conceito" value="1"/>
                                    <g:radio name="conceito" value="2"/>
                                    <g:radio name="conceito" value="3"/>
                                    <g:radio name="conceito" value="4"/>
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>