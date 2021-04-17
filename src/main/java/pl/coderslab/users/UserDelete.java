package pl.coderslab.users;

import pl.coderslab.User;
import pl.coderslab.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserDelete", value = "/user/delete")
public class UserDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //        wczytujemy dane przekazane z formularza list ( id uzytkownika)
        int userIdInteger = Integer.parseInt(request.getParameter("userId"));
        //        tworzymy obiekt Dao, wczytujemy okreslony po Id obiekt User za pomocą metody UserDao read (User user)
        UserDao userDao = new UserDao();
        userDao.delete(userIdInteger);
        response.sendRedirect("/user/list");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
