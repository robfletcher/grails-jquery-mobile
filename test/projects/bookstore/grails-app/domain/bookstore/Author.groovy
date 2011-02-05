package bookstore

class Author {

	String name
	Date dateCreated
	Date lastUpdated

    static constraints = {
		name blank: false
    }

	@Override
	String toString() {
		name
	}


}
