package com.practise.web.DAO;

import com.practise.web.model.NewUser;
import com.practise.web.model.User;

public interface UserDAO {
	
//	Table : users(userid, emailid, password, fname,lname)

	boolean validateUser(User user);

	String registerUser(NewUser user);
}
