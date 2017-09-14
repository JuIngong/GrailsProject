

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'grailsproject.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'grailsproject.UserRole'
grails.plugin.springsecurity.authority.className = 'grailsproject.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/location/**',               access: ['permitAll']],
	[pattern: '/poi/**',               access: ['permitAll']],
	[pattern: '/poigrp/**',               access: ['permitAll']],
	[pattern: '/role/**',               access: ['permitAll']],
	[pattern: '/user/**',               access: ['permitAll']],
	[pattern: '/image/**',               access: ['permitAll']],
	[pattern: '/userrole/**',               access: ['permitAll']],
	[pattern: '/**/**',               access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

