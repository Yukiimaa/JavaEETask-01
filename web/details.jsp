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
  <%
    Tasks tasks = (Tasks) request.getAttribute("task");
    if(tasks!=null){
  %>
  <div class="row justify-content-center">
    <div class="col-6 ">

        <form method="post" action="save-task">

              <input type="hidden" name="task_id" class="form-control" value="<%=tasks.getId()%>">


          <div class="row mt-2">
            <div class="col-12">
              <label>Name:</label>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <input type="text" name="task_name"  class="form-control" value="<%=tasks.getName()%>" >
            </div>
          </div>

          <div class="row mt-2">
            <div class="col-12">
              <label>Description:</label>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <textarea class="form-control" style="height: 150px" name="task_description"><%=tasks.getDescription()%></textarea>
            </div>
          </div>

          <div class="row mt-2">
            <div class="col-12">
              <label>Deadline:</label>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <input type="text" name="task_deadline" class="form-control" value="<%=tasks.getDeadlineDate()%>" >
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <label>Status:</label>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <select class="form-control" name="task_status">
                <option <%=tasks.getStatus().equals("Completed")?"selected":""%>>Completed</option>
                <option <%=tasks.getStatus().equals("In progress")?"selected":""%>>In progress</option>
              </select>
            </div>
          </div>

          <div class="row mt-3">
            <div class="col-6">
              <button class="btn btn-success btn-sm">Save</button>
              <button type="button" class="btn btn-danger btn-sm " data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                Delete
              </button>
            </div>
          </div>


        </form>
              <!-- Modal -->
              <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <form action="/delete-task" method="post">
                      <input type="hidden" value="<%=tasks.getId()%>" name="task_id">
                    <div class="modal-header">
                      <h1 class="modal-title fs-5" id="staticBackdropLabel">Are you sure?</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                      <button class="btn btn-primary">Yes</button>
                    </div>

                    </form>
                  </div>
                </div>
              </div>



    </div>
  </div>
  <%
    }else {
  %>

  <h2 class="text-center mt-2">Task not found</h2>
  <%
    }
  %>


</div>

</body>
</html>
