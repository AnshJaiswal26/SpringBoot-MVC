<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .container {
            text-align: center;
            max-width: 800px;
        }
        .profile-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 300px;
            margin: auto;
        }
        .profile-card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .profile-card h2 {
            margin: 10px 0;
        }
        .profile-card p {
            color: gray;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
            border: none;
            font-size: 16px;
        }
        .btn:hover {
            background: #0056b3;
        }
        #logout{
            border: black;
            text-decoration: none;
            font-size: larger;
            font-weight: bolder;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to My Profile</h1>
        <p>Explore my details and interact with the buttons below!</p>
        <div class="profile-card">
            <img src="/images/user.png" alt="Profile">
            <h2>${user_name}</h2>
            <p>Web Developer</p>
            <button class="btn" onclick="showDetails()">More Details</button>
            <button class="btn" onclick="toggleFollow(this)">Follow</button>
        </div>
    </div>
    
    <script>

        var name = "${user_name}";
        function showDetails() {
            alert(name+" is a passionate web developer with 1 years of experience in creating stunning websites.");
        }
        function toggleFollow(button) {
            if (button.innerText === "Follow") {
                button.innerText = "Following";
                button.style.background = "green";
            } else {
                button.innerText = "Follow";
                button.style.background = "#007bff";
            }
        }
    </script>
    <br/>
<a href="logout" id="logout">logout</a>
</body>
</html>
