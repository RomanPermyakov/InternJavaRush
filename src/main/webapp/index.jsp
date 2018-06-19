<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Notes list</title>
  <style>
    body {
      background: #c7b39b url(https://sky-wall.ru/uploads/source/2016/02/a3a96fd838619cdc0f7e93739fd63ce0.jpg) no-repeat; /* Цвет фона и путь к файлу */
      background-size: cover;
      color: #cccccc /* Цвет текста */
    }

    .text {
      text-align: center;
      margin: auto;
    }

    h1 {
      font-family: 'Times New Roman', Times, serif; /* Гарнитура текста */
      font-size: 250%; /* Размер шрифта в процентах */
    }

  </style>
</head>
<body>
<div class="text">
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>

  <h1>Notes list</h1>
</div>
<div class="text">
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <a href="<c:url value="/notes"/>" target="_blank"><h1>Перейти к списку заметок</h1></a>
  <br/>
</div>
</body>
</html>