<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poiGrp.label', default: 'PoiGrp')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div id="show-poiGrp" class="col-lg-12" role="main">
    <h1 class="page-header"><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>

    <div class="col-lg-4">

        <div class="form-group">
            <label for="name">Nom</label>
            <input id="name" type="text" class="form-control" readonly="" value="${poiGrp.name}">
        </div>

        <div class="form-group">
            <label for="image">Image</label>
            <input id="image" type="text" class="form-control" readonly="" value="${poiGrp.image?.fileName}">
        </div>

        <div class="form-group">
            <label>Point d'intéret</label>
            <ul>
                <g:each in="${poiGrp.pois}" var="poi">
                    <li><a href= <g:createLink controller="poi" action="show"
                                               params="[id: poi.id]"/>>${poi.name}</a>
                    </li>
                </g:each>
            </ul>
        </div>

        <div class="form-group">

            <g:form resource="${this.poiGrp}" method="DELETE">
                <g:link class="edit btn btn-success" action="edit" resource="${this.poiGrp}"><g:message code="default.button.edit.label"
                                                                                                        default="Edit"/></g:link>
                <input class="delete btn btn-danger" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </g:form>
        </div>

    </div>

</div>
</body>
</html>
