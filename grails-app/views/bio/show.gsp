
<%@ page import="user.Bio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bio.label', default: 'Bio')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.firstName.label" default="First Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "firstName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.lastName.label" default="Last Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "lastName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.birthday.label" default="Birthday" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${bioInstance?.birthday}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.autobio.label" default="Autobio" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "autobio")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.interests.label" default="Interests" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "interests")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.hobbies.label" default="Hobbies" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "hobbies")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.movies.label" default="Movies" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "movies")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.books.label" default="Books" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "books")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${bioInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
