<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper>

    <h1 align="center" style="font-family: 'Permanent Marker'"> Edit task </h1>
    <form action="/todo/edit" method="post" class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2" for="title" name="title"> Title </label>
            <div class="col-sm-10">
                <input id="title" type=text" name="title" class="form-control" value="<c:out value="${itemToEdit.title}"/>">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="description" name="description"> Description </label>
            <div class="col-sm-10">
                <input id="description" type="text" name="description" class="form-control"
                       value="<c:out value="${itemToEdit.description}"/>">
            </div>
        </div>

        <div class="form-group">
            <label for="startdate" class="control-label col-sm-2"> Date </label>
            <div class="col-sm-2">
                <input id="startdate" type="date" name="startdate" class="form-control">
            </div>
        </div>

        <form action="/todo/delete" method="post">
            <input type="hidden" name="id" value="<c:out value="${itemToEdit.id}"/>">
            <button type="submit" class="btn btn-danger"> Yes, edit </button>
            <a href="/todo" class="btn btn-default"> No, thanks </a>
        </form>


    </form>


</t:wrapper>