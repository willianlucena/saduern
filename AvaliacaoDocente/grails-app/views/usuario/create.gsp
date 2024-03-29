<head>
	<meta name="layout" content="main" />
	<title>Adcionar Usuário</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="list" action="list">Todos Usuários</g:link></span>
	</div>

	<div class="body">
		<h1>Criação de Usuários</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${person}">
		<div class="errors">
			<g:renderErrors bean="${person}" as="list" />
		</div>
		</g:hasErrors>
		<g:form action="save">
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
                                            <td valign="top" class="name">
                                                <label for="curso"><g:message code="usuario.curso.label" default="Curso" /></label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'curso', 'errors')}">
                                                <g:select name="curso.id" from="${Curso.list()}" optionKey="id" value="${usuarioInstance?.curso?.id}"  />
                                            </td>
                                        </tr>

                                        <tr class="prop">
                                            <td valign="top" class="name">
                                                <label for="nucleo"><g:message code="usuario.nucleo.label" default="Núcleo" /></label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nucleo', 'errors')}">
                                                <input name="nucleo" value="${usuarioInstance?.nucleo}" />
                                            </td>
                                        </tr>
                                        
					<tr class="prop">
						<td valign="top" class="name"><label for="email">Email:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'email','errors')}">
							<input type="text" id="email" name="email" value="${person.email?.encodeAsHTML()}"/>
						</td>
					</tr>

				        <tr class="prop">
						<td valign="top" class="name" align="left">Permissões:</td>
					</tr>

					<g:each in="${authorityList}">
					<tr>
						<td valign="top" class="name" align="left">${it.authority.encodeAsHTML()}</td>
						<td align="left"><g:checkBox name="${it.authority}"/></td>
					</tr>
					</g:each>

                                        <tr class="prop">
						<td valign="top" class="name" align="left">Disciplinas:</td>
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
				<span class="button"><input class="save" type="submit" value="Create" /></span>
			</div>

		</g:form>

	</div>
</body>
