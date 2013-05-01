package com.example.service;


import org.springframework.data.neo4j.repository.GraphRepository;

import com.example.model.Person;

public interface PersonService extends GraphRepository<Person> {
    
}
