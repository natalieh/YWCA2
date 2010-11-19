package user

class BioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bioInstanceList: Bio.list(params), bioInstanceTotal: Bio.count()]
    }

    def create = {
        def bioInstance = new Bio()
        bioInstance.properties = params
        return [bioInstance: bioInstance]
    }

    def save = {
        def bioInstance = new Bio(params)
        if (bioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bio.label', default: 'Bio'), bioInstance.id])}"
            redirect(action: "show", id: bioInstance.id)
        }
        else {
            render(view: "create", model: [bioInstance: bioInstance])
        }
    }

    def show = {
        def bioInstance = Bio.get(params.id)
        if (!bioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bio.label', default: 'Bio'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bioInstance: bioInstance]
        }
    }

    def edit = {
		def userInstance = User.get(params.id)
		def bioInstance = userInstance.getBio()
        return [bioInstance: bioInstance]
    }

    def update = {
        def bioInstance = Bio.get(params.id)
        if (bioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bioInstance.version > version) {
                    
                    bioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bio.label', default: 'Bio')] as Object[], "Another user has updated this Bio while you were editing")
                    render(view: "edit", model: [bioInstance: bioInstance])
                    return
                }
            }
            bioInstance.properties = params
            if (!bioInstance.hasErrors() && bioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bio.label', default: 'Bio'), bioInstance.id])}"
                redirect(action: "show", id: bioInstance.id)
            }
            else {
                render(view: "edit", model: [bioInstance: bioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bio.label', default: 'Bio'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bioInstance = Bio.get(params.id)
        if (bioInstance) {
            try {
                bioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bio.label', default: 'Bio'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bio.label', default: 'Bio'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bio.label', default: 'Bio'), params.id])}"
            redirect(action: "list")
        }
    }
}
