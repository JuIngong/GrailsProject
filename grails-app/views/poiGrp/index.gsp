<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poiGrp.label', default: 'PoiGrp')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div id="list-poiGrp" class="col-lg-12" role="main">
    <h1 class="page-header"><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message alert alert-success" role="status">${flash.message}</div>
    </g:if>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel">
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="datable" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Nom</th>
                                <th>Liste de Pois</th>
                                <th>Image</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${poiGrpList}" var="poiGrp">
                                <tr>
                                <td>${poiGrp.id}</td>
                                <td><a href= <g:createLink controller="poiGrp" action="show"
                                                           params="[id: poiGrp.id]"/>>${poiGrp.name}</a></td>
                                <td><ul>
                                    <g:each in="${poiGrp.pois}" var="poi">

                                        <li><a href= <g:createLink controller="poi" action="show"
                                                                   params="[id: poi.id]"/>>${poi.name}</a>
                                        </li>
                                    </g:each>
                                </ul>
                                </td>
                                <td>${poiGrp.image}</td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->

                    <div class="col-lg-9 no-padding-left">
                        <ul class="pagination">
                            <g:set var="off" value="${params.offset ?: 0}"/>
                            <g:set var="m" value="${params.max ?: 10}"/>
                            <g:set var="page" value="${off.toInteger() / m}"/>
                            <g:set var="ma"
                                   value="${((poiGrpCount % m) == 0) ? (Integer) (poiGrpCount / m) : (Integer) (poiGrpCount / m) + 1}"/>

                            <li class="paginate_button previous ${page == 0 ? 'disabled' : ''}">
                                <a href= <g:createLink controller="poiGrp" action="index"
                                                       params="[offset: page == 0 ? 0 : (page - 1) * m, max: m]"/>>Previous</a>
                            </li>
                            <g:each var="i" in="${(0..ma - 1)}">
                                <li class="paginate_button ${page == i ? 'active' : ''}">
                                    <a href= <g:createLink controller="poiGrp" action="index"
                                                           params="[offset: i * m, max: m]"/>>${i + 1}</a>
                                </li>
                            </g:each>
                            <li class="paginate_button next ${page == ma - 1 ? 'disabled' : ''}">
                                <a href= <g:createLink controller="poiGrp" action="index"
                                                       params="[offset: page == ma - 1 ? (ma - 1) * m : (page + 1) * m, max: m]"/>>Next</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.panel-body -->

            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-6 -->
    </div>

</div>
</body>
</html>