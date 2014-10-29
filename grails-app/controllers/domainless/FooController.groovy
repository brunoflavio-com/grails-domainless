package domainless



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FooController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Foo.list(), model:[fooInstanceCount: Foo.count()]
    }

    def show(Foo fooInstance) {
		fooInstance = Foo.find(fooInstance)
        respond fooInstance
    }

    def create() {
        respond new Foo()
    }

    @Transactional
    def save(Foo fooInstance) {
        if (fooInstance == null) {
            notFound()
            return
        }

        if (fooInstance.hasErrors()) {
            respond fooInstance.errors, view:'create'
            return
        }

        Foo.save fooInstance

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'foo.label', default: 'Foo'), fooInstance.id])
                redirect action:'show', id:fooInstance.id
            }
            '*' { respond fooInstance, [status: CREATED] }
        }
    }

    def edit(Foo fooInstance) {
		fooInstance = Foo.find(fooInstance)
        respond fooInstance
    }

    @Transactional
    def update(Foo fooInstance) {
        if (fooInstance == null) {
            notFound()
            return
        }

        if (fooInstance.hasErrors()) {
            respond fooInstance.errors, view:'edit'
            return
        }

        Foo.save fooInstance

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Foo.label', default: 'Foo'), fooInstance.id])
                redirect action:'show', id:fooInstance.id
            }
            '*'{ respond fooInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Foo fooInstance) {
		fooInstance = Foo.find(fooInstance);
		
        if (fooInstance == null) {
            notFound()
            return
        }

        Foo.delete fooInstance

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Foo.label', default: 'Foo'), fooInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'foo.label', default: 'Foo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
