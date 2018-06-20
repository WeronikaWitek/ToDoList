<%@ page import="java.util.List" %>
<%@ page import="pl.sda.poznan.model.TodoItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    #todoheader {
        margin-bottom: 25px;
    }

    #todocontainer {
        margin-top: 20px;
    }

</style>

<t:wrapper>
    <div id="todocontainer" class="container table-responsive-sm">
        <div style="display: inline-block">
            <span><h1 id="todoheader" class="header" style="font-family: 'Permanent Marker', cursive;"> My tasks </h1>
            </span>

            <span><a href="/todo/create" class="btn btn-primary"
                     style="font-family: 'Permanent Marker', cursive; font-size: 0.5cm "> + new task </a></span>
        </div>
        <c:choose>
            <c:when test="${sessionScope.delete_result eq true}">
                <div class="alert alert-success">
                    Zadanie zostało usunięte!
                    <c:remove var="delete_result"/>
                </div>
            </c:when>
            <c:when test="${sessionScope.delete_result eq true}">
                <div class="alert alert-warning">
                    Wystąpił błąd podczas usuwania zadania. Wciąż jest na Twojej liście :(
                    <c:remove var="delete_result"/>
                </div>
            </c:when>
        </c:choose>

        <c:if test="${sessionScope.todo_created eq true}">
            <div class="alert alert-success">
                Lepiej bierz się do pracy, ponieważ Twoja lista się powiększyła!
            </div>

            <c:remove var="todo_created"/>
        </c:if>

        <c:if test="${fn:length(todos) eq 0}">
            <div class="alert alert-danger">
                Wow! Nie masz żadnych zadań do wykonania. Click <a href="/todo/create"
                                                                   style="font-family: 'Permanent Marker', cursive;">
                here </a>
            </div>
        </c:if>

        <c:if test="${fn:length(todos) gt 0}">


            <table class="table table-hover">
                <thead>
                <tr>
                    <th style="grid-columns:10%"> ID</th>
                    <th style="grid-columns:30%"> Title</th>
                    <th style="grid-columns:45%"> Description</th>
                    <th style="grid-columns:15%"> Deadline</th>

                </tr>
                </thead>
                <tbody>

                </tbody>
                <c:forEach items="${todos}" var="todo">
                    <tr>
                        <td><c:out value="${todo.id}"/></td>
                        <td><c:out value="${todo.title}"/></td>
                        <td><c:out value="${todo.description}"/></td>
                        <td><c:out value="${todo.startDate}"/></td>
                        <td><a href="/todo/edit?id=<c:out value="${todo.id}"/>"> <i class="far fa-edit"></i> </a> |
                            <a href="/todo/delete?id=<c:out value="${todo.id}"/>"> <i class="far fa-trash-alt"></i> </a>
                        </td>
                    </tr>
                </c:forEach>

            </table>

        </c:if>
    </div>
</t:wrapper>