<head>
	<meta name="layout" content="main" />
	<title>Todos Usuários</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="create" action="create">Novo Usuário</g:link></span>
	</div>

	<div class="body">
		<h1>Lista de Usuários</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="list">
			<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="Id" />
					<g:sortableColumn property="userRealName" title="Nome" />
                                        <g:sortableColumn property="username" title="Login" />
					<g:sortableColumn property="matricula" title="Matricula" />
					<g:sortableColumn property="curso" title="Curso" />
					<g:sortableColumn property="nucleo" title="Núcleo" />
					<g:sortableColumn property="semestreIngresso" title="Semestre de Ingresso" />
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${personList}" status="i" var="person">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${person.id}</td>
					<td>${person.userRealName?.encodeAsHTML()}</td>
                                        <td>${person.username?.encodeAsHTML()}</td>
					<td>${person.matricula?.encodeAsHTML()}</td>
					<td>${person.curso?.encodeAsHTML()}</td>
					<td>${person.nucleo?.encodeAsHTML()}</td>
					<td>${person.semestreIngresso?.encodeAsHTML()}</td>
					
					<td class="actionButtons">
						<span class="actionButton">
							<g:link action="show" id="${person.id}">Detalhes</g:link>
						</span>
					</td>
				</tr>
			</g:each>
			</tbody>
			</table>
		</div>

		<div class="paginateButtons">
			<g:paginate total="${Usuario.count()}" />
		</div>

	</div>
</body>
