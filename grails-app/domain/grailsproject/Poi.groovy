package grailsproject

class Poi {

    String name
    String desc
    User user
    Location location

    static hasMany = [images:Image, poiGrp:PoiGrp]
    static belongsTo = PoiGrp

    static constraints = {
    }
}
