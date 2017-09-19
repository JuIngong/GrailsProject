

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'grailsproject.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'grailsproject.UserRole'
grails.plugin.springsecurity.authority.className = 'grailsproject.Role'
grails.plugin.springsecurity.logout.postOnly=false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['ROLE_USER', 'ROLE_MODO', 'ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
    [pattern: '/location/create',   access: ['ROLE_ADMIN', 'ROLE_MODO']],
    [pattern: '/location/edit/**',  access: ['ROLE_ADMIN', 'ROLE_MODO']],
    [pattern: '/location/**', 	 access: ['permitAll']],
    [pattern: '/poi/create',     access: ['ROLE_ADMIN', 'ROLE_MODO']],
    [pattern: '/poi/edit/**',    access: ['ROLE_ADMIN', 'ROLE_MODO']],
    [pattern: '/poi/**',         access: ['permitAll']],
    [pattern: '/poigrp/create',  access: ['ROLE_ADMIN', 'ROLE_MODO']],
    [pattern: '/poigrp/edit/**', access: ['ROLE_ADMIN', 'ROLE_MODO']],
    [pattern: '/poigrp/**',      access: ['permitAll']],
    [pattern: '/role/**',        access: ['ROLE_ADMIN']],
    [pattern: '/user/create',    access: ['ROLE_ADMIN']],
    [pattern: '/user/edit/**',   access: ['ROLE_ADMIN']],
    [pattern: '/user/**',        access: ['ROLE_ADMIN']],
    [pattern: '/image/create',     access: ['ROLE_ADMIN', 'ROLE_MODO']],
    [pattern: '/image/edit/**',    access: ['ROLE_ADMIN', 'ROLE_MODO']],
    [pattern: '/image/**',       access: ['permitAll']],
    [pattern: '/userrole/**',    access: ['ROLE_ADMIN']],
		[pattern: '/dbconsole/**', access: ['ROLE_ADMIN']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

