
<%@ page import="domainless.Foo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'foo.label', default: 'Foo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-foo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-foo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list foo">
			
				<g:if test="${fooInstance?.id}">
				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="foo.id.label" default="Id" /></span>
					
						<span class="property-value" aria-labelledby="id-label"><g:fieldValue bean="${fooInstance}" field="id"/></span>
					
				</li>
				</g:if>
				<g:if test="${fooInstance?.creation}">
				<li class="fieldcontain">
					<span id="creation-label" class="property-label"><g:message code="foo.creation.label" default="Creation" /></span>
					
						<span class="property-value" aria-labelledby="creation-label"><g:formatDate date="${fooInstance?.creation}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fooInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="foo.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${fooInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fooInstance?.bar}">
				<li class="fieldcontain">
					<span id="bar-label" class="property-label"><g:message code="foo.bar.label" default="Bar" /></span>
					
						<span class="property-value" aria-labelledby="bar-label"><g:fieldValue bean="${fooInstance}" field="bar"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[action:'delete', id:fooInstance.id]" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" id="${fooInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
