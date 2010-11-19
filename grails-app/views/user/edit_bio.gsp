
<%@ page import="user.User" %>
<%@ page import="user.Bio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="userMenu" />
        <g:set var="entityName" value="${message(code: 'bio.information.label')}" />
    </head>
    <body>
    	<div>
        	<div class="biotab" style="z-index:5"> <a href="${createLink(uri: '/')}"></a></div>
		</div>
        <div class="biobody">
        
        <div class="body" style="padding: 10px 20px">        
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bioInstance}">
            <div class="errors">
                <g:renderErrors bean="${bioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <div class="buttons" style="margin: -10px -20px">
                    <span class="button"><g:actionSubmit class="save_bio" action="update_bio" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
                            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                
                <g:hiddenField name="id" value="${bioInstance?.id}" />
                <g:hiddenField name="version" value="${bioInstance?.version}" />
                <div class="tabDialog"  style="margin-top: 40px">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="bio.firstName.label"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bioInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" maxlength="20" value="${bioInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="bio.lastName.label"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bioInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" maxlength="20" value="${bioInstance?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="birthday"><g:message code="bio.birthday.label" default="Birthday" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bioInstance, field: 'birthday', 'errors')}">
                                    <g:datePicker name="birthday" precision="day" value="${bioInstance?.birthday}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="autobio"><g:message code="bio.autobio.label" default="Autobio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bioInstance, field: 'autobio', 'errors')}">
                                    <g:textArea name="autobio" cols="40" rows="5" value="${bioInstance?.autobio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="interests"><g:message code="bio.interests.label" default="Interests" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bioInstance, field: 'interests', 'errors')}">
                                    <g:textField name="interests" maxlength="200" value="${bioInstance?.interests}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="hobbies"><g:message code="bio.hobbies.label" default="Hobbies" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bioInstance, field: 'hobbies', 'errors')}">
                                    <g:textField name="hobbies" maxlength="200" value="${bioInstance?.hobbies}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="movies"><g:message code="bio.movies.label" default="Movies" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bioInstance, field: 'movies', 'errors')}">
                                    <g:textField name="movies" maxlength="100" value="${bioInstance?.movies}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="books"><g:message code="bio.books.label" default="Books" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bioInstance, field: 'books', 'errors')}">
                                    <g:textField name="books" maxlength="100" value="${bioInstance?.books}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                </div>
            </g:form>
        </div>
        
        
        <div class="photoBkgd">
         <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${userInstance?.id}" />
                    <span class="button"><g:actionSubmit action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        	<div class="bodytext" style="margin-left:-12px">
            <div class="userDialog">
                <table>
                    <tbody>
                                  
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.login.label" default="Login" /></td>
                            <td></td>
                            <tr>
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "login")}</td>
                            </tr>
                        </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </body>
</html>
