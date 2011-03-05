package rstock

class Person {
    String name
    String surname
    String telephone
    String toString() {
        return "$name - $surname"
    }
    static constraints = {
      name(blank:false)
      surname(blank:false)
    }
}
