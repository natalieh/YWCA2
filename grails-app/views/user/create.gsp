

<%@ page import="user.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
           	<g:hasErrors bean="${userInstance}">
            <div class="errors">
            	<g:renderErrors bean="${userInstance}" as="list" />
           	</div>
           	</g:hasErrors>
            <g:form action="save" >
            <div style="float:right">
                <div class="createDialog" style="margin-top:20px">
                
                    <table>
                        <tbody>
           	             <td><h3><g:message code="default.create.label" args="[entityName]" /></h3></td>
                            <tr class="createProp">
                                <td valign="top" class="name">
                                    <label for="login"><g:message code="user.login.label" default="Login" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'login', 'errors')}">
                                    <g:textField name="login" maxlength="20" value="${userInstance?.login}" />
                                </td>
                            </tr>
                        
                            <tr class="createProp">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="user.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" maxlength="25" value="${userInstance?.password}" />
                                </td>
                            </tr>
                <tr>
                <td></td>
                <td>
                <div class="buttons" style="float:left; margin-top:-20px; margin-left: 120px">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
                </td>
                </tr>
                </tbody>
                    </table>
                </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
