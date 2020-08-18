package servlet;

import club.banyuan.pojo.User;
import club.banyuan.service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginName = request.getParameter("loginName");
        String password = request.getParameter("password");
        User user = new User();
        user.setLoginName(loginName);
        user.setPassword(password);

        UserService userService = new UserServiceImpl();
        try {
            User newUser = userService.login(user);
            response.sendRedirect("index.html");
        } catch (Exception throwables) {
            response.sendRedirect("login.html");
        }
    }
}