package com.ngu.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.ngu.Model.User;

public interface UserService extends UserDetailsService {
	
	User save(User user);

	User update(User user);
    User findByUsername(String username);
    
    User findByUsernameAndPassword(String username,String Password);
    
	public boolean findUserByUsername(String username);
    
    User findByEmail(String email);

    Optional <User> findByResetToken(String resetToken);
    public Optional<User> findUserByEmail(String email);
//	public User create(User user);
	
	public Optional<User> findById(int id);
//	
	public List<User> findAllUsers();
//	
//	public void deleteAll();
//	
	public User getId(int id);
//	
	public void deleteById(int id);
	
	public List<Map<String, Object>> userDetailsReport();
}
