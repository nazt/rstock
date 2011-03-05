

<%@ page import="rstock.Rice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rice.label', default: 'Rice')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${riceInstance}">
            <div class="errors">
                <g:renderErrors bean="${riceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="amount"><g:message code="rice.amount.label" default="Amount" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: riceInstance, field: 'amount', 'errors')}">
                                    <g:textField name="amount" value="${fieldValue(bean: riceInstance, field: 'amount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gather"><g:message code="rice.gather.label" default="Gather" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: riceInstance, field: 'gather', 'errors')}">
                                    <g:datePicker name="gather" precision="day" value="${riceInstance?.gather}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="humidity"><g:message code="rice.humidity.label" default="Humidity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: riceInstance, field: 'humidity', 'errors')}">
                                    <g:textField name="humidity" value="${fieldValue(bean: riceInstance, field: 'humidity')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kind"><g:message code="rice.kind.label" default="Kind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: riceInstance, field: 'kind', 'errors')}">
                                    <g:select name="kind.id" from="${rstock.Kind.list()}" optionKey="id" value="${riceInstance?.kind?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person"><g:message code="rice.person.label" default="Person" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: riceInstance, field: 'person', 'errors')}">
                                    <g:select name="person.id" from="${rstock.Person.list()}" optionKey="id" value="${riceInstance?.person?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="place"><g:message code="rice.place.label" default="Place" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: riceInstance, field: 'place', 'errors')}">
                                    <g:textField name="place" value="${riceInstance?.place}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price"><g:message code="rice.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: riceInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: riceInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weigth"><g:message code="rice.weigth.label" default="Weigth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: riceInstance, field: 'weigth', 'errors')}">
                                    <g:textField name="weigth" value="${fieldValue(bean: riceInstance, field: 'weigth')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
