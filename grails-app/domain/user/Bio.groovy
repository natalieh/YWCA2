package user

class Bio {
	Long id
	String firstName
	String lastName
	Date birthday
	String autobio
	String interests
	String hobbies
	String movies
	String books
		
	static belongsTo = [user: User]
	
	
    static constraints = {
		firstName(nullable: true, blank: false, maxSize: 20)
		lastName(nullable: true, blank: false, maxSize: 20)
		birthday(date: true, nullable: true)
		autobio(nullable: true, blank: true, maxSize: 350)
		interests(nullable: true, blank: true, maxSize: 200)
		hobbies(nullable: true, blank: true, maxSize: 200)
		movies(nullable: true, blank: true, maxSize: 100)
		books(nullable: true, blank: true, maxSize: 100)
    }
	
}
