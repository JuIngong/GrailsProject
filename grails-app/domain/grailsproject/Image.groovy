package grailsproject

class Image {

    String fileName

    static constraints = {
        fileName blank: false
    }

    static belongsTo = [Poi]
}
