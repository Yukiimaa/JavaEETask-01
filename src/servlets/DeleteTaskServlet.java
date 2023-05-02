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
import java.util.Objects;

@WebServlet(value = "/delete-task")
public class DeleteTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("task_id"));
        ArrayList<Tasks> tasks = DBManager.getAllTasks();
        for (int i = 0; i< tasks.size();i++){
            if (Objects.equals(tasks.get(i).getId(), id)){
                DBManager.deleteTask(i);
                break;
            }
        }

        response.sendRedirect("/");
    }
}
