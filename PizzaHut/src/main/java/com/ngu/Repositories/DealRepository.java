package com.ngu.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ngu.Model.Deal;
@Repository
public interface DealRepository extends JpaRepository<Deal, Integer>{

}
