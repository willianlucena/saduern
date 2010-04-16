

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'resposta.label', default: 'Resposta')}" />
     <script type="text/javascript" src="http://jqueryui.com/latest/jquery-1.4.2.js"></script>
  <script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery.validate.js')}" ></script>
  <script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'additional-methods.js')}" ></script>

  <script type="text/javascript">
    $(function(){
      $(".form").validate();
    });
  </script>
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
    <g:form action="save" method="post" class="form">
      <div class="dialog">

        <table>
          <tbody>
            <tr class="prop">
              <td valign="top" class="name">
                <label for="config"><g:message code="config.label" default="Semestre da Avaliação:" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: config, field: 'semestreAvaliacao', 'errors')}">
                <label for="config"><g:message  name="config" code="config.label" default="${config?.semestreAvaliacao}" /></label>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="user"><g:message code="usuario.nucleo.label" default="Núcleo:" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: respostaInstance, field: 'nucleo', 'errors')}">
                <label for="user"><g:message  name="user" code="usuario.nucleo.label" default="${user?.nucleo}" /></label>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="disciplinaInstance"><g:message code="resposta.disciplina.label" default="Disciplina:" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: respostaInstance, field: 'disciplina', 'errors')}">
                <label for="disciplinaInstance"><g:message  name="disciplinaInstance" code="resposta.disciplina.label" default="${disciplinaInstance?.nome}" /></label>
              </td>
            </tr>


            <tr class="prop">
              <td valign="top" class="name">
                <label for="curso"><g:message code="curso.label" default="Curso:" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: curso, field: 'nome', 'errors')}">
                <label for="curso"><g:message  name="curso" code="curso.label" default="${curso?.nome}" /></label>
              </td>
            </tr>
          </tbody>
        </table><br/>
        <div class="list">
          <table>
            <thead>
              <tr class="prop">
                <th>QUESTÃO</th>
                <th>NÃO ATENDE</th>
                <th>ATENDE COM RESTRIÇÕES</th>
                <th>ATINGE O ESPERADO</th>
                <th>EXCEDE O ESPERADO</th>
              </tr>
            </thead>
            <tbody>
            <g:each in="${questaoList}" status="i" var="questao">
              <tr class="prop">
                <td class="value ${hasErrors(bean: respostaInstance, field: 'questao', 'errors')}">
${fieldValue(bean: questao, field: "id")}) ${fieldValue(bean: questao, field: "pergunta")}:<br/>
                </td>
                <td><input type="radio" name="pergunta${i+1}" value="1" class="required"/></td>
                <td><input type="radio" name="pergunta${i+1}" value="2"/></td>
                <td><input type="radio" name="pergunta${i+1}" value="3"/></td>
                <td><input type="radio" name="pergunta${i+1}" value="4"/></td>
              </tr>
            </g:each>
            </tbody>
          </table>
        </div>

      </div>
      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
      </div>
    </g:form>
  </div>
</body>
</html>
