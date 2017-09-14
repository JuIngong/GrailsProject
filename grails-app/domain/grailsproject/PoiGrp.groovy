package grailsproject

class PoiGrp {

    String name
    Image image

    static hasMany = [pois:Poi]

    static constraints = {
    }
}
