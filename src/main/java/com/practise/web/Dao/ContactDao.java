package com.practise.web.DAO;

import java.util.ArrayList;
import com.practise.web.model.Contact;

public interface ContactDAO {

	String saveContact(Contact contact);

	ArrayList<Contact> viewAllContacts(String userid);

	Contact viewContact(String userid, int contactid);

	boolean deleteContact(String userid, int contactid);

	String editContact(Contact contact);
}
