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
    <style>
        body {
            padding-top: 56px; /* Adjusted top padding to account for the fixed navbar */
        }

        .navbar {
            background-color: #007bff;
        }

        .navbar-brand {
            color: #ffffff;
            font-weight: bold;
            font-size: 1.5rem; /* Increase font size for brand */
        }

        .navbar-brand:hover {
            color: #ffffff;
        }

        .navbar-nav .nav-link {
            color: #ffffff;
        }

        .navbar-nav .nav-link:hover {
            color: #ffffff;
        }

        .user-dropdown {
            position: relative;
            display: inline-block;
            cursor: pointer;
            margin-top: 8px; /* Add some top margin to align with other items */
        }

        .user-dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            z-index: 1;
            right: 0; /* Align the dropdown to the right */
        }

        .user-dropdown:hover .user-dropdown-content {
            display: block;
        }

        .user-dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .user-dropdown-content a:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <a class="navbar-brand" href="#">Quiz App</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Quizzes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                    <!-- Include the user dropdown here -->
                    <div class="user-dropdown">
                        <%-- Check if the user is logged in --%>
                        <% if (session.getAttribute("username") != null) { %>
                            <span><%= session.getAttribute("username") %></span>
                            <div class="user-dropdown-content">
                                <a href="#">Profile</a>
                                <a href="#">Log Out</a>
                            </div>
                        <% } %>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
