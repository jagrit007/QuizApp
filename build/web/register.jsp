<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sign Up - Quiz App</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .signup-container {
            max-width: 400px;
            width: 100%;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .signup-title {
            text-align: center;
            color: #007bff;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border: 1px solid #ced4da;
            border-radius: 5px;
            height: 40px;
        }

        .signup-btn {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .signup-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Sign Up Container -->
    <div class="signup-container">
        <h2 class="signup-title">Sign Up</h2>
        <form action="AuthServlet" method="post">
            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <input type="text" name="name" id="fullname" class="form-control" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="Enter your email" required>
            </div>

<!--            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" class="form-control" placeholder="Choose a username" required>
            </div>-->
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Choose a password" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block signup-btn">Sign Up</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
