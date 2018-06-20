<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:wrapper>

    <h1 align="center" style="font-family: 'Permanent Marker'"> Create a new task </h1>
    <form action="/todo/create" method="post" class="form-horizontal">
       <%--//<c/>/// if test--%>


        <div class="form-group">
            <label class="control-label col-sm-2" for="title" name="title"> Title </label>
            <div class="col-sm-10">
                <input id="title" type=text" name="title" class="form-control" placeholder="Name the task...">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="description" name="description"> Description </label>
            <div class="col-sm-10">
                <input id="description" type="text" name="description" class="form-control"
                       placeholder="What do you have to do?">
            </div>
        </div>

        <div class="form-group">
            <label for="startdate" class="control-label col-sm-2"> Date </label>
            <div class="col-sm-2">
                <input id="startdate" type="date" name="startdate" class="form-control">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary"> Submit </button>
                <a href="/todo" class="btn btn-default"> No, thanks </a>
            </div>
        </div>


    </form>


</t:wrapper>