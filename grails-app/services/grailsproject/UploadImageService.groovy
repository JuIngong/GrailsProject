package grailsproject

import grails.config.Config
import grails.core.support.GrailsConfigurationAware
import grails.gorm.transactions.Transactional

@Transactional
class UploadImageService implements GrailsConfigurationAware{

    def poiGrpService
    def poiService
    String cdnFolder
    String cdnRootUrl

    @Override
    void setConfiguration(Config co) {
        cdnFolder = co.getRequiredProperty('grails.guides.cdnFolder')
        cdnRootUrl = co.getRequiredProperty('grails.guides.cdnRootUrl')
    }

    @SuppressWarnings('JavaIoPackageAccess')
    Poi uploadPoiImage(Poi poi, def image) {

        String filename = image.originalFilename
        def folderPath = "${cdnFolder}/poi${poi.id}" as String
        def folder = new File(folderPath)
        if ( !folder.exists() ) {
            folder.mkdirs()
        }
        def path = "${folderPath}/${filename}" as String
        image.transferTo(new File(path))

        def p = poiService.updateFeaturedImageUrl(poi.id, filename)

        if ( !p || p.hasErrors() ) {
            def f = new File(path)
            f.delete()
        }
        p
    }
    @SuppressWarnings('JavaIoPackageAccess')
    PoiGrp uploadPoiGrpImage(PoiGrp poiGrp, def image) {

        String filename = image.originalFilename
        def folderPath = "${cdnFolder}/poiGrp${poiGrp.id}" as String
        def folder = new File(folderPath)
        if ( !folder.exists() ) {
            folder.mkdirs()
        }
        def path = "${folderPath}/${filename}" as String
        image.transferTo(new File(path))

        def poi = poiGrpService.updateFeaturedImageUrl(poiGrp.id, filename)

        if ( !poi || poi.hasErrors() ) {
            def f = new File(path)
            f.delete()
        }
        poi
    }

}
