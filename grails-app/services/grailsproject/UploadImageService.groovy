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

        def filename = []
        image.each {
            filename.add(it.originalFilename)
        }
        def folderPath = "${cdnFolder}/poi${poi.id}" as String
        def folder = new File(folderPath)
        if ( !folder.exists() ) {
            folder.mkdirs()
        }

        image.each {
            def path = "${folderPath}/${it.originalFilename}" as String
            it.transferTo(new File(path))
        }

        def p = poiService.updateFeaturedImageUrl(poi.id, filename)

        if ( !p || p.hasErrors() ) {
            def f = new File(path)
            f.delete()
        }
        p
    }

    @SuppressWarnings('JavaIoPackageAccess')
    Poi delPoiImage(Poi poi, def image) {

        def folderPath = "${cdnFolder}/poi${poi.id}" as String

        def poiI = poiService.delFeaturedImageUrl(poi.id, image)

        if ( !poiI.hasErrors() ) {
            def f = new File("${folderPath}/${image}")
            f.delete()
        }

        poiI
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
