<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/31/2023
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student List</title>
  <style>
    body{
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    h1{
      color: red;
      text-align: center;
    }
    table{
      width: 100%;
      border-collapse: collapse;
    }

    th,td{
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #ccc;

    }

    tr:nth-child(even){
      background-color: #f2f2f2;

    }
    tr:hover{
      background-color: #e0e0e0;
    }

    .button{
      display: inline-block;
      background-color: #4CAF50;
      color: white;
      padding: 8px 16px;
      text-decoration: none;
      border-radius: 4px;
      transition: background-color 0.3s;
    }
    .button-delete{
      display: inline-block;
      background-color: red;
      color: white;
      padding: 8px 16px;
      text-decoration: none;
      border-radius: 4px;
      transition: background-color 0.3s;
    }
    .button:hover{
      background-color: #45a049;
    }
    .add-button{
      margin-bottom: 10px;
    }

    .image{
      width: 200px;
      height: 200px;
      object-fit: cover;
      border: 1px solid #ccc;
      border-radius: 5px;
      overflow: hidden;

    }
    form{
      margin-left: 1150px;
    }
    p{
      margin-left: 1150px;
    }
    .input1{
      color: #cccccc;
      height: 35px;
      border-radius: 4px;
    }

  </style>
</head>
<body>
<h1>Student List</h1>
<table>
  <a class="button add-button" href="students?action=new">Add New Book</a>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Grade</th>
    <th>Score</th>
  </tr>
  <c:forEach var="students" items="${studentsList}">


    <tr>
      <td>${students.id}</td>
      <td>${students.studentName}</td>
      <td>${students.grade}</td>
      <td>${students.score}</td>

      <td>
        <a class="button" href="students?action=edit&id=${students.id}" >Edit</a>
        <a class="button-delete"  href="students?action=delete&id=${students.id}">Delete</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
