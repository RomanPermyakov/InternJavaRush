<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Notes Page</title>

    <style type="text/css">
        body {
            background: #c7b39b url(https://cdn.wallpapersafari.com/61/55/uW7qAX.jpg) no-repeat; /* Цвет фона и путь к файлу */
            background-size: cover;
            color: #cccccc /* Цвет текста */
        }

        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            overflow: hidden;
            word-break: normal;
            border: 1px solid #ccc;
            color: #333;
            background-color: #fff;
        }

        .text1 {
            text-align: center;
        }

        h1 {
            font-family: 'Times New Roman', Times, serif; /* Гарнитура текста */
            font-size: 250%; /* Размер шрифта в процентах */
            text-align: left;
        }

        h2 {
            font-family: 'Times New Roman', Times, serif; /* Гарнитура текста */
            font-size: 100%; /* Размер шрифта в процентах */
            text-align: right;
        }

        h6 {
            font-family: 'Times New Roman', Times, serif; /* Гарнитура текста */
            font-size: 100%; /* Размер шрифта в процентах */
            text-align: end;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            overflow: hidden;
            word-break: normal;
            border: 1px solid #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        .yy {
            margin-left: 50px;
        }

        .bb {
            text-align: end;
        }

        .uu {
            margin-right: 50px;
            text-align: right;
        }

    </style>
</head>
<body>

<a href="../../index.jsp">Back to main menu</a>
<div class="yy">
    <br/>
    <br/>
    <div class="text1">
        <h1>Note List</h1>
    </div>
    <h2>Add a Note</h2>

    <c:url var="addAction" value="/notes/add"/>

    <form:form action="${addAction}" commandName="note">
        <table align="right">
            <c:if test="${!empty note.noteTitle}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="noteTitle">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="noteTitle"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="content">
                        <spring:message text="Content"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="content"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty note.noteTitle}">
                        <input type="submit"
                               value="<spring:message text="Edit note"/>"/>
                    </c:if>
                    <c:if test="${empty note.noteTitle}">
                        <input type="submit"
                               value="<spring:message text="Add note"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>


    <%--<h2>Сортировка:</h2>--%>
    <%--<a href="<c:url value='/notes'/>">Все заметки!</a>--%>
    <%--<a href="<c:url value='/sortDate/up'/>">↑</a>--%>
    <%--<a href="<c:url value='/sortDate/down'/>">↓</a>--%>
    <%--<a href="<c:url value='/sortDone'/>">↑</a>--%>
    <%--<a href="<c:url value='/sortNotDone'/>">↓</a>--%>
    <div class="uu">
        <c:if test="${!empty listNotes}">
            <table class="tg" align="left">
                <tr>
                    <th width="60">Set Done</th>
                    <th width="80">ID</th>
                    <th width="120">Task name</th>
                    <th width="120">Content</th>
                    <th width="120">IsDone
                        <a href="<c:url value='/sortDone'/>">↑</a>
                        <a href="<c:url value='/sortNotDone'/>">↓</a>
                        <a href="<c:url value='/notes/all'/>">All</a>
                    </th>
                    <th width="120">CreatedDate<a href="<c:url value='/sortDate/up'/>">↑</a>
                        <a href="<c:url value='/sortDate/down'/>">↓</a>
                        <a href="<c:url value='/notes/all'/>">All</a>
                    </th>
                    <th width="60">Edit</th>
                    <th width="60">Delete</th>
                </tr>
                <c:forEach items="${listNotes}" var="note">
                    <tr>
                        <td><a href="<c:url value='/done/${note.id}'/>">DONE!</a></td>
                        <td>${note.id}</td>
                        <td>${note.noteTitle}</td>
                        <td>${note.content}</td>
                        <td>${note.isDone}</td>
                        <td>${note.createdDate}</td>
                        <td><a href="<c:url value='/edit/${note.id}'/>">Edit</a></td>
                        <td><a href="<c:url value='/remove/${note.id}'/>">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <c:if test="${empty listNotes}">
            <h3>Отсутствуют невыполненные заметки</h3>
            <a href="<c:url value='/notes/all'/>">Посмотреть все заметки!</a>
        </c:if>


    </div>
</div>

<div id="pagination">
    <c:url value="/notes" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">PREV</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/notes" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/notes" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">NEXT</a>
    </c:if>
</div>


</body>
</html>
