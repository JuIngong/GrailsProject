<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-user" class="col-lg-12" role="main">
        <h1 class="page-header">Details utilisateur</h1>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="status">${flash.message}</div>
        </g:if>

        <div class="col-lg-4">

            <div class="form-group">
                <label for="username">Nom Utilisateur</label>
                <input id="username" type="text" class="form-control" readonly="" value="${user.username}">
            </div>

            <div class="form-group">
                <label>Roles</label>
                <g:each in="${user.getAuthorities()}" var="authority">
                    <ul>
                        <li>${authority.getAuthority()}</li>
                    </ul>
                </g:each>
            </div>

            <div class="form-group">
                <g:checkBox id="enabled" name="enabled" readonly="true" value="${user.enabled}" />
                <div class="btn-group">
                    <label for="enabled" class="btn btn-danger">
                        <span class="fa fa-check"></span>
                        <span> </span>
                    </label>
                    <label for="enabled" class="btn btn-default active">
                        Compte actif
                    </label>
                </div>
            </div>

            <div class="form-group">
                <g:checkBox name="accountExpired" id="accountExpired" value="${user.accountExpired}"/>
                <div class="btn-group">
                    <label for="accountExpired" class="btn btn-danger">
                        <span class="fa fa-check"></span>
                        <span> </span>
                    </label>
                    <label for="accountExpired" class="btn btn-default active">
                        Compte expiré
                    </label>
                </div>
            </div>

            <div class="form-group">
                <g:checkBox name="accountLocked" id="accountLocked" value="${user.accountLocked}"/>
                <div class="btn-group">
                    <label for="accountLocked" class="btn btn-danger">
                        <span class="fa fa-check"></span>
                        <span> </span>
                    </label>
                    <label for="accountLocked" class="btn btn-default active">
                        Compte vérouillé
                    </label>
                </div>
            </div>

            <div class="form-group">
                <g:checkBox name="passwordExpired" id="passwordExpired" value="${user.passwordExpired}"/>
                <div class="btn-group">
                    <label for="passwordExpired" class="btn btn-danger">
                        <span class="fa fa-check"></span>
                        <span> </span>
                    </label>
                    <label for="passwordExpired" class="btn btn-default active">
                        Mot de passe expiré
                    </label>
                </div>
            </div>

            <div class="form-group">

                <g:form resource="${this.user}" method="DELETE">
                    <g:link class="edit btn btn-success" action="edit" resource="${this.user}"><g:message code="default.button.edit.label"
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
