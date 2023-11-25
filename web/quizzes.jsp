<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="data.QuizDatabase" %>
<%@ page import="data.dto.QuizDetailsDto" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quizzes</title>
    <!-- Include your CSS and Bootstrap links here -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofGJhccHMOfonfuHcJ8RZeQp+bx2FfjI5M" crossorigin="anonymous">
    <style>
        /* Add your custom styles for the quizzes page here */
.card-deck {
    display: flex;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

.card {
    width: 18rem; /* Adjust as needed */
    margin: 15px;
}

.card-title {
    font-size: 1.25rem;
}

.card-text {
    color: #555;
}

.btn-primary {
    background-color: #4a90e2; /* Dodger Blue */
    border-color: #4a90e2; /* Dodger Blue */
}

.btn-primary:hover {
    background-color: #4169e1; /* Royal Blue */
    border-color: #4169e1; /* Royal Blue */
}

    </style>
</head>
<body>

    <!-- Navigation Bar (if not included in each page) -->
    <%@ include file="navbar.jsp" %>

    <%! public String formatDuration(long seconds) {
        long minutes = seconds / 60;
        seconds = seconds % 60;

        return String.format("%d minutes and %d seconds", minutes, seconds);
        }
    %>

    <!-- Page Content -->
    <div class="container mt-4">
        <h2>Available Quizzes</h2>

        <!-- Example: List of Quizzes -->
        <div class="card-deck mt-4">
            <!-- Replace this with dynamic content from the database -->
            <% ArrayList<QuizDetailsDto> quizzes = (ArrayList<QuizDetailsDto>) session.getAttribute("quiz_list");
               for (QuizDetailsDto quiz : quizzes) { %>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= quiz.getQuizTitle() %></h5>
                        <p class="card-text">Time Duration: <%= formatDuration(quiz.getTimeLimit())%></p>
                        <a href="takeQuiz.jsp?id=<%=quiz.getQuizId()%>" class="btn btn-primary">Take Quiz</a>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
