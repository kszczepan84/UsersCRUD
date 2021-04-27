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
//        pobieramy parametr z formularza list.jsp i zapisujemy
        int userId = Integer.parseInt(request.getParameter("id"));
        //        tworzymy obiekt Dao, wczytujemy okreslony po Id obiekt User za pomocą metody UserDao read (User user)
        UserDao userDao = new UserDao();
        User read = userDao.read(userId);
//        ustawiam zmienna potrzebna do formularza jsp czyli uzytkownika z klasy User user o pobranym wczesniej id,
//        metoda userDao read pobiera z SQL tego uzytkownika i zapisujemy pod nazwa "user", gdzie user to przedrostek
//        a obiekt to druga czesc po kropce czyli pobieramy metoda read uzytkownika o id=1, otrzymujemy user z polami konstruktora
//          id, userName,email,password czyli aby pobrac do jsp musimy podac przedrostek czyli USER.id, USER.userName, USER.email
//          USER.password w apostrofie i z klamrą oraz dolarem:
//        "${USER.id}" "${USER.userName}" "${USER.email}" "USER.password"
//        user.userName = userName;
//        this.email = email;
//        this.password = password;
        request.setAttribute("USER", read);
//        przekierunkowanie danych do formularza jsp
        getServletContext().getRequestDispatcher("/user/edit.jsp").forward(request, response);


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//       pobieramy nowe wartosci z parametru name="" wpisane przez uzytkownika w formularzu

        String userIdString = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPassword = request.getParameter("userPassword");
        int userId = Integer.parseInt(userIdString);

//        tworzymy nowego uzytkownika z podancyh wartosci ( id jest pobrane ale
//    w formularzu ylo niewidoczne wiec pozostaje po staremu)
        User user = new User();
        user.setId(userId);
        user.setUserName(userName);
        user.setEmail(userEmail);
        user.setPassword(userPassword);
//        tworzymy obiekt UserDao aby zapisac w SQL nowego uzytkownika po podanym id
        UserDao userDao=new UserDao();
        userDao.update(user);
        response.sendRedirect(request.getContextPath()+"/user/list");
    }
}
