<%@ page import="grailsproject.Poi" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poiGrp.label', default: 'PoiGrp')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div id="create-poiGrp" class="col-lg-12" role="main">
    <h1 class="page-header"><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message alert alert-success" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.poiGrp}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.poiGrp}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="col-lg-4">
        <g:uploadForm resource="${this.poiGrp}" method="POST">

            <div class="form-group">
                <label for="name">Nom</label>
                <g:textField id="name" type="text" class="form-control" name="name"/>
            </div>

            <div class="form-group">
                <label for="image">Image</label>
                <input id="image" type="file" name="imageGrp" accept=".jpg, .jpeg, .png">
            </div>

            <div class="form-group">
                <label for="poi">Point d'intéret</label>
                <g:select id="poi" name="pois" class="multiple-select col-lg-11 no-padding-left no-padding-right"
                          from="${Poi.list()}"
                          optionValue="name"
                          optionKey="id"
                          multiple="true"/>
            </div>

            <div class="form-group">
                <g:submitButton name="create" class="save btn btn-primary"
                                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </div>

        </g:uploadForm>
    </div>
</div>
</body>
</html>
