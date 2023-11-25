/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;

import data.QuizDatabase;
import data.dao.AuthDao;
import data.dto.User;
import data.dto.UserLoginDto;
import data.dto.UserSignupDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Jayra
 */
public class AuthServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");

        try {
//            if(1 == Integer.parseInt(request.getParameter("auth-request"))) {
            if(false) {
                register(request, response, session);
            } else login(request, response, session);
        } catch (Exception e) {
            e.printStackTrace();
            if(1 == Integer.parseInt(request.getParameter("auth-request"))) {
                session.setAttribute("registerError", "Something went wrong. Please try again.");
                response.sendRedirect("register.jsp");
            } else {
                session.setAttribute("loginError", "Something went wrong. Please try again.");
                response.sendRedirect("login.jsp");
            }
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        AuthDao dao = new AuthDao(QuizDatabase.get());
        User user = dao.login(
                new UserLoginDto(
                        request.getParameter("email"),
                        request.getParameter("password")
                )
        );
        if(user != null) {
            session.setAttribute("uid", user.getUid());
            session.setAttribute("uname", user.getName());
            session.setAttribute("uemail", user.getEmail());
            session.setAttribute("loginError", null);
        } else {
            session.setAttribute("loginError", "Login Failed.");
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        AuthDao dao = new AuthDao(QuizDatabase.get());
        User user = dao.register(
            new UserSignupDto(
                request.getParameter("name"),
                request.getParameter("email"),
                request.getParameter("password")
            )
        );
        if(user != null) {
            session.setAttribute("uid", user.getUid());
            session.setAttribute("uname", user.getName());
            session.setAttribute("uemail", user.getEmail());
            session.setAttribute("registerError", null);
            System.out.println("user after registration - "  + user.getUid());
        } else {
            response.sendRedirect("register.jsp");
            session.setAttribute("registerError", "Registration failed. Please try again.");
            System.out.println("user after registration - NULL");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
