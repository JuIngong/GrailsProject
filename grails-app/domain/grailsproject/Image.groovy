package grailsproject

class Image {

    String fileName

    static belongsTo = [Poi, PoiGrp]

    static constraints = {
    }
}
