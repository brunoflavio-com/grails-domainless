
<%@ page import="domainless.Foo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'foo.label', default: 'Foo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-foo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-foo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'foo.id.label', default: 'Id')}" />
					
						<g:sortableColumn property="creation" title="${message(code: 'foo.creation.label', default: 'Creation')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'foo.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="bar" title="${message(code: 'foo.bar.label', default: 'Bar')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fooInstanceList}" status="i" var="fooInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fooInstance.id}">${fieldValue(bean: fooInstance, field: "id")}</g:link></td>
					
						<td>${fieldValue(bean: fooInstance, field: "creation")}</td>
					
						<td>${fieldValue(bean: fooInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: fooInstance, field: "bar")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fooInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
