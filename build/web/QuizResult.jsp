<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Quiz Result - Quiz App</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .result-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        .result-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .result-info {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .result-btns {
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 15px 30px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-primary {
            background-color: #007bff;
            color: #ffffff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #ffffff;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #545b62;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar (if not included in each page) -->
    <%@ include file="navbar.jsp" %>
    <!-- Result Container -->
    <div class="container result-container">
        <!-- Result Title -->
        <div class="result-title">
            <h2>Quiz Result</h2>
        </div>

        <!-- Result Information -->
        <div class="result-info">
            <p>Correct count: <strong>5</strong></p>
            <p>Wrong count: <strong>3</strong></p>
            <p>Total attempted: <strong>8</strong></p>
        </div>

        <!-- Result Buttons -->
        <div class="result-btns">
            <a href="index.jsp" class="btn btn-primary">Back to Home</a>
            <a href="quizzes.jsp" class="btn btn-danger">Back to Quizzes</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
