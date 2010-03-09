<head>
	<meta name="layout" content="main" />
	<title>Administração de Usuários</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="list" action="list">Mostrar Todos Usuários</g:link></span>
		<span class="menuButton"><g:link class="create" action="create">Criar Novo Usuário</g:link></span>
	</div>

	<div class="body">
		<h1>Todos Usuário</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
			<table>
			<tbody>

				<tr class="prop">
					<td valign="top" class="name">ID:</td>
					<td valign="top" class="value">${person.id}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Nome Completo:</td>
					<td valign="top" class="value">${person.userRealName?.encodeAsHTML()}</td>
				</tr>

                                <tr class="prop">
					<td valign="top" class="name">Login:</td>
					<td valign="top" class="value">${person.username?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Matricula:</td>
					<td valign="top" class="value">${person.matricula}</td>
				</tr>

                                <tr class="prop">
					<td valign="top" class="name">Matriculado?</td>
					<td valign="top" class="value">${person.enabled}</td>
				</tr>

                                <tr class="prop">
                                    <td valign="top" class="name">Semestre de Ingresso</td>

                                    <td valign="top" class="value">${person.semestreIngresso}</td>

                                </tr>

                                <tr class="prop">
					<td valign="top" class="name">Email:</td>
					<td valign="top" class="value">${person.email?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Permissões:</td>
					<td valign="top" class="value">
						<ul>
						<g:each in="${roleNames}" var='name'>
							<li>${name}</li>
						</g:each>
						</ul>
					</td>
				</tr>

                                <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.disciplina.label" default="Disciplinas" /></td>

                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${person.disciplina}" var="r">
                                    <li><g:link controller="disciplina" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>

                        </tr>

			</tbody>
			</table>
		</div>

		<div class="buttons">
			<g:form>
				<input type="hidden" name="id" value="${person.id}" />
				<span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Deseja Realmente Excluir esse Usuário?');" value="Delete" /></span>
			</g:form>
		</div>

	</div>
</body>
