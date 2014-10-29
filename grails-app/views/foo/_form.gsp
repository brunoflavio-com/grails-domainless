<%@ page import="domainless.Foo" %>

<div class="fieldcontain ${hasErrors(bean: fooInstance, field: 'creation', 'error')} required">
	<label for="creation">
		<g:message code="foo.creation.label" default="Creation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creation" precision="day"  value="${fooInstance?.creation}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: fooInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="foo.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${fooInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fooInstance, field: 'bar', 'error')} required">
	<label for="bar">
		<g:message code="foo.bar.label" default="Bar" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bar" required="" value="${fooInstance?.bar}"/>

</div>

