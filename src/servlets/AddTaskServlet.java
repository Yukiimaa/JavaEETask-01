package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/add-task")
public class AddTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String name = request.getParameter("task_name");
        String description = request.getParameter("task_description");
        String deadline = request.getParameter("task_deadline");

        Tasks task = new Tasks();
        task.setName(name);
        task.setDescription(description);
        task.setDeadlineDate(deadline);

        DBManager.addTask(task);
        response.sendRedirect("/");

    }
}
