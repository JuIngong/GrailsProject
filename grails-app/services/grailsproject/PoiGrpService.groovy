package grailsproject

import grails.gorm.transactions.Transactional

@Transactional
class PoiGrpService {

    @Transactional
    PoiGrp updateFeaturedImageUrl(Long id, String featuredImageUrl) {
        PoiGrp poiGrp = PoiGrp.get(id)
        if ( !poiGrp ) {
            return null
        }
        poiGrp.image = featuredImageUrl
        poiGrp.save(flush:true)
    }
}
