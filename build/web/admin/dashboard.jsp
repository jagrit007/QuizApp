<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Dashboard - Quiz App</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 56px; /* Adjusted top padding to account for the fixed navbar */
        }

        .dashboard-container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 20px;
        }

        .quiz-item {
            background-color: #f8f9fa;
            border: 2px solid #007bff; /* Blue color border */
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .quiz-item:hover {
            transform: scale(1.03);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .quiz-title {
            color: #343a40;
            font-size: 1.8rem;
            margin-bottom: 10px;
        }

        .submitted-by {
            color: #6c757d;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .quiz-actions {
            display: flex;
            justify-content: flex-end;
        }

        .edit-btn,
        .delete-btn {
            margin-right: 10px;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .edit-btn {
            background-color: #007bff;
            color: #ffffff;
        }

        .delete-btn {
            background-color: #dc3545;
            color: #ffffff;
        }

        .edit-btn:hover,
        .delete-btn:hover {
            filter: brightness(90%);
        }

        .no-quizzes {
            text-align: center;
            color: #6c757d;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <!-- Include the navbar.html content here -->
    
    <%@ include file = "../navbar.jsp" %>

    <!-- Admin Dashboard Container -->
    <div class="dashboard-container">
        <h2 class="mb-4">Admin Dashboard</h2>

        <!-- New Quiz Button -->
    <a href="../create_quiz.jsp" class="btn btn-success mb-4">New Quiz</a>
        
        <!-- Example Quiz Items (Replace with dynamic content from your database) -->
        <div class="quiz-item">
            <h3 class="quiz-title">Quiz Title 1</h3>
            <p class="submitted-by">Submitted by: User1</p>
            <div class="quiz-actions">
                <a href="edit_quiz.html?quizId=1" class="btn btn-primary edit-btn">Edit</a>
                <button class="btn btn-danger delete-btn">Delete</button>
            </div>
        </div>

        <div class="quiz-item">
            <h3 class="quiz-title">Quiz Title 2</h3>
            <p class="submitted-by">Submitted by: User2</p>
            <div class="quiz-actions">
                <a href="edit_quiz.html?quizId=1" class="btn btn-primary edit-btn">Edit</a>
                <button class="btn btn-danger delete-btn">Delete</button>
            </div>
        </div>

        <!-- If no quizzes are available -->
        <div class="no-quizzes">
            <p>No quizzes available.</p>
        </div>

        <!-- Add more quiz items as needed -->

    </div>

    <!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
