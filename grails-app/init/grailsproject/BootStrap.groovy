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

            def poiGrp = new PoiGrp(name: 'test', image: new Image(fileName:  'test')).save()
            def loc = new Location(lat:12, lon: 13, adresse: 'te', cp: '04', ville: 'ee').save()
            def poi = new Poi(name: 'test', desc: 'testd', user: userInstance, location: loc)
            .addToImages(new Image(fileName: 'testeee')).save()
            poiGrp.addToPois(poi).save()

        }


    }
    def destroy = {
    }
}
