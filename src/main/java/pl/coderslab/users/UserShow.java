package pl.coderslab.users;

import pl.coderslab.User;
import pl.coderslab.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserShow", value = "/user/show")
public class UserShow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //        wczytujemy dane przekazane z formularza list ( id uzytkownika)
        String userId = request.getParameter("id");
        int userIdInteger = Integer.parseInt(userId);
        //        tworzymy obiekt Dao, wczytujemy okreslony po Id obiekt User za pomocą metody UserDao read (User user)
        UserDao userDao = new UserDao();
        User read = userDao.read(userIdInteger);
        //        getteami pobieramy informacje o aktualnym uzytkowniku
        request.setAttribute("USER",read);
        //        przesyłamy dane dalej
        getServletContext().getRequestDispatcher("/user/show.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
