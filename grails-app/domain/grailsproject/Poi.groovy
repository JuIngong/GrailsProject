package grailsproject

class Poi {

    String name
    String desc

    static hasMany = [images:Image]
    static hasOne = [location:Location, user:User]

    static constraints = {
    }
}
