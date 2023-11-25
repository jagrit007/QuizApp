<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Quiz App - Quiz Page</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .quiz-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .quiz-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .quiz-question {
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 15px;
        }

        .quiz-option {
            background-color: #007bff;
            color: #ffffff;
            border: 1px solid #007bff;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .quiz-option:hover {
            background-color: #0056b3;
        }

        .quiz-progress {
            margin-bottom: 20px;
        }

        .quiz-counter {
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 20px;
        }

        .quiz-submit,
        .quiz-exit {
            padding: 15px 30px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .quiz-submit {
            background-color: #28a745;
            color: #ffffff;
            border: none;
            margin-bottom: 10px;
        }

        .quiz-submit:hover {
            background-color: #218838;
        }

        .quiz-exit {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
        }

        .quiz-exit:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <%@ include file = "navbar.jsp" %>
    <!-- Quiz Container -->
    <div class="container quiz-container">
        <!-- Quiz Title -->
        <div class="quiz-title text-center">
            <h2>General Knowledge Quiz</h2>
        </div>

        <!-- Quiz Progress Bar -->
        <div class="progress quiz-progress">
            <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>

        <!-- Quiz Counter -->
        <div class="quiz-counter text-right">
            Time Remaining: <span id="timer">60</span> seconds
        </div>

        <!-- Quiz Question -->
        <div class="quiz-question">
            Question 1: What is the capital of France?
        </div>

        <!-- Quiz Options -->
        <div class="quiz-option" onclick="checkAnswer(this)">A. Paris</div>
        <div class="quiz-option" onclick="checkAnswer(this)">B. London</div>
        <div class="quiz-option" onclick="checkAnswer(this)">C. Berlin</div>
        <div class="quiz-option" onclick="checkAnswer(this)">D. Rome</div>

        <!-- Quiz Submit and Exit Buttons -->
        <button class="btn btn-success btn-block quiz-submit" onclick="submitQuiz()">Submit</button>
        <button class="btn btn-danger btn-block quiz-exit" onclick="exitQuiz()">Exit Quiz</button>
    </div>

    <!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Custom JavaScript -->
    <script>
        // Timer
        var timer = 60;
        var timerInterval = setInterval(function () {
            timer--;
            document.getElementById('timer').textContent = timer;
            if (timer <= 0) {
                clearInterval(timerInterval);
                alert('Time is up!');
            }
        }, 1000);

        // Function to check the selected answer
        function checkAnswer(option) {
            // You can add your logic here to check the selected answer
            // For example, highlight the correct answer or move to the next question

            // For demonstration purposes, let's change the background color of the selected option
            option.style.backgroundColor = '#28a745';
            option.style.borderColor = '#28a745';
            option.style.color = '#ffffff';
        }

        // Function to submit the quiz
        function submitQuiz() {
            // You can add your logic here to calculate the quiz score or navigate to the next question
            alert('Quiz submitted!');
            clearInterval(timerInterval);
        }

        // Function to exit the quiz
        function exitQuiz() {
            // You can add your logic here to confirm the user's intention to exit
            alert('Quiz exited!');
            clearInterval(timerInterval);
        }
    </script>
</body>
</html>
