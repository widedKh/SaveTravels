package com.w.SaveTravels.services;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w.SaveTravels.models.Expense;
import com.w.SaveTravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	
	
	//------CRUD------

  // adding the Expense repository as a dependency
	@Autowired
	ExpenseRepository expenseRepository;
	   
	// retrieves all expenses
	   public List<Expense> allExpenses() {
	        return expenseRepository.findAll();
	    }
    // add a new expense
	    public Expense createExpense (Expense e) {
	        return expenseRepository.save(e);
	    }
	    
	 // retrieves an expense
	    public Expense findExpense (Long id) {
	        Optional<Expense> optionalExpense = expenseRepository.findById(id);
	        if(optionalExpense.isPresent()) {
	            return optionalExpense.get();
	        } else {
	            return null;
	        }
	    }
	 
	  //edit an expense
	    public Expense updateExpense(Expense e) {
	    	return expenseRepository.save(e);
	    }
	    
	  //delete an expense
	   public void deleteExpense(Long id) {
	           expenseRepository.deleteById(id);
}
	    }
	   

