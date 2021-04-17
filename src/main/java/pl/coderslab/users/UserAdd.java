package pl.coderslab.users;

import pl.coderslab.User;
import pl.coderslab.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserAdd", value = "/user/add")
public class UserAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/user/add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        pobieram parametry wypisane przez uzytkownika w formularzu w pliku jsp
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
//        tworze nowy obiekt klasy Userdao aby wywolac odpowiednia metoda - userdDaoAdd, która doda user do azy danych SQL
        UserDao userDaoAdd = new UserDao();
//        tworze obiekt klasy User aby móc ustawic nowe atrybuty dla obiektu przy uzyciu setterow
        User user = new User();
        user.setUserName(name);
        user.setEmail(email);
        user.setPassword(password);
//        wywoluje metoda userDaoAdd aby dodac nowy obiekt do bazy SQL
        userDaoAdd.create(user);
//        przenosze uzytkownika do strony głównej
        response.sendRedirect("/user/list");

//        !!!nie dziala:!!!
//        getServletContext().getRequestDispatcher("/user/list").forward(request,response);
//        !!!nie dziala:!!!
//        request.getRequestDispatcher("/user/list").forward(request, response);


    }
}
