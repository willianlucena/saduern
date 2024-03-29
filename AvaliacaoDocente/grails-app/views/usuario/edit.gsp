<head>
  <meta name="layout" content="main" />
  <title>Editar Usuários</title>
</head>

<body>

  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">Todos os Usuários</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">Criar Novo Usuário</g:link></span>
  </div>

  <div class="body">
    <h1>Edit Usuario</h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${person}">
      <div class="errors">
        <g:renderErrors bean="${person}" as="list" />
      </div>
    </g:hasErrors>

    <div class="prop">
      <span class="name">ID:</span>
      <span class="value">${person.id}</span>
    </div>

    <g:form>
      <input type="hidden" name="id" value="${person.id}" />
      <input type="hidden" name="version" value="${person.version}" />
      <div class="dialog">
        <table>
          <tbody>
            <tr class="prop">
              <td valign="top" class="name"><label for="userRealName">Nome Completo:</label></td>
              <td valign="top" class="value ${hasErrors(bean:person,field:'userRealName','errors')}">
                <input type="text" id="userRealName" name="userRealName" value="${person.userRealName?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name"><label for="username">Login:</label></td>
              <td valign="top" class="value ${hasErrors(bean:person,field:'username','errors')}">
                <input type="text" id="username" name="username" value="${person.username?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name"><label for="passwd">Senha:</label></td>
              <td valign="top" class="value ${hasErrors(bean:person,field:'passwd','errors')}">
                <input type="password" id="passwd" name="passwd" value="${person.passwd?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name"><label for="matricula">Matricula:</label></td>
              <td valign="top" class="value ${hasErrors(bean:person,field:'matricula','errors')}">
                <input type="text" id="matricula" name="matricula" value="${person.matricula?.encodeAsHTML()}"/>
              </td>
            </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="semestreIngresso"><g:message code="usuario.semestreIngresso.label" default="Semestre Ingresso" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'semestreIngresso', 'errors')}">
              <input name="semestreIngresso" value="${usuarioInstance?.semestreIngresso}" />
            </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name"><label for="email">Email:</label></td>
            <td valign="top" class="value ${hasErrors(bean:person,field:'email','errors')}">
              <input type="text" id="email" name="email" value="${person?.email?.encodeAsHTML()}"/>
            </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name"><label for="authorities">Permissões:</label></td>
            <td valign="top" class="value ${hasErrors(bean:person,field:'authorities','errors')}">
              <ul>
                <g:each var="entry" in="${roleMap}">
                  <li>${entry.key.authority.encodeAsHTML()}
                  <g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
                  </li>
                </g:each>
              </ul>
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

          <tr class="prop">
            <td valign="top" class="name">
              <label for="curso"><g:message code="usuario.curso.label" default="Curso" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'curso', 'errors')}">
          <g:select name="curso.id" from="${Curso.list()}" optionKey="id" value="${usuarioInstance?.curso?.id}"  />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name"><label for="nucleo">Núcleo:</label></td>
            <td valign="top" class="value ${hasErrors(bean:person,field:'nucleo','errors')}">
              <input type="text" id="nucleo" name="nucleo" value="${person?.nucleo?.encodeAsHTML()}"/>
            </td>
          </tr>

          </tbody>
        </table>
      </div>

      <div class="buttons">
        <span class="button"><g:actionSubmit class="save" value="Update" /></span>
        <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
      </div>

    </g:form>

  </div>
</body>
