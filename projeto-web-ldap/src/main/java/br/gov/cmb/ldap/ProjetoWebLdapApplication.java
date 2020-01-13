package br.gov.cmb.ldap;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import br.gov.cmb.ldap.model.Group;
import br.gov.cmb.ldap.model.Person;
import br.gov.cmb.ldap.service.GroupRepository;
import br.gov.cmb.ldap.service.PersonRepository;


@SpringBootApplication
public class ProjetoWebLdapApplication {
	
	private static Logger log = LoggerFactory.getLogger(ProjetoWebLdapApplication.class);

    @Autowired private PersonRepository personRepository;
    @Autowired private GroupRepository groupRepository;
		
	public static void main(String[] args) {
		SpringApplication.run(ProjetoWebLdapApplication.class, args);
	}	
	
	//@PostConstruct
    public void setup(){
        log.info("Spring LDAP - CRUD Operations Binding and Unbinding Example");

        log.info("- - - - - - Managing persons");

        List<Person> persons = personRepository.findAll();
        log.info("persons: " + persons);

        Person ben = personRepository.findOne("ben");
        ben.setLastName("custom last name");
        personRepository.updateLastName(ben);

        Person bob = personRepository.findOne("bob");
        bob.setLastName("custom last name");
        personRepository.update(bob);

        Person person = new Person("uid", "new", "person");
        personRepository.create(person);

        //Person joe = personRepository.findOne("joe");
        //personRepository.delete(joe);

        persons = personRepository.findAll();
        log.info("persons: " + persons);

        log.info("- - - - - - Managing groups");

        List<Group> groups = groupRepository.findAll();
        log.info("groups: " + groups);

        groupRepository.removeMemberFromGroup("developers", bob);

        //groupRepository.addMemberToGroup("managers", joe);

        groups = groupRepository.findAll();
        log.info("groups: " + groups);

        System.exit(-1);
    }
	
}
