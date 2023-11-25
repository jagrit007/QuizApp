<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="data.dto.QuestionDto" %>
<%@ page import="java.util.List" %>
<%! List<QuestionDto> questionList = new ArrayList<>(); %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<!-- Add your question DTO objects to the questionList -->
<%
    // Example questions, replace with your actual data
    questionList.add(new QuestionDto("1", "What is the capital of France?", "Paris", "London", "Berlin", "Rome", 1, "quiz1"));
    questionList.add(new QuestionDto("2", "What is the capital of Germany?", "Paris", "London", "Berlin", "Rome", 3, "quiz1"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Quiz App - Take Quiz</title>

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
            text-align: center;
        }

        .quiz-question {
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 15px;
            text-align: center;
        }

        .quiz-option {
            background-color: #007bff; /* Different color */
            color: #ffffff;
            border: 1px solid #007bff;
            border-radius: 5px;
            padding: 10px; /* Adjusted padding */
            margin-bottom: 10px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            text-align: center;
            width: 80%; /* Adjusted width */
            margin-left: auto; /* Center the option */
            margin-right: auto; /* Center the option */
            font-size: 16px; /* Increased font size */
        }

        .quiz-option.selected {
            background-color: #28a745;
            border-color: #28a745;
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
            text-align: center;
        }

        .quiz-navigation {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .quiz-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .quiz-submit,
        .quiz-exit,
        .quiz-save {
            padding: 15px 30px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .quiz-save {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            margin: 20px auto; /* Center the button */
            display: block;
            margin-bottom: 10px;
        }

        .quiz-save:hover {
            background-color: #0056b3;
        }

        .quiz-submit {
            background-color: #28a745;
            color: #ffffff;
            border: none;
            margin-right: 10px;
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
        <div class="quiz-title">
            <h2>General Knowledge Quiz</h2>
        </div>

        <!-- Quiz Progress Bar -->
        <div class="progress quiz-progress">
            <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>

        <!-- Quiz Counter -->
        <div class="quiz-counter" id="timerDisplay">
            Time Remaining: <span id="minutes">15</span> minutes <span id="seconds">00</span> seconds
        </div>

        <!-- Quiz Navigation Buttons -->
        <div class="quiz-navigation">
            <button class="btn btn-primary" onclick="previousQuestion()">Previous</button>
            <button class="btn btn-primary" onclick="nextQuestion()">Next</button>
        </div>

        <!-- Retrieve the QuestionDto object from the session -->
        <%
            QuestionDto questionDto = (QuestionDto) session.getAttribute("quizjagrittttt");
            if (questionDto != null) {
                // Iterate through the questions and display them
                int questionIndex = 1;
                for (String option : questionDto.getOption()) {
        %>
                    <!-- Quiz Question -->
                    <div class="quiz-question">
                        Question <%= questionIndex %>: <%= questionDto.getQuestionTitle() %>
                    </div>

                    <!-- Quiz Options -->
                    <div class="quiz-option" onclick="selectOption(this, <%= option.index %>)"><%= option %></div>
        <%
                    questionIndex++;
                }
        %>
                <!-- Save Button -->
                <button class="btn btn-primary quiz-save" onclick="saveResponse()">Save Response</button>
        <%
            }
        %>

        <!-- Quiz Submit and Exit Buttons -->
        <div class="quiz-actions">
            <button class="btn btn-success quiz-submit" onclick="submitQuiz()">Submit Quiz</button>
            <button class="btn btn-danger quiz-exit" onclick="exitQuiz()">Exit Quiz</button>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Custom JavaScript -->
    <script>
        // Timer
        var timer = 900; // 15 minutes
        var timerInterval = setInterval(function () {
            timer--;
            var minutes = Math.floor(timer / 60);
            var seconds = timer % 60;
            document.getElementById('minutes').textContent = minutes < 10 ? '0' + minutes : minutes;
            document.getElementById('seconds').textContent = seconds < 10 ? '0' + seconds : seconds;

            if (timer <= 0) {
                clearInterval(timerInterval);
                submitQuiz(); // Automatically submit quiz when time is up
            }
        }, 1000);

        // Map to store selected options for each question
        var selectedOptions = new Map();

        // Function to select an option
        function selectOption(option, index) {
            // Remove 'selected' class from all options
            var allOptions = document.querySelectorAll('.quiz-option');
            allOptions.forEach(function (opt) {
                opt.classList.remove('selected');
            });

            // Add 'selected' class to the clicked option
            option.classList.add('selected');
            selectedOptions.set(questionNumber, index);
            console.log('Selected option:', index);
        }

        // Function to save the response
        function saveResponse() {
            // You can add your logic here to save the response
            alert('Response saved!');
        }

        // Function to navigate to the previous question
        function previousQuestion() {
            // You can add your logic here to navigate to the previous question
            alert('Navigating to the previous question.');
        }

        // Function to navigate to the next question
        function nextQuestion() {
            // You can add your logic here to navigate to the next question
            alert('Navigating to the next question.');
        }

        // Function to submit the quiz
        function submitQuiz() {
            // You can add your logic here to submit the quiz
            alert('Quiz submitted!');
            clearInterval(timerInterval);

            // Submit saved responses
            console.log('Saved responses:', selectedOptions);
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
