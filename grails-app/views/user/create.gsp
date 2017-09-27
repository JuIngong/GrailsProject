<%@ page import="grailsproject.Role" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="create-user" class="content scaffold-create" role="main">
            <h1>Créer un utilisateur</h1>

            <g:if test="${flash.message}">
                <div class="alert alert-success" role="status">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <div class="col-lg-4">
                <g:form resource="${this.user}" method="POST">
                    <div class="form-group">
                        <label for="username">Nom Utilisateur</label>
                        <g:textField id="username" name="username" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="password">Mot de passe</label>
                        <g:passwordField id="password" name="password" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="role">Role</label>
                        <g:select id="role" name="role" class="form-control"
                                  from="${Role.list()}"
                                  optionValue="authority"
                                  optionKey="id" />
                    </div>

                    <div class="form-group">
                        <g:submitButton name="create" class="save btn btn-primary"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </div>
                </g:form>
            </div>
        </div>
    </body>
</html>
