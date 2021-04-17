package pl.coderslab.users;

import pl.coderslab.User;
import pl.coderslab.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserEdit", value = "/user/edit")
public class UserEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        wczytujemy dane przekazane z formularza list ( id uzytkownika)
        String userId = request.getParameter("userId");

//        przekazujemy dane do metody Post poniewaz beda przesylane wrazliwe dane ( haslo )
            doPost(request, response);
        }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        pobieramy parametr z metody doGet i zapisujemy
        int userIdInteger = Integer.parseInt(request.getParameter("userId"));

//        tworzymy obiekt Dao, wczytujemy okreslony po Id obiekt User za pomocą metody UserDao read (User user)
        UserDao userDao = new UserDao();
        User user = userDao.read(userIdInteger);

//        getteami pobieramy informacje o starym uzytkowniku
        String oldUser = user.getUserName();
        String oldEmail = user.getEmail();
        request.setAttribute("oldUser", oldUser);
        request.setAttribute("oldEmail", oldEmail);

//        otwieramy strone aby pobrac dane z pól wypełnianych przez użytkownika
        getServletContext().getRequestDispatcher("/user/edit.jsp").forward(request, response);

//        przypisujemy pobranym parametrom z formularza na zmienne
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

//        setterami ustawiamy argumanty obiektu user
        user.setUserName(name);
        user.setEmail(email);
        user.setPassword(password);

//        jezeli uzytkownik nie wpisze danych i wroci do listy to nic sie nie zapisze ( w przeciwnym razie
//        zapisza sie puste pola w danym ID)
        String buttonPress = request.getParameter("submit");
        if (buttonPress!=null && buttonPress.equals("confirm")) {
//        uruchamiam metoda userDao update ktora zapisuje okreslonego po id user'a pola name, email,password
            userDao.update(user);
        }
//        !!!chcemy przekierunkowac z powortem na liste uzytkownikow ale nie dziala!!!
//        getServletContext().getRequestDispatcher("/user/list").forward(request, response);
//        tez nie dziala
        response.sendRedirect("/user/list");

    }
}
