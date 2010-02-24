<head>
	<meta name="layout" content="main" />
	<title>Show Usuario</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="list" action="list">Usuario List</g:link></span>
		<span class="menuButton"><g:link class="create" action="create">New Usuario</g:link></span>
	</div>

	<div class="body">
		<h1>Show Usuario</h1>
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

<!--				<tr class="prop">
					<td valign="top" class="name">Description:</td>
					<td valign="top" class="value">${person.description?.encodeAsHTML()}</td>
				</tr>
-->
				<tr class="prop">
					<td valign="top" class="name">Email:</td>
					<td valign="top" class="value">${person.email?.encodeAsHTML()}</td>
				</tr>

<!--				<tr class="prop">
					<td valign="top" class="name">Show Email:</td>
					<td valign="top" class="value">${person.emailShow}</td>
				</tr>
-->
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

			</tbody>
			</table>
		</div>

		<div class="buttons">
			<g:form>
				<input type="hidden" name="id" value="${person.id}" />
				<span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
			</g:form>
		</div>

	</div>
</body>
