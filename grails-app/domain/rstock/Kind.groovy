package rstock

class Kind {
    String name
    String toString() {
        return "$name"
    }
    static constraints = {
      name(blank: false, unique: true)
    }
}
