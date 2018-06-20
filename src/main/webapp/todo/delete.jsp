<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper>
    <h3> Czy na pewno chcesz usunąć to zadanie?</h3>
    <dl class="dl-horizontal">
        <dt> Title:</dt>
        <dd><c:out value="${itemToDelete.title}"/></dd>
        <dt> Description:</dt>
        <dd><c:out value="${itemToDelete.description}"/></dd>
    </dl>

    <form action="/todo/delete" method="post">
       <input type="hidden" name="id" value="<c:out value="${itemToDelete.id}"/>">
        <button type="submit" class="btn btn-danger"> Yes, delete </button>
        <a href="/todo" class="btn btn-default"> No, thanks </a>
    </form>

</t:wrapper>
