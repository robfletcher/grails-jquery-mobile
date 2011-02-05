package bookstore

class Book {

	String title
	Date dateCreated
	Date lastUpdated

	static hasMany = [authors: Author]

    static constraints = {
		title blank: false
    }

	@Override
	String toString() {
		title
	}


}
