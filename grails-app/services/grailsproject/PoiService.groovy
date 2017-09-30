package grailsproject

import grails.gorm.transactions.Transactional

@Transactional
class PoiService {

    def addPoiToPoiGrp(Poi poi) {
        poi.poiGrp.each {
            poiGrp ->
                poi.addToPoiGrp(poiGrp)
        }
    }

    def updatePoiToPoiGrp(Poi poi, def test) {
        delAllPoiToPoiGrp(poi)
        test.each {
            PoiGrp.get(it).addToPois(poi)
        }
    }

    def delAllPoiToPoiGrp(Poi poi) {
        def tmp = []
        tmp.addAll(poi.poiGrp)
        tmp.each {
            poiGrp ->
                poi.removeFromPoiGrp(poiGrp)
        }
    }

    @Transactional
    Poi updateFeaturedImageUrl(Long id, List<String> featuredImageUrl) {
        Poi poi = Poi.get(id)
        if ( !poi ) {
            return null
        }
        featuredImageUrl.each {
            poi.addToImages(it)
        }

        poi.save(flush:true)
    }
}
