package user

class User {
	Long id
	String login
	String password
	
	Bio bio
	
    static constraints = {
    	login(blank: false, unique: true, maxSize: 20)
		password(blank: false, password: true, size: 5..25)
		bio(nullable: true)
		}
	}
