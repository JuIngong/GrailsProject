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

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img class="first-slide" src="${path+"/poiGrp"+poiGrp.id+"/" +poiGrp.image}" alt="First slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>${poiGrp.name}</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-4">

        %{--<div class="form-group">--}%
            %{--<label for="name">Nom</label>--}%
            %{--<input id="name" type="text" class="form-control" readonly="" value="${poiGrp.name}">--}%
        %{--</div>--}%

        %{--<div class="form-group">--}%
            %{--<label for="image">Image</label>--}%
            %{--<input id="image" type="text" class="form-control" readonly="" value="${poiGrp?.image}">--}%
        %{--</div>--}%

        <div class="form-group">
            <label>Point d'intéret</label>

            <div id="map" style="height: 400px; width: 200%;"></div>
        </div>

        <div class="form-group">

            <g:form resource="${this.poiGrp}" method="DELETE">
                <g:link class="edit btn btn-success" action="edit" resource="${this.poiGrp}"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
                <input class="delete btn btn-danger" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </g:form>
        </div>

    </div>

</div>
<g:javascript>
    function initMap() {
    if(${raw(pois as java.lang.String)}.length != 0){
        let latlngs = ${raw(pois as java.lang.String)}

    var myLatLng = {lat: latlngs[0].lat*1, lng: latlngs[0].lng*1};

    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11,
        center: myLatLng
    });
    latlngs.forEach(function(element) {
        var link = '<g:createLink controller="poi" action="show"/>'
        var contentString = "<dt>"
            + "<a href='" + link+ "/" + element.id+"'>" + element.name +"</a>"
            + "<dt>"
            + "<dd>"+ element.desc +" </dd>";

        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });


        var marker = new google.maps.Marker({
            position: {lat:element.lat*1, lng:element.lng*1},
            map: map,
            title: element.name
        });

        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
;
});

}
}

</g:javascript>
<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_h0NTkL2FJoMf1gtYmXyBDsQfLK4etwA&callback=initMap"></script>
</body>
</html>
