package com.tek.buddies.repository;

import com.tek.buddies.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by vtortaja on 2017-03-20.
 */
public interface UserRepository extends JpaRepository<User, Long> {
}
