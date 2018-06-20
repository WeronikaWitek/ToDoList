package pl.sda.poznan.servlets;
import java.io.IOException;
import java.util.List;
import javax.persistence.PersistenceUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.sda.poznan.model.TodoItem;
import pl.sda.poznan.repository.TodoRepository;
import pl.sda.poznan.service.TodoService;
import util.PersistaneUtil;


@WebServlet(name = "TodoServlet", urlPatterns = {"/todo", "/todo/create", "/todo/delete", "/todo/edit"})
public class TodoServlet extends HttpServlet {

    private TodoService todoService;

    public TodoServlet() {
        this.todoService = new TodoService(new TodoRepository(PersistaneUtil.getEntityManager()));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//    todo: delete this

        String path = req.getServletPath();
        if (path.equals("/todo/create")) {
            req.getRequestDispatcher("/todo/create.jsp").forward(req, resp);
        } else if (path.equals("/todo/delete")) {
            String id = req.getParameter("id");
            TodoItem toDelete = todoService.getById(Long.parseLong(id));
            req.setAttribute("itemToDelete", toDelete);
            req
                    .getRequestDispatcher("/todo/delete.jsp")
                    .forward(req, resp);

        } else if (path.equals("/todo/edit")) {
            //todo: pobrać z bazy po id
            //todo: dodać obiekt Todo jako atrybut
            //zwrocic widok /todo/edit.jsp
            //wyswietlic wartosc w polach formularza (wstawic w input wartosci obiektu)
            String id = req.getParameter("id");
            TodoItem toEdit = todoService.getById(Long.parseLong(id));
            req.setAttribute("itemToEdit", toEdit);
            req.getRequestDispatcher("/todo/edit.jsp").forward(req, resp);

        } else {
            List<TodoItem> allTodos = todoService.getAllTodos();
            req.setAttribute("todos", allTodos);
            req
                    .getRequestDispatcher("/todo/index.jsp")
                    .forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String servletPath = req.getServletPath();
        if (servletPath.equals("/todo/create")) {
            TodoItem todoItem = new TodoItem();
            todoItem.setTitle(req.getParameter("title"));
            todoItem.setDescription(req.getParameter("description"));
            //todo: parse date from request
            todoService.save(todoItem);
            req.getSession().setAttribute("todo_created", true);
            resp.sendRedirect("/todo");
        } else if (servletPath.equals("/todo/delete")) {
            String id = req.getParameter("id");
            boolean result = this.todoService.delete(Long.parseLong(id));
            //todo: Wyświetl wynik na stronie
            req.getSession().setAttribute("delete_result", result);
            resp.sendRedirect("/todo");

        } else if (servletPath.equals("/todo/edit")) {
            TodoItem todoItem = new TodoItem();
            String id = req.getParameter("id");
            todoItem.setId(Long.parseLong(id));
            todoItem.setTitle(req.getParameter("title"));
            todoItem.setDescription(req.getParameter("description"));
            System.out.println(todoItem);
            todoService.update(todoItem);
            resp.sendRedirect("/todo");
        }
    }
}