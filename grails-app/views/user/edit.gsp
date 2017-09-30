<%@ page import="grailsproject.Role" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-user" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message alert alert-success" role="status">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <div class="col-lg-4">
                <g:form resource="${this.user}" method="PUT">
                    <g:hiddenField name="version" value="${this.user?.version}" />
                    <div class="form-group">
                        <label for="username">Nom Utilisateur</label>
                        <g:textField id="username" name="username" class="form-control" value="${user.username}" />
                    </div>

                    <sec:ifAnyGranted roles='ROLE_ADMIN'>
                    <div class="form-group">
                            <label for="role">Role</label>
                            <g:select id="role" name="role" class="form-control" value="${user.getAuthorities()[0].id}"
                                      from="${Role.list()}"
                                      optionValue="authority"
                                      optionKey="id" />
                        </div>
                    </sec:ifAnyGranted>

                    <div class="user-check">
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
                    </div>
                    <div class="form-group">
                        <g:submitButton name="save" class="save btn btn-primary"
                                        value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                    </div>

                    <!--<fieldset class="buttons">
                        <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>-->
                </g:form>
            </div>
        </div>
    </body>
</html>
