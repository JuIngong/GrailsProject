package grailsproject

class Poi {

    String name
    String desc
    User user
    Location location
    Date creation
    Date lastEdit

    static hasMany = [images:Image, poiGrp:PoiGrp]
    static belongsTo = PoiGrp

    static constraints = {
        name blank: false, maxSize: 200
        desc nullable: true
        images nullable: true
        creation nullable: true
        lastEdit nullable: true

    }

    static mapping = {
        desc type: "text"
    }
}
