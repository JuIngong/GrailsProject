<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div id="account-user" class="content scaffold-account" role="main">
    <h1>Mon compte</h1>
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
        <g:form url="[controller:'user',action:'updateMe']" resource="${this.user}" method="PUT">
            <g:hiddenField name="version" value="${this.user?.version}" />

            <div class="form-group">
                <label for="username">Nom Utilisateur</label>
                <g:textField id="username" name="username" class="form-control" value="${user.username}" />
            </div>

            <div class="form-group">
                <g:submitButton name="save" class="save btn btn-primary"
                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
