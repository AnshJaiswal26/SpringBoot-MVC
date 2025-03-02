<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="index2.css">
    <script>
        // Function to show the success message temporarily
        function showMessage() {
            var message = document.getElementById("successMessage");
            var message1 = document.getElementById("errorMessage");
            var message2 = document.getElementById("error");

            // Show the message
            message.style.display = "block";
            message1.style.display = "block";
            message2.style.display = "block";

            // Hide the message after 3 seconds
            setTimeout(function() {
                message.style.display = "none";
            }, 2000);

            setTimeout(function() {
                message1.style.display = "none";
            }, 2000);

            setTimeout(function() {
                message2.style.display = "none";
            }, 2000);
        }

        // Call the function to display the message when the page loads
        window.onload = function() {
            // Check if there is a success message and call showMessage()
            <% if (request.getAttribute("successMsg") != null) { %>
            showMessage();
            <% } %>
            <% if (request.getAttribute("errorMsg") != null) { %>
            showMessage();
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
            showMessage();
            <% } %>
        };
    </script>
</head>
<body class="body">
<form action="SubmitRegister" id="form" method="post">
    <section class="mainSection">
        <section id="h1Section"><h1 id="heading1">Register Form</h1></section>

        <!-- Conditional rendering for success/error messages -->
        <c:if test="${not empty successMsg}">
            <h5 style="color: green" id="successMessage">${successMsg}</h5>
        </c:if>
        <c:if test="${not empty errorMsg}"><h5 style="color: red" id="errorMessage">${errorMsg}</h5></c:if>
        <c:if test="${not empty error}"><h5 style="color: red" id="error">${error}</h5></c:if>

        <section id="tableSection1">
            <table id="table1">
                <tr id="row1">
                    <td id="td1"><img alt="email" src="images/email.png" width="28px"></td>
                    <td id="td2"><input id="email" name="email" placeholder="Enter Email" type="text" required></td>
                </tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr id="row2">
                    <td><img alt="pass" src="images/passImage.png" width="25px"></td>
                    <td><input id="pass" name="password" placeholder="Enter Password" type="password" required></td>
                </tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr id="row3">
                    <td><img alt="person" src="images/person.png" width="27px"></td>
                    <td><input id="person" name="name" placeholder="Enter Name" type="text" required></td>
                </tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr id="row4">
                    <td><img alt="phone" src="images/phone.png" width="29px"></td>
                    <td><input id="phone" name="phone" placeholder="Enter Phone" type="text" required ></td>
                </tr>
            </table>
        </section>

        <br/>
        <section id="tableSection2">
            <table>
                <tr id="row5">
                    <td colspan="2"><button id="button">Register</button></td>
                </tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr id="row6">
                    <td colspan="2"><span id="account">Already have an account?</span><a href="loginReq" id="reg">Login Here</a></td>
                </tr>
            </table>
        </section>
        <br/>
    </section>
</form>
</body>
</html>
