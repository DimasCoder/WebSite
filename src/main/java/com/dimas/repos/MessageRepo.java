package com.dimas.repos;

import com.dimas.models.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Integer> {
    List<Message>findByTitle(String title);
}
