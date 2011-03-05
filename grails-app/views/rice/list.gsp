
<%@ page import="rstock.Rice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rice.label', default: 'Rice')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'rice.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="amount" title="${message(code: 'rice.amount.label', default: 'Amount')}" />
                        
                            <g:sortableColumn property="gather" title="${message(code: 'rice.gather.label', default: 'Gather')}" />
                        
                            <g:sortableColumn property="humidity" title="${message(code: 'rice.humidity.label', default: 'Humidity')}" />
                        
                            <th><g:message code="rice.kind.label" default="Kind" /></th>
                        
                            <th><g:message code="rice.person.label" default="Person" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${riceInstanceList}" status="i" var="riceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${riceInstance.id}">${fieldValue(bean: riceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: riceInstance, field: "amount")}</td>
                        
                            <td><g:formatDate date="${riceInstance.gather}" /></td>
                        
                            <td>${fieldValue(bean: riceInstance, field: "humidity")}</td>
                        
                            <td>${fieldValue(bean: riceInstance, field: "kind")}</td>
                        
                            <td>${fieldValue(bean: riceInstance, field: "person")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${riceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
