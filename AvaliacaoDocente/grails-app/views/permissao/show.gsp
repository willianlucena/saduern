<head>
	<meta name="layout" content="main" />
	<title>Detalhes da Permissão</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="list" action="list">Lista de Permissões</g:link></span>
		<span class="menuButton"><g:link class="create" action="create">Nova Permissão</g:link></span>
	</div>

	<div class="body">
		<h1>Lista de Permissões</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
			<table>
			<tbody>

				<tr class="prop">
					<td valign="top" class="name">ID:</td>
					<td valign="top" class="value">${authority.id}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Nome da Permissão:</td>
					<td valign="top" class="value">${authority.authority}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Descrição:</td>
					<td valign="top" class="value">${authority.description}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Pessoas:</td>
					<td valign="top" class="value">${authority.people}</td>
				</tr>

			</tbody>
			</table>
		</div>

		<div class="buttons">
			<g:form>
				<input type="hidden" name="id" value="${authority?.id}" />
				<span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Deseja Realmeente Excluir está Permissão?');" value="Delete" /></span>
			</g:form>
		</div>

	</div>

</body>
