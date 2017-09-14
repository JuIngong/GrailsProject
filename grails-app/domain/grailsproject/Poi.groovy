package grailsproject

class Poi {

    String name
    String desc
    User user

    static hasMany = [images:Image]
    static hasOne = [location:Location]

    static constraints = {
    }
}
