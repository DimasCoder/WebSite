package com.dimas.repos;

import com.dimas.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo  extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User deleteByUsername(String username);
}
