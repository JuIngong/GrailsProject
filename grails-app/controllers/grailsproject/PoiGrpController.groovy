package grailsproject

import grails.converters.JSON
import grails.util.Holders

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoiGrpController {

    def uploadImageService

    static allowedMethods = [update: ["POST", "PUT"], save: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PoiGrp.list(params), model: [poiGrpCount: PoiGrp.count()]
    }

    def show(PoiGrp poiGrp) {
        def pois = poiGrp.pois as JSON
        def path = Holders.config.getRequiredProperty('grails.guides.cdnRootUrl')
        respond poiGrp, model: [pois: pois, path: path]
    }

    def create() {
        respond new PoiGrp(params)
    }

    @Transactional
    def save(PoiGrp poiGrp) {
        if (poiGrp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poiGrp.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poiGrp.errors, view: 'create'
            return
        }

        poiGrp = poiGrp.save flush: true

        if (params.imageGrp.originalFilename != "") {
            uploadImageService.uploadPoiGrpImage(poiGrp, params.imageGrp)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poiGrp.label', default: 'PoiGrp'), poiGrp.id])
                redirect poiGrp
            }
            '*' { respond poiGrp, [status: CREATED] }
        }
    }

    def edit(PoiGrp poiGrp) {
        def path = Holders.config.getRequiredProperty('grails.guides.cdnRootUrl')
        respond poiGrp, model: [path: path]
    }

    @Transactional
    def update(PoiGrp poiGrp) {
        if (poiGrp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poiGrp.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poiGrp.errors, view: 'edit'
            return
        }

        if (params.imageGrp.originalFilename != "") {
            uploadImageService.uploadPoiGrpImage(poiGrp, params.imageGrp)
        } else {
            poiGrp.save(flush: true)
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'poiGrp.label', default: 'PoiGrp'), poiGrp.id])
                redirect poiGrp
            }
            '*' { respond poiGrp, [status: OK] }
        }
    }

    @Transactional
    def delete(PoiGrp poiGrp) {

        if (poiGrp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        uploadImageService.delPoiGrpImage(poiGrp)

        poiGrp.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'poiGrp.label', default: 'PoiGrp'), poiGrp.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poiGrp.label', default: 'PoiGrp'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
