package grailsproject

class PoiGrp {

    String name
    Image image

    static hasMany = [pois:Poi]


    static constraints = {
        pois nullable: true
        name blank: false
        image nullable: true
    }

    static mapping = {
        image cascade:"all-delete-orphan"
    }
}
