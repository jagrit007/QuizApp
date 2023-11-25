<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Get the current session
    HttpSession session = request.getSession();

    // Invalidate (clear) all session variables
    session.invalidate();

    // Redirect to the login page or another destination
    response.sendRedirect("/QuizApp/login.jsp");
%>
