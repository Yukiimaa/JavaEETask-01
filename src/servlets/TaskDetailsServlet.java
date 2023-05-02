package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;

@WebServlet(value = "/details")
public class TaskDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        Long id = -1L;

        try {
            id = Long.parseLong(request.getParameter("task_id"));

        }catch (Exception e){
            e.printStackTrace();
        }
//        Long id = Long.parseLong(request.getParameter("task_id"));
        Tasks task = DBManager.getTask(id);
        request.setAttribute("task", task);
        request.getRequestDispatcher("/details.jsp").forward(request,response);


    }
}
