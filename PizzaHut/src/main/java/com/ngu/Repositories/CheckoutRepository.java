package com.ngu.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ngu.Model.Checkout;

@Repository
public interface CheckoutRepository extends JpaRepository<Checkout, Integer>{

}
