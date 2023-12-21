package com.w.SaveTravels.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.w.SaveTravels.models.Expense;

public interface ExpenseRepository  extends CrudRepository<Expense, Long> {
    List<Expense> findAll();
}
