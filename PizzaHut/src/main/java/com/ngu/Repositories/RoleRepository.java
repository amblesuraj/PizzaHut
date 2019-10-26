package com.ngu.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ngu.Model.Role;
@Repository("roleRepository")
public interface RoleRepository extends JpaRepository<Role, Integer>{

	

	Role findByName(String name);
		
}
