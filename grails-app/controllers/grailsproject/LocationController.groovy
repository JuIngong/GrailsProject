package grailsproject

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LocationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Location.list(params), model:[locationCount: Location.count()]
    }

    def show(Location location) {
        respond location
    }

    def create() {
        respond new Location(params)
    }

    @Transactional
    def save(Location location) {
        if (location == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (location.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond location.errors, view:'create'
            return
        }

        location.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'location.label', default: 'Location'), location.id])
                redirect location
            }
            '*' { respond location, [status: CREATED] }
        }
    }

    def edit(Location location) {
        respond location
    }

    @Transactional
    def update(Location location) {
        if (location == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (location.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond location.errors, view:'edit'
            return
        }

        location.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'location.label', default: 'Location'), location.id])
                redirect location
            }
            '*'{ respond location, [status: OK] }
        }
    }

    @Transactional
    def delete(Location location) {

        if (location == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        location.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'location.label', default: 'Location'), location.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
