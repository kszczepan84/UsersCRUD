package pl.coderslab;

import org.mindrot.jbcrypt.BCrypt;
import pl.coderslab.utils.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class UserDao {

    private static final String CREATE_USER_QUERY = "INSERT INTO users(username, email, password) VALUES (?, ?, ?); ";
    private static final String READ_USER_QUERY = "SELECT id,email,username,password FROM users WHERE id=(?);";
    private static final String UPDATE_USER_QUERY = "UPDATE users SET email=?,username= ?,password=? WHERE id=?;";
    private static final String DELETE_USER_QUERY = "DELETE FROM users WHERE id=?;";
    private static final String FIND_ALL_USERS_QUERY = "SELECT * FROM users;";

    public String hashPassword(String password) {

        return BCrypt.hashpw(password, BCrypt.gensalt());

    }

    public User create(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement =
                    conn.prepareStatement(CREATE_USER_QUERY, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getEmail());
            statement.setString(3, hashPassword(user.getPassword()));
            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                user.setId(resultSet.getInt(1));
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void update(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement =
                    conn.prepareStatement(UPDATE_USER_QUERY, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getUserName());
            statement.setString(3, hashPassword(user.getPassword()));
            statement.setInt(4, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User read(int userId) {
        User user = new User();
        Scanner scanner = new Scanner(System.in);
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement =
                    conn.prepareStatement(READ_USER_QUERY, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String idString = resultSet.getString(1);//rs.getString("id");
                String email = resultSet.getString(2);//rs.getString("email");
                String username = resultSet.getString(3);//rs.getString("username");
                String password = resultSet.getString(4);//rs.getString("password");
                int id = Integer.parseInt(idString);
                user.setId(id);
                user.setUserName(username);
                user.setEmail(email);
                user.setPassword(password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        scanner.close();
        return user;
    }

    public void delete(int userId) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement =
                    conn.prepareStatement(DELETE_USER_QUERY, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User [] findAll() {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(FIND_ALL_USERS_QUERY);
            ResultSet resultSet = statement.executeQuery();
            List<Object> list = new ArrayList<>();
            int counter=0;
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUserName(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                list.add(counter,user);
                counter++;
            }
            User[] users = new User [list.size()];
            users =list.toArray(users);
//            System.out.println(Arrays.toString(users));
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        } return null;
    }
}

