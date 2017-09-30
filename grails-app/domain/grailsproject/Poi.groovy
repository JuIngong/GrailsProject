package grailsproject

class Poi {

    String name
    String desc
    User user
    String lat
    String lng
    Date dateCreated
    Date lastUpdated

    static hasMany = [images:String, poiGrp:PoiGrp]
    static belongsTo = PoiGrp

    static constraints = {
        name blank: false, maxSize: 200
        desc nullable: true
        images nullable: true
        dateCreated nullable: true
        lastUpdated nullable: true

    }

    static mapping = {
        desc type: "text"
    }
}
