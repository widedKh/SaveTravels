<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Show Expense</title>
</head>
<body class="m-5">
   <div class="d-flex">
    <h2 class="mb-4 text-primary">Expense Details</h2>
    <a href="/expenses" style="margin-left: 260px">Go back</a>
   </div>
<table class="m-3"  style="border-collapse: separate; border-spacing: 20px;">
    <tbody>
        <tr>
            <td>Expense Name:</td>
            <td style="padding-left: 55px;"><c:out value="${expense.expenseName}"/></td>
        </tr>
        <tr> 
            <td>Expense Description:</td>
            <td style="padding-left: 55px;"><c:out value="${expense.description}"/></td>
        </tr>
        <tr>
            <td>Vendor:</td>
            <td style="padding-left: 55px;"><c:out value="${expense.vendor}"/></td>
        </tr>
        <tr> 
            <td>Amount Spent:</td>
            <td style="padding-left: 55px;"><c:out value="${expense.amount}"/> $</td>
        </tr>
    </tbody>
</table>
</body>
</html>
