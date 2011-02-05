package bookstore

class Book {

	String title
	Date dateCreated
	Date lastUpdated

	static hasMany = [authors: Author]

    static constraints = {
    }

	@Override
	String toString() {
		title
	}


}
