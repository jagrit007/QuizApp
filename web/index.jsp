<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Quiz App</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="navbar_styles.css">
</head>
<body class="bg-light">

    <%@ include file = "navbar.jsp" %>


    <!-- Hero Section -->
    <div class="jumbotron text-center ml-5 mr-5 mt-2">
        <h1 class="display-4">Welcome to the Quiz App!</h1>
        <p class="lead">Test your knowledge with our quizzes. Are you ready?</p>
        <a class="btn btn-primary btn-lg" href="quiz" role="button">Get Started</a>
    </div>

    <!-- Footer -->
    <footer class="footer bg-light text-center mt-5">
        <div class="container">
            <span class="text-muted">&copy; 2023 Quiz App. All rights reserved.</span>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
