<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Edit Quiz - Quiz App</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="style.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 56px; /* Adjusted top padding to account for the fixed navbar */
        }

        .edit-quiz-container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 20px;
        }

        .question-card {
            border: 2px solid #007bff; /* Blue color border */
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .question-card:hover {
            transform: scale(1.03);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .remove-question-btn {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .remove-question-btn:hover {
            background-color: #c82333;
        }

        .add-question-btn {
            background-color: #28a745;
            color: #ffffff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .add-question-btn:hover {
            background-color: #218838;
        }

        .submit-btn {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <!-- Include the navbar.html content here -->
    <%@ include file = "../navbar.jsp" %>
    <!-- Edit Quiz Container -->
    <div class="edit-quiz-container">
        <h2 class="mb-4">Edit Quiz</h2>

        <!-- Quiz Title Input (Populate with the existing quiz title) -->
        <div class="form-group">
            <label for="quizTitle">Quiz Title:</label>
            <input type="text" class="form-control" id="quizTitle" value="Existing Quiz Title" required>
        </div>

        <!-- Dynamic Question Cards Section (Populate with existing question details) -->
        <div id="question-container">
            <div class="question-card">
                <label>Question 1:</label>
                <input type="text" class="form-control question-text" value="Existing Question Text" required>

                <!-- Options for the Question (Populate with existing options) -->
                <div class="options-group">
                    <label>Option 1:</label>
                    <input type="text" class="form-control option" value="Option 1" required>

                    <label>Option 2:</label>
                    <input type="text" class="form-control option" value="Option 2" required>

                    <label>Option 3:</label>
                    <input type="text" class="form-control option" value="Option 3" required>

                    <label>Option 4:</label>
                    <input type="text" class="form-control option" value="Option 4" required>
                </div>

                <!-- Correct Option Dropdown (Populate with existing correct option) -->
                <label for="correctOption" style="color: #000;">Correct Option:</label>
                <select class="form-control correct-option" required>
                    <option value="option1" selected>Option 1</option>
                    <option value="option2">Option 2</option>
                    <option value="option3">Option 3</option>
                    <option value="option4">Option 4</option>
                </select>

                <!-- Remove Question Button -->
                <button class="btn btn-danger remove-question-btn" onclick="removeQuestion(this)">Remove Question</button>
            </div>
        </div>

        <!-- Add Question Button -->
        <button class="btn btn-success add-question-btn" onclick="addQuestion()">Add Question</button>

        <!-- Submit Button -->
        <button class="btn btn-primary submit-btn" onclick="submitQuiz()">Update Quiz</button>
    </div>

    <script>
        var questionNumber = 1;

        function addQuestion() {
            var newQuestionCard = $("#question-container .question-card:first").clone();
            newQuestionCard.find(".question-text, .option").val(""); // Clear input values
            questionNumber++;
            newQuestionCard.find("label:first").text("Question " + questionNumber + ":");
            $("#question-container").append(newQuestionCard);
        }

        function removeQuestion(button) {
            $(button).closest(".question-card").remove();
            questionNumber--; // Decrement the question number when a question is removed
        }

        function submitQuiz() {
            var quizTitle = $("#quizTitle").val();
            var questions = [];

            $(".question-card").each(function(index) {
                var questionText = $(this).find(".question-text").val();
                var options = $(this).find(".option").map(function() { return $(this).val(); }).get();
                var correctOption = $(this).find(".correct-option").val();

                questions.push({
                    questionText: questionText,
                    options: options,
                    correctOption: correctOption
                });
            });

            console.log("Updated Quiz Title:", quizTitle);
            console.log("Updated quiz:", questions);
            // Send the updated data to the server using AJAX or form submission
        }
    </script>

    <!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
