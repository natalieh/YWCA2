
<%@ page import="user.Bio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bio.label', default: 'Bio')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'bio.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'bio.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'bio.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="birthday" title="${message(code: 'bio.birthday.label', default: 'Birthday')}" />
                        
                            <g:sortableColumn property="autobio" title="${message(code: 'bio.autobio.label', default: 'Autobio')}" />
                        
                            <g:sortableColumn property="interests" title="${message(code: 'bio.interests.label', default: 'Interests')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bioInstanceList}" status="i" var="bioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bioInstance.id}">${fieldValue(bean: bioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bioInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: bioInstance, field: "lastName")}</td>
                        
                            <td><g:formatDate date="${bioInstance.birthday}" /></td>
                        
                            <td>${fieldValue(bean: bioInstance, field: "autobio")}</td>
                        
                            <td>${fieldValue(bean: bioInstance, field: "interests")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
