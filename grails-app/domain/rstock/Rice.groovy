package rstock

class Rice {
    static belongsTo = [person:Person, kind:Kind]
    Date gather
    Float humidity
    Float weigth
    String place
    Float amount
    Float price



    static constraints = {
      person(blank: false)
    }
}
