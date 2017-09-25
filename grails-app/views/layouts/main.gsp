<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <script src="https://use.fontawesome.com/9fd9b016c3.js"></script>


    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>
<div id="wrapper">

    <!-- Navigation -->

    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${createLink(uri: '/')}">Grails Project</a>
        </div>
    <!-- /.navbar-header -->
        <sec:ifLoggedIn>
            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href=<g:createLink controller="user" action="account"/>><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href= <g:createLink controller="logout" action="index"/>><i
                                class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODO">
                            <li>
                                <a href="#"><i class="fa fa-users fa-fw"></i> Utilisateurs<span class="fa arrow"></span>
                                </a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href= <g:createLink controller="user" action="index"/>>Liste utilisateurs</a>
                                    </li>
                                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                                        <li>
                                            <a href= <g:createLink controller="user"
                                                                   action="create"/>>Creer utilisateur</a>
                                        </li>
                                    </sec:ifAnyGranted>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                        </sec:ifAnyGranted>
                        <li>
                            <a href="#"><i class="fa fa-map-marker fa-fw"></i> POI<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href= <g:createLink controller="poi" action="index"/>>Liste POIs</a>
                                </li>
                                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODO">
                                    <li>
                                        <a href= <g:createLink controller="poi" action="create"/>>Creer POI</a>
                                    </li>
                                </sec:ifAnyGranted>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-globe fa-fw"></i> Groupe de POIs<span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href= <g:createLink controller="poiGrp"
                                                           action="index"/>>Liste des groupes de POIs</a>
                                </li>
                                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODO">
                                    <li>
                                        <a href= <g:createLink controller="poiGrp"
                                                               action="create"/>>Creer groupe de POIs</a>
                                    </li>
                                </sec:ifAnyGranted>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </sec:ifLoggedIn>
    </nav>

    <sec:ifLoggedIn>
        <div id="page-wrapper">
    </sec:ifLoggedIn>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <g:layoutBody/>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
<!-- /.container-fluid -->
    <sec:ifLoggedIn>
        </div>
    </sec:ifLoggedIn>

</div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>



<asset:javascript src="application.js"/>

</body>
</html>
