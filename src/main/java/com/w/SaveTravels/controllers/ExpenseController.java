package com.w.SaveTravels.controllers;
import java.util.List;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;

import com.w.SaveTravels.services.ExpenseService;

import com.w.SaveTravels.models.Expense;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

@Controller
public class ExpenseController {
	
	 @Autowired
      private  ExpenseService expenseService;
	 
	// ------ READ ALL
      @RequestMapping("/expenses")
      public String index(@ModelAttribute("expense") Expense expense, Model model) {
	      List<Expense> expenses =expenseService.allExpenses();
	      model.addAttribute("expenses", expenses);
	      return "index.jsp";
	   
   }
    //---- Add new expense
    
      @PostMapping("/newExpense")
      public String create(@Valid @ModelAttribute("expense")Expense expense, BindingResult result) {
          if (result.hasErrors()) {
              return "index.jsp";
          } else {
              expenseService.createExpense(expense);
              return "redirect:/expenses";
          }
      }
      
      //---Edit an expense 
      @GetMapping("/expenses/edit/{id}")
      public String editExpense(@PathVariable("id") Long id, Model model) {
          Expense expense = expenseService.findExpense(id);
          model.addAttribute("expense", expense);
          return "edit.jsp";
      }

      
      @RequestMapping(value = "/expenses/edit/{id}", method = RequestMethod.PUT)
      public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result){
          if (result.hasErrors()) {
              return "edit.jsp";
          } else {
        	  expenseService.updateExpense (expense);
              return "redirect:/expenses";
          }
      }
      
      //---Display one expense
      @RequestMapping("/expenses/{id}")
      public String showOne(@PathVariable("id") Long id, Model model) {
          Expense expense = expenseService.findExpense(id);
          model.addAttribute("expense", expense);
          return "show.jsp";
      }

  	
      //---Delete an expense 
      @RequestMapping(value = "/expenses/delete/{id}", method = RequestMethod.DELETE)
      public String delete(@PathVariable("id") Long id) {
          expenseService.deleteExpense(id);
          return "redirect:/expenses";
      }

      
      
}
