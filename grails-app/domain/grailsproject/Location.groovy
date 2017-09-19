package grailsproject

class Location {

    Double lat
    Double lon
    String adresse
    String cp
    String ville

    static belongsTo = Poi

    static constraints = {
        lat nullable: true
        lon nullable: true
        adresse blank: false, maxSize: 200
        cp blank: false, maxSize: 5
        ville blank: false, maxSize: 200
    }
}
