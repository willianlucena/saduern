<head>
	<meta name="layout" content="main" />
	<title>Lista de Mapeamento</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="create" action="create">Novo Mapeamento</g:link></span>
	</div>

	<div class="body">
		<h1>Lista de Mapeamento</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="list">
			<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="ID" />
					<g:sortableColumn property="url" title="URL Padrão" />
					<g:sortableColumn property="configAttribute" title="Funções" />
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${requestmapList}" status="i" var="requestmap">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${requestmap.id}</td>
					<td>${requestmap.url?.encodeAsHTML()}</td>
					<td>${requestmap.configAttribute}</td>
					<td class="actionButtons">
						<span class="actionButton">
						<g:link action="show" id="${requestmap.id}">Detalhes</g:link>
						</span>
					</td>
				</tr>
				</g:each>
			</tbody>
			</table>
		</div>

		<div class="paginateButtons">
			<g:paginate total="${Mapeamento.count()}" />
		</div>

	</div>
</body>
