

<%@ page import="user.User"%>
<%@ page import="user.Bio"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="userMenu" />
<g:set var="entityName"
	value="${message(code: 'user.information.label', default: 'user')}" />
</head>
<body>
<div>
<div class="biotab" style="z-index: 5"></div>
</div>
<div class="biobody">
<g:hasErrors bean="${userInstance}">
	<div class="taberrors"><g:renderErrors bean="${userInstance}"
		as="list" /></div>
</g:hasErrors>
<div class="buttons" style="margin-right: 20px"><g:form>
	<g:hiddenField name="id" value="${userInstance?.id}" />
	<span class="button"><g:actionSubmit class="edit"
		action="edit_bio"
		value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
</g:form></div>
<div class="body" style="padding: 10px 20px">
<div class="tabDialog">
<table>
	<tbody>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="bio.firstName.label" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: bioInstance, field: "firstName")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="bio.lastName.label" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: bioInstance, field: "lastName")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="bio.birthday.label" /></td>

			<td valign="top" class="value"><g:formatDate
				date="${bioInstance?.birthday}" /></td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="bio.autobio.label" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: bioInstance, field: "autobio")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="bio.interests.label" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: bioInstance, field: "interests")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message
				code="bio.hobbies.label" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: bioInstance, field: "hobbies")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message code="bio.movies.label" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: bioInstance, field: "movies")}
			</td>

		</tr>

		<tr class="prop">
			<td valign="top" class="name"><g:message code="bio.books.label" /></td>

			<td valign="top" class="value">
			${fieldValue(bean: bioInstance, field: "books")}
			</td>

		</tr>
	</tbody>
</table>
</div>
</div>
</div>
<div class="photoBkgd">
<div class="bodytext" style="margin-left: -15px"> <g:form method="post">
	<div class="buttons" style="margin: 0px -30px">
	<div class="button"><g:actionSubmit class="save" action="update"
		value="${message(code: 'default.button.update.label', default: 'Update')}" /></div>
	</div>
	<g:hiddenField name="id" value="${userInstance?.id}" />
	<g:hiddenField name="version" value="${userInstance?.version}" />
	<div class="userDialog">
	<h1 style="margin-top: 50px"><g:message code="default.edit.label"
		args="[entityName]" /></h1>
	<table>
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><label for="login"><g:message
					code="user.login.label" default="Login" /></label></td>
			</tr>
			<tr>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'login', 'errors')}">
				<g:textField name="login" maxlength="20"
					value="${userInstance?.login}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="password"><g:message
					code="user.password.label" default="Password" /></label></td>
			</tr>
			<tr>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
				<g:passwordField name="password" maxlength="25"
					value="${userInstance?.password}" /></td>
			</tr>
		</tbody>
	</table>
	</div></div>
</g:form></div>
</body>
</html>
