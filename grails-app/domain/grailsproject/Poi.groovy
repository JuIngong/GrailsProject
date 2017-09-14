package grailsproject

class Poi {

    String name
    Location location
    String desc

    static hasMany = [images:Image]

    static constraints = {
    }
}
