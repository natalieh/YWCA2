
<%@ page import="user.User" %>
<%@ page import="user.Bio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="userMenu" />
    </head>
    <body>	
    	<div>
        	<div class="careerstab" style="z-index:6"><a href="../careers/${fieldValue(bean: userInstance, field: "id")}"><img src="../../images/buttons/careers.png"/></a></div>
		</div>
        <div class="careersbody">
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
