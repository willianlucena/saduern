

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'configuracao.label', default: 'Configuracao')}" />
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
    <g:hasErrors bean="${configuracaoInstance}">
      <div class="errors">
        <g:renderErrors bean="${configuracaoInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form method="post" >
      <input type="hidden" name="id" value="${configuracaoInstance?.id}" />
      <input type="hidden" name="version" value="${configuracaoInstance?.version}" />
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

          <tr class="prop">
            <td valign="top" class="name"><label for="disciplina">Disciplina:</label></td>
            <td valign="top" class="value ${hasErrors(bean:person,field:'disciplina','errors')}">
              <ul>
                <g:each var="entry" in="${disciplinaMap}">
                  <li>${entry.key.nome.encodeAsHTML()}
                  <g:checkBox name="${entry.key.nome}" value="${entry.value}"/>
                  </li>
                </g:each>
              </ul>
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
