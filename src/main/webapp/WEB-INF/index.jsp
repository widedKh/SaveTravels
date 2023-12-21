<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Save Travels</title>
</head>
<body>
    <div class="m-5">
   <h1 class="mb-4 text-primary">Save Travels</h1>
   <table class="table table-striped w-50">
     <thead>
        <tr>
            <th scope="col">Expenses</th>
            <th scope="col">Vendor</th>
            <th scope="col">Amount</th>
            <th scope="col">Action</th>
         
        </tr>
    </thead>
    <tbody scope="row">
        <c:forEach items="${expenses}" var="expense">
           <tr>
            
               <td><a href="/expenses/${expense.id}"><c:out value="${expense.expenseName}"/></a></td>
               <td><c:out value="${expense.vendor}"/></td>
               <td> $ <c:out value="${expense.amount}"/></td>
               <td class="d-flex ">
                  <a href="/expenses/edit/${expense.id}">edit</a>
                  <form action="/expenses/delete/${expense.id }" method="post">
                  <input type="hidden" name="_method" value="delete">
                  <input type="submit" value="Delete" class="btn btn-danger ml-3" />
                  </form>
               </td>
               
           </tr>
        </c:forEach>
    </tbody>
</table>
</div>
<div class="m-5">
    <h1 class="text-primary">Add an expense</h1>
    <form:form action="/newExpense" method="post" modelAttribute="expense" class="m-5 ">
        <div class="form-group row">
            <form:label path="expenseName" class="col-sm-2 col-form-label">Expense Name:</form:label>
            <div class="col-sm-3">
                <form:errors path="expenseName" class="text-danger" />
                <form:input type="text" path="expenseName" class="form-control" />
            </div>
        </div>
        <div class="form-group row">
            <form:label path="vendor" class="col-sm-2 col-form-label">Vendor: </form:label>
            <div class="col-sm-3">
                <form:errors path="vendor" class="text-danger" />
                <form:input type="text" path="vendor" class="form-control" />
            </div>
        </div>
        <div class="form-group row">
            <form:label path="amount" class="col-sm-2 col-form-label">Amount: </form:label>
            <div class="col-sm-3">
                <form:errors path="amount" class="text-danger" />
                <form:input type="number" path="amount" class="form-control" />
            </div>
        </div>
        <div class="form-group row">
            <form:label path="description" class="col-sm-2 col-form-label">Description: </form:label>
            <div class="col-sm-3">
                <form:errors path="description" class="text-danger" />
                <form:textarea type="text" path="description" class="form-control" rows="4" cols="40" />
            </div>
        </div>
        
         <div class="form-group text-center" >
            <input type="submit" value="Submit" class="btn btn-primary" />
        </div>
    </form:form>
</div>
    
</body>
</html>