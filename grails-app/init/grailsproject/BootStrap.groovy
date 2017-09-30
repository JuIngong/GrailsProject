package grailsproject

class BootStrap {

    def init = { servletContext ->
        if (Role.count == 0) {
            def roleAdmin = new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            def roleModo = new Role(authority: 'ROLE_MODO').save(flush: true, failOnError: true)
            def roleUser = new Role(authority: 'ROLE_USER').save(flush: true, failOnError: true)

            def userInstance = new User(password: 'user', username: 'user').save(flush: true, failOnError: true)
            def modoInstance = new User(password: 'modo', username: 'modo').save(flush: true, failOnError: true)
            def adminInstance = new User(password: 'admin', username: 'admin').save(flush: true, failOnError: true)

            UserRole.create(userInstance, roleUser, true)
            UserRole.create(modoInstance, roleModo, true)
            UserRole.create(adminInstance, roleAdmin, true)

            def listPoiGrp = []

            (1..3).each { listPoiGrp.add(new PoiGrp(name: 'groupe' + it, image: 'illustration' + it).save()) }
            listPoiGrp.each { PoiGrp grp ->
                (1..5).each {
                    def poi = new Poi(name: 'poi ' + it + grp.id, desc: 'desc ' + it, user: adminInstance,
                            lat: '12', lng: '13')
                            .addToImages('testeee ' + it)
                    grp.addToPois(poi).save()
                }

            }

        }

    }
    def destroy = {
    }
}
