package domainless

import grails.validation.Validateable

@Validateable
class Foo {
	
	static List<Foo> entities;
	static {
		entities = new LinkedList<>();
	}
	
	static void save(Foo entity) {
		Foo exists = Foo.find(entity);
		if(exists != null) {
			entities.remove(exists);
		}
		
		entities.add(entity);
	}
	
	static void delete(Foo entity) {
		Foo exists = Foo.find(entity);
		if(exists != null) {
			entities.remove(exists);
		}
	}
	
	static List<Foo> list(Foo entity) {
		return entities
	}
	
	static Foo find(Foo entity) {
		return Foo.find(entity.id)
	}
	static Foo find(String id) {
		return entities.find { it.id.equals(id) };
	}
	
	static int count() {
		return entities.size();
	}

	String id
	Date creation
	String name
	String bar
		
    static constraints = {
		id blank: false
		creation blank:false
		name blank:false
    }
}
