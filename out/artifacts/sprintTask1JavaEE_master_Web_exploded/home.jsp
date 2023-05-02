<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>

    <title><%=siteName%></title>

</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>

    <div class="row mt-3">
        <div class="col-12">
            <!-- Button trigger modal -->
            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="color: #ffffff; background: #540128">
                +Add new task
            </button>

            <!-- Modal -->
            <div class="modal fade modal-lg" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/add-task" method="post">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">New Task:</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                                <div class="row mt-2">
                                    <div class="col-12">
                                        <label>Name:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text" name="task_name"  class="form-control" placeholder="Insert name...">
                                    </div>
                                </div>

                                <div class="row mt-2">
                                    <div class="col-12">
                                        <label>Description:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <textarea class="form-control" style="height: 150px" placeholder="Insert description..." name="task_description"></textarea>
                                    </div>
                                </div>

                                <div class="row mt-2">
                                    <div class="col-12">
                                        <label>Deadline:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text" name="task_deadline" class="form-control">
                                    </div>
                                </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
<%--                            <button type="button" class="btn btn-primary">Save changes</button>--%>
                            <button class="btn btn-dark" style="background: #540128">Add task</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <table class="table table-hover table-striped mt-3">

        <thead>
        <tr>
            <th>ID</th>
            <th>Tasks</th>
            <th>Deadline</th>
            <th>Status</th>
            <th style="width: 10%">Details</th>
        </tr>
        </thead>

        <tbody>
        <%
            ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("tasks");
            if (tasks!=null){
                for (Tasks task : tasks){
        %>
            <tr>
                <td><%=task.getId()%></td>
                <td><%=task.getName()%></td>
                <td><%=task.getDeadlineDate()%></td>
                <td><%=task.getStatus()%></td>
                <td><a class="btn btn-sm btn-dark" href="/details?task_id=<%=task.getId()%>">Details</a></td>
            </tr>
        <%
            }
            }
        %>
        </tbody>

    </table>
</div>





</body>
</html>
