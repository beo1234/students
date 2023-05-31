<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/26/2023
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <style>
    body{
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    h1 {
      color: #333;
    }

    form {
      width: 300px;
      margin-top: 20px;
    }

    label {
      display: block;
      margin-bottom: 5px;
    }

    input[type="text"]{
      width: 100%;
      padding: 5px;
      margin-bottom: 10px;
    }

    input[type="submit"],a.button{
      display: inline-block;
      background-color: #4CAF50;
      color: white;
      padding: 8px 16px;
      text-decoration: none;
      border-radius: 4px;
      transition: background-color 0.3s;

    }
    input[type="submit"]:hover, a.button:hover{
      background-color: #45a049;
    }
    a.button{
      margin-left: 5px;
    }
  </style>
</head>
<body>
<h1>Student Form</h1>

<c:choose>
  <c:when test="${empty students.id}">
    <form method="POST" action="students?action=create" >
      <label for="studentName">Name</label>
      <input type="text" id="studentName" name="studentName">
      <br> <br>
      <label for="grade">Grade :</label>
      <input type="text" id="grade" name="grade">
      <br><br>

      <label for="score">Score:</label>
      <input type="text" id="score" name="score">
      <br> <br>

      <input type="submit" value="Create">
      <a class="button" href="students">Cancel</a>



    </form>



  </c:when>
  <c:otherwise>
    <form method="POST" action="students?action=update" >
      <input type="hidden" name="id" value="${students.id}">
      <label for="studentName">studentName:</label>
      <input type="text" id="studentName" name="studentName" value="${students.studentName}">
      <br> <br>


      <label for="grade">Grade:</label>
      <input type="text" id="grade" name="grade" value="${students.grade}">
      <br><br>

      <label  for="score">Score</label>
      <input type="text" id="score" name="score" value="${students.score}">
      <br> <br>


      <input type="submit" value="Update">
      <a class="button" href="students">Cancel</a>
    </form>

    <form method="POST" action="students?action=delete">
      <input type="hidden" name="id" value="${students.id}">
      <input class="button" type="submit" value="Delete">

    </form>
  </c:otherwise>


</c:choose>
</body>
</html>