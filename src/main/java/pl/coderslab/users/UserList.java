package pl.coderslab.users;

import pl.coderslab.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserList", value = "/user/list")
public class UserList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Tworzę obiekt klasy UserDao aby wywolac metoda ktora stworzy obiekt zawierajacy wszystkich uzytkownikow
//                zapisanych w bazie danych SQL
        UserDao userDaoList = new UserDao();
        request.setAttribute("users", userDaoList.findAll());
//        wywołuję plik jsp aby wyswietlic strone html oraz przeniesc atrybuty do jsp
        getServletContext().getRequestDispatcher("/user/list.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
