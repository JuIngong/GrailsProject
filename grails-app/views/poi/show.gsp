<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div id="show-poi" class="col-lg-12" role="main">
    <h1 class="page-header"><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message alert alert-success" role="status">${flash.message}</div>
    </g:if>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
        <div class="container">
            <div class="carousel-caption">
                <h1>${poi.name}</h1>
            </div>
        </div>
            <g:each status="i" in="${poi.images}" var="image">
                <li data-target="#myCarousel" data-slide-to="${i}" class="${i == 0 ? 'active' : ''}"></li>
            </g:each>

        </ol>

        <div class="carousel-inner" role="listbox">
            <g:each status="i" in="${poi.images}" var="image">
                <div class="item ${i == 0 ? 'active' : ''}">
                    <img class="first-slide" src="${path + "/poi" + poi.id + "/" + image}" alt="First slide">
                </div>
            </g:each>

        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="col-lg-4">
        %{--<div class="form-group">--}%
        %{--<label for="name">Nom</label>--}%
        %{--<input id="name" type="text" class="form-control" readonly value="${poi.name}"/>--}%
        %{--</div>--}%

        <div class="form-group">
            <label for="desc">Description</label>
            <input id="desc" class="form-control" readonly style="resize: vertical" value="${poi?.desc}"/>
        </div>

        %{--<div class="form-group">--}%
        %{--<label>Images</label>--}%
        %{--<g:each in="${poi.images}" var="imgs">--}%
        %{--<p>${imgs}</p>--}%
        %{--</g:each>--}%
        %{--</div>--}%

        <div class="form-group">
            <label>Groupe de point d'intéret</label>
            <ul>
                <g:each in="${poi.poiGrp}" var="grp">
                    <li><a href= <g:createLink controller="poiGrp" action="show"
                                               params="[id: grp.id]"/>>${grp.name}</a>
                    </li>
                </g:each>
            </ul>
        </div>

        <div class="form-group">
            <label for="map">Localisation</label>

            <div id="map" style="height: 400px; width: 200%;"></div>
        </div>

        <div class="form-group">
            <g:form resource="${this.poi}" method="DELETE">
                <g:link class="edit btn btn-success" action="edit" resource="${this.poi}"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
                <input class="delete btn btn-danger" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>

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


    }
    </g:javascript>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_h0NTkL2FJoMf1gtYmXyBDsQfLK4etwA&callback=initMap"></script>
</body>
</html>
