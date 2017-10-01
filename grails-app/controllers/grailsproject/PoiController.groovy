package grailsproject

import grails.util.Holders

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoiController {

    def springSecurityService
    def poiService
    def uploadImageService

    static allowedMethods = [save: "POST", update: ["PUT", "POST"], delete: "DELETE", deleteImg: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Poi.list(params), model: [poiCount: Poi.count()]
    }

    def show(Poi poi) {

        def path = Holders.config.getRequiredProperty('grails.guides.cdnRootUrl')
        respond poi, model: [path: path]
    }

    def create() {
        respond new Poi(params)
    }

    @Transactional
    def save(Poi poi) {
        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poi.errors, view: 'create'
            return
        }


        if (poi.user.id != springSecurityService.getCurrentUser().id) {
            poi.user = User.get(springSecurityService.getCurrentUser().id)
        }

        poiService.addPoiToPoiGrp(poi)

        poi = poi.save flush: true

        if (params.imagesPoi != "") {
            uploadImageService.uploadPoiImage(poi, params.imagesPoi)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poi.label', default: 'Poi'), poi.id])
                redirect poi
            }
            '*' { respond poi, [status: CREATED] }
        }
    }

    def edit(Poi poi) {

        def path = Holders.config.getRequiredProperty('grails.guides.cdnRootUrl')
        respond poi, model: [path: path]
    }

    @Transactional
    def update(Poi poi) {
        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if (poi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poi.errors, view: 'edit'
            return
        }

        if (poi.user.id != springSecurityService.getCurrentUser().id) {
            poi.user = User.get(springSecurityService.getCurrentUser().id)
        }


        poiService.updatePoiToPoiGrp(poi, params.poiGrp)


        if (params.imagesPoi != "") {
            uploadImageService.uploadPoiImage(poi, params.imagesPoi)
        } else {
            poiGrp.save(flush: true)
        }

        poi.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'poi.label', default: 'Poi'), poi.id])
                redirect poi
            }
            '*' { respond poi, [status: OK] }
        }
    }

    @Transactional
    def deleteImg(Poi poi) {
        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        uploadImageService.delPoiImage(poi, params.imgs)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'poi.label', default: 'Poi'), params.imgs])
                redirect action: "edit", method: "GET", id: poi.id
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Transactional
    def delete(Poi poi) {
        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        poiService.delAllPoiToPoiGrp(poi)

        uploadImageService.delAllPoiImage(poi)

        poi.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'poi.label', default: 'Poi'), poi.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poi.label', default: 'Poi'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
