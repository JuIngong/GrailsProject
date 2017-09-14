package grailsproject

class PoiGrp {

    String name

    static hasMany = [pois:Poi]
    static belongsTo = [image : Image]

    static constraints = {
        pois nullable: true
    }
}
