package user

class UserController {
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def index = {
		redirect(action: "portfolio", params: params)
	}
	
    def portfolio = {
		def userInstance = User.get(params.id)
		if(!userInstance) {
			redirect(action: "create")
		}
		else {
			def bioInstance = userInstance.getBio()
			[userInstance: userInstance, bioInstance: bioInstance]
		}
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def save = {
        def userInstance = new User(params)
        if (userInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
			def bioInstance = new Bio(id: userInstance.id)
			userInstance.setBio bioInstance
			redirect(action: "index", id: userInstance.id)
        }
    }

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")	
		}
        else {
            [userInstance: userInstance]
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "index")
        }
        else {
			def bioInstance = userInstance.getBio()
            render(view:"edit_user", model: [userInstance: userInstance, bioInstance: bioInstance])
        	return [userInstance: userInstance, bioInstance: bioInstance]
		}
    }

    def update = {
        def userInstance = User.get(params.id)
		def bioInstance = userInstance.getBio()
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit_user", model: [userInstance: userInstance, bioInstance: bioInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'user.updated.label')}"
                redirect(action: "portfolio", id: userInstance.id)
            }
            else {
                render(view: "edit_user", model: [userInstance: userInstance, bioInstance: bioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'user.updated.label')}"
            redirect(action: "index")
        }
    }

    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	/*
	 * All Bio methods
	 */
	
	def edit_bio = {
		def userInstance = User.get(params.id)
		def bioInstance = Bio.get(params.id)
		return [userInstance: userInstance, bioInstance: bioInstance]
	}
	
	def save_bio = {
		def bioInstance = new Bio(params)
		def userInstance = User.get(params.id)
		if (bioInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
			userInstance.setBio(bioInstance)
			redirect(action: "index", id: userInstance.id)
		}
		else {
			redirect(action: "index", id: userInstance.id)
		}
	}
	
	def update_bio = {
		def userInstance = User.get(params.id)
		def bioInstance = Bio.get(params.id)
		if (bioInstance) {
			bioInstance.properties = params
			if (!bioInstance.hasErrors() && bioInstance.save(flush: true)) {
				flash.message = "${message(code: 'user.updated.label')}"
				userInstance.setBio(bioInstance)
				redirect(action: "index", id: userInstance.id)
			}
			else {
				redirect(action: "index", id: userInstance.id)
			}
		}
		redirect(view:"index", id: userInstance.id)
	}
	
	/*
	 * All Careers methods
	 */
	
	def careers = {
		def userInstance = User.get(params.id)
		[userInstance: userInstance]
	}
	
}
