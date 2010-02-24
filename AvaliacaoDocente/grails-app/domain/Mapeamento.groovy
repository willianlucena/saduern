

/**
 * Request Map domain class.
 */
class Mapeamento {

	String url
	String configAttribute

	static constraints = {
		url(blank: false, unique: true)
		configAttribute(blank: false)
	}
}
