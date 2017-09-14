package grailsproject

class PoiGrp {

    String name

    static hasOne = [image:Image]
    static hasMany = [pois:Poi]

    static constraints = {
    }
}
