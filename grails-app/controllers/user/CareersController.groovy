package user

class CareersController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [careersInstanceList: Careers.list(params), careersInstanceTotal: Careers.count()]
    }

    def create = {
        def careersInstance = new Careers()
        careersInstance.properties = params
        return [careersInstance: careersInstance]
    }

    def save = {
        def careersInstance = new Careers(params)
        if (careersInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'careers.label', default: 'Careers'), careersInstance.id])}"
            redirect(action: "show", id: careersInstance.id)
        }
        else {
            render(view: "create", model: [careersInstance: careersInstance])
        }
    }

    def show = {
        def careersInstance = Careers.get(params.id)
        if (!careersInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'careers.label', default: 'Careers'), params.id])}"
            redirect(action: "list")
        }
        else {
            [careersInstance: careersInstance]
        }
    }

    def edit = {
        def careersInstance = Careers.get(params.id)
        if (!careersInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'careers.label', default: 'Careers'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [careersInstance: careersInstance]
        }
    }

    def update = {
        def careersInstance = Careers.get(params.id)
        if (careersInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (careersInstance.version > version) {
                    
                    careersInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'careers.label', default: 'Careers')] as Object[], "Another user has updated this Careers while you were editing")
                    render(view: "edit", model: [careersInstance: careersInstance])
                    return
                }
            }
            careersInstance.properties = params
            if (!careersInstance.hasErrors() && careersInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'careers.label', default: 'Careers'), careersInstance.id])}"
                redirect(action: "show", id: careersInstance.id)
            }
            else {
                render(view: "edit", model: [careersInstance: careersInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'careers.label', default: 'Careers'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def careersInstance = Careers.get(params.id)
        if (careersInstance) {
            try {
                careersInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'careers.label', default: 'Careers'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'careers.label', default: 'Careers'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'careers.label', default: 'Careers'), params.id])}"
            redirect(action: "list")
        }
    }
}
