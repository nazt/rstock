package rstock

class KindController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [kindInstanceList: Kind.list(params), kindInstanceTotal: Kind.count()]
    }

    def create = {
        def kindInstance = new Kind()
        kindInstance.properties = params
        return [kindInstance: kindInstance]
    }

    def save = {
        def kindInstance = new Kind(params)
        if (kindInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'kind.label', default: 'Kind'), kindInstance.id])}"
            redirect(action: "show", id: kindInstance.id)
        }
        else {
            render(view: "create", model: [kindInstance: kindInstance])
        }
    }

    def show = {
        def kindInstance = Kind.get(params.id)
        if (!kindInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'kind.label', default: 'Kind'), params.id])}"
            redirect(action: "list")
        }
        else {
            [kindInstance: kindInstance]
        }
    }

    def edit = {
        def kindInstance = Kind.get(params.id)
        if (!kindInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'kind.label', default: 'Kind'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [kindInstance: kindInstance]
        }
    }

    def update = {
        def kindInstance = Kind.get(params.id)
        if (kindInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (kindInstance.version > version) {
                    
                    kindInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'kind.label', default: 'Kind')] as Object[], "Another user has updated this Kind while you were editing")
                    render(view: "edit", model: [kindInstance: kindInstance])
                    return
                }
            }
            kindInstance.properties = params
            if (!kindInstance.hasErrors() && kindInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'kind.label', default: 'Kind'), kindInstance.id])}"
                redirect(action: "show", id: kindInstance.id)
            }
            else {
                render(view: "edit", model: [kindInstance: kindInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'kind.label', default: 'Kind'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def kindInstance = Kind.get(params.id)
        if (kindInstance) {
            try {
                kindInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'kind.label', default: 'Kind'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'kind.label', default: 'Kind'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'kind.label', default: 'Kind'), params.id])}"
            redirect(action: "list")
        }
    }
}
