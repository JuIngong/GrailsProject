<%@ page import="grailsproject.PoiGrp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div id="create-poi" class="col-lg-12" role="main">
    <h1 class="page-header"><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message alert alert-success" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.poi}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.poi}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="col-lg-4">
        <g:form resource="${this.poi}" enctype="multipart/form-data" method="POST">

            <div class="form-group">
                <label for="name">Nom</label>
                <g:textField id="name" type="text" class="form-control" name="name"/>
            </div>

            <div class="form-group">
                <label for="desc">Description</label>
                <g:textArea id="desc" class="form-control" name="desc" style="resize: vertical"/>
            </div>

            <div class="form-group">
                <label for="image">Image</label>
                <input id="image" type="file" name="imagesPoi" accept=".jpg, .jpeg, .png" multiple>
            </div>

            <div class="form-group">
                <label for="poiGrp">Groupe de point d'intéret</label>
                <g:select id="poiGrp" name="poiGrp" class="multiple-select col-lg-11 no-padding-left no-padding-right"
                          from="${PoiGrp.list()}"
                          optionValue="name"
                          optionKey="id"
                          multiple="true" />
            </div>

            <div class="form-group">
                <label for="map">Localisation</label>

                <div id="map" style="height: 400px; width: 200%;"></div>
                <g:hiddenField id="lng" name="lng" value=""/>
                <g:hiddenField id="lat" name="lat" value=""/>
            </div>

            <g:hiddenField name="user" value="${sec.loggedInUserInfo(field:'id')}"/>

            <div class="form-group">
                <g:submitButton name="create" class="save btn btn-primary"
                                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </div>
        </g:form>
    </div>
</div>

<g:javascript>
    function initMap() {
        var myLatLng = {lat: 43.616951, lng: 7.064267};

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 11,
            center: myLatLng
        });

        let marker = null;

        google.maps.event.addListener(map, "click", function (e) {

            //lat and lng is available in e object
            var myLatLng = e.latLng;
            if (marker != null) {
                marker.setMap(null);
            }
            marker = new google.maps.Marker({
                position: myLatLng,
                map: map
            });
            document.getElementById('lat').value = myLatLng.lat();
            document.getElementById('lng').value = myLatLng.lng();
        });


    }
</g:javascript>
<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_h0NTkL2FJoMf1gtYmXyBDsQfLK4etwA&callback=initMap"></script>
</body>
</html>
