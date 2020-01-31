package com.dimas.repos;

import com.dimas.models.Category;
import org.springframework.data.repository.CrudRepository;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface CategoryRepo extends CrudRepository<Category, Integer> {
    Category findCategoryByCategoryName(String categoryName);
}
