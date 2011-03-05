package rstock

class RiceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [riceInstanceList: Rice.list(params), riceInstanceTotal: Rice.count()]
    }

    def create = {
        def riceInstance = new Rice()
        riceInstance.properties = params
        return [riceInstance: riceInstance]
    }

    def save = {
        def riceInstance = new Rice(params)
        if (riceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'rice.label', default: 'Rice'), riceInstance.id])}"
            redirect(action: "show", id: riceInstance.id)
        }
        else {
            render(view: "create", model: [riceInstance: riceInstance])
        }
    }

    def show = {
        def riceInstance = Rice.get(params.id)
        if (!riceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rice.label', default: 'Rice'), params.id])}"
            redirect(action: "list")
        }
        else {
            [riceInstance: riceInstance]
        }
    }

    def edit = {
        def riceInstance = Rice.get(params.id)
        if (!riceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rice.label', default: 'Rice'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [riceInstance: riceInstance]
        }
    }

    def update = {
        def riceInstance = Rice.get(params.id)
        if (riceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (riceInstance.version > version) {
                    
                    riceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'rice.label', default: 'Rice')] as Object[], "Another user has updated this Rice while you were editing")
                    render(view: "edit", model: [riceInstance: riceInstance])
                    return
                }
            }
            riceInstance.properties = params
            if (!riceInstance.hasErrors() && riceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'rice.label', default: 'Rice'), riceInstance.id])}"
                redirect(action: "show", id: riceInstance.id)
            }
            else {
                render(view: "edit", model: [riceInstance: riceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rice.label', default: 'Rice'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def riceInstance = Rice.get(params.id)
        if (riceInstance) {
            try {
                riceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'rice.label', default: 'Rice'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'rice.label', default: 'Rice'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rice.label', default: 'Rice'), params.id])}"
            redirect(action: "list")
        }
    }
}
