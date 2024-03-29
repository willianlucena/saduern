

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
  <script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery.maskedinput-1.2.2.js')}" ></script>
  <script type="text/javascript">

  $(function(){
      $(".codigo").mask("999999-9");
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
    <g:hasErrors bean="${cursoInstance}">
      <div class="errors">
        <g:renderErrors bean="${cursoInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="codigo"><g:message code="curso.codigo.label" default="Código" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: cursoInstance, field: 'codigo', 'errors')}">
                <input class="codigo" name="codigo" value="${cursoInstance?.codigo}" />
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="nome"><g:message code="curso.nome.label" default="Nome" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: cursoInstance, field: 'nome', 'errors')}">
                <input name="nome" value="${cursoInstance?.nome}" />
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
