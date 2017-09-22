<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'poiGrp.label', default: 'PoiGrp')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-poiGrp" class="col-lg-12" role="main">
            <h1 class="page-header"><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message alert alert-success" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.poiGrp}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.poiGrp}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.poiGrp}" method="PUT">
                <g:hiddenField name="version" value="${this.poiGrp?.version}" />
                <fieldset class="form">
                    <f:all bean="poiGrp"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
