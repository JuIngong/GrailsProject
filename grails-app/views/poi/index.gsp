<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#list-poi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
<div id="list-poi" class="col-lg-12" role="main">
    <h1 class="page-header"><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
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
                                <th>Description</th>
                                <th>Ville</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${poiList}" var="poi">
                                <tr>
                                    <td>${poi.id}</td>
                                    <td><a href= <g:createLink controller="poi" action="show"
                                                               params="[id: poi.id]"/>>${poi.name}</a></td>
                                    <td>${poi.desc}</td>
                                    <td>${poi.location.ville}</td>
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
                                   value="${((poiCount % m) == 0) ? (Integer) (poiCount / m) : (Integer) (poiCount / m) + 1}"/>

                            <li class="paginate_button previous ${page == 0 ? 'disabled' : ''}">
                                <a href= <g:createLink controller="poi" action="index"
                                                       params="[offset: page == 0 ? 0 : (page - 1) * m, max: m]"/>>Previous</a>
                            </li>
                            <g:each var="i" in="${(0..ma - 1)}">
                                <li class="paginate_button ${page == i ? 'active' : ''}">
                                    <a href= <g:createLink controller="poi" action="index"
                                                           params="[offset: i * m, max: m]"/>>${i + 1}</a>
                                </li>
                            </g:each>
                            <li class="paginate_button next ${page == ma - 1 ? 'disabled' : ''}">
                                <a href= <g:createLink controller="poi" action="index"
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