<%@ page import="grailsproject.PoiGrp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div id="edit-poi" class="col-lg-12" role="main">
    <h1 class="page-header"><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
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
        <g:form resource="${this.poi}" method="PUT">
            <g:hiddenField name="version" value="${this.poi?.version}"/>

            <div class="form-group">
                <label for="name">Nom</label>
                <g:textField id="name" type="text" class="form-control" name="name" value="${poi.name}"/>
            </div>

            <div class="form-group">
                <label for="desc">Description</label>
                <g:textArea id="desc" class="form-control" name="desc" style="resize: vertical" value="${poi?.desc}"/>
            </div>

            <div class="form-group">
                <label for="image">Images</label>
                <g:each in="${poi.images}" var="imgs">
                    <p>${imgs.fileName}</p>
                </g:each>
                <input id="image" type="file">
            </div>

            <div class="form-group">
                <label for="poiGrp">Groupe de point d'intéret</label>
                <g:select id="poiGrp" name="poiGrp" class="multiple-select col-lg-11 no-padding-left no-padding-right"
                          from="${PoiGrp.list()}"
                          value="${poi?.poiGrp*.id}"
                          optionValue="name"
                          optionKey="id"
                          multiple="true"/>
            </div>

            <div class="form-group">
                <label for="map">Localisation</label>

                <div id="map" style="height: 400px; width: 200%;"></div>
                <g:hiddenField id="lng" name="lng" value="${poi.lng}"/>
                <g:hiddenField id="lat" name="lat" value="${poi.lat}"/>
            </div>

            <g:hiddenField name="user" value="${sec.loggedInUserInfo(field: 'id')}"/>

            <div class="form-group">
                <g:submitButton name="save" class="save btn btn-primary"
                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            </div>
        </g:form>
    </div>
</div>
<g:javascript>
    function initMap() {
        var myLatLng = {lat: "${poi.lat}"*1, lng: "${poi.lng}"*1};

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 11,
            center: myLatLng
        });

        let marker = new google.maps.Marker({
                position: myLatLng,
                map: map
            });

        google.maps.event.addListener(map, "click", function (e) {

            //lat and lng is available in e object
            var myLatLng = e.latLng;
                marker.setMap(null);
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
