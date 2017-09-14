package grailsproject

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ImageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Image.list(params), model:[imageCount: Image.count()]
    }

    def show(Image image) {
        respond image
    }

    def create() {
        respond new Image(params)
    }

    @Transactional
    def save(Image image) {
        if (image == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (image.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond image.errors, view:'create'
            return
        }

        image.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                redirect image
            }
            '*' { respond image, [status: CREATED] }
        }
    }

    def edit(Image image) {
        respond image
    }

    @Transactional
    def update(Image image) {
        if (image == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (image.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond image.errors, view:'edit'
            return
        }

        image.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                redirect image
            }
            '*'{ respond image, [status: OK] }
        }
    }

    @Transactional
    def delete(Image image) {

        if (image == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        image.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
