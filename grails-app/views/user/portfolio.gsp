
<%@ page import="user.User" %>
<%@ page import="user.Bio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="userMenu" />
    </head>
    <body>	
    	<div>
        	<div class="biotab" style="z-index:5"></div>
		</div>
        <div class="biobody">
        <div class="buttons">
             <g:form>
             	<g:hiddenField name="id" value="${userInstance?.id}" />
             	<span class="button"><g:actionSubmit class="edit" action="edit_bio" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
        	</g:form>
        </div>
       		<div class="body" style="padding: 10px 20px">
            	<g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            	</g:if>
            	<div class="tabDialog">
                	<table>
                    	<tbody>
                                      
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.firstName.label" default="First Name:" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "firstName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.lastName.label" default="Last Name:" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "lastName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.birthday.label" default="Birthday:" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${bioInstance?.birthday}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.autobio.label" default="Autobiography:" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "autobio")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.interests.label" default="Interests:" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "interests")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.hobbies.label" default="Hobbies:" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "hobbies")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.movies.label" default="Favorite Movies:" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bioInstance, field: "movies")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bio.books.label" default="Favorite Books:" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInterface, field: "books")}</td>
                            
                        </tr>
                    	</tbody>
                	</table>
            	</div>
        </div>
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
