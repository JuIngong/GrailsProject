package grailsproject

import grails.gorm.transactions.Transactional

@Transactional
class PoiService {

    def addPoiToPoiGrp(Poi poi) {
        poi.poiGrp.each {
            poiGrp ->
                poiGrp.addToPois(poi)
        }
    }

    def delAllPoiToPoiGrp(Poi poi) {
        poi.poiGrp.each {
            poiGrp ->
                poiGrp.removeFromPois(poi)
        }
    }
}
