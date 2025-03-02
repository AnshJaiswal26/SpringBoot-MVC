<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="index2.css">

    <script>
        // Function to show the success message temporarily
        function showMessage() {
            var message1 = document.getElementById("logErrorMessage");

            // Show the message
            message1.style.display = "block";

            setTimeout(function() {
                message1.style.display = "none";
            }, 2000);

        }

        window.onload = function() {
            // Check if there is a success message and call showMessage()
            <% if (request.getAttribute("logErrorMsg") != null) { %>
            showMessage();
            <% } %>
        };
    </script>

</head>
<body class="body">
<form action="SubmitLogin" id="form" method="post">
    <section class="mainSection">
        <section id="h1Section"><h1 id="heading1">Login Form</h1></section>

        <c:if test="${not empty logErrorMsg}"><h5 style="color: red" id="logErrorMessage">${logErrorMsg}</h5></c:if>

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
                    <td><input id="pass" name="password" placeholder="Enter Password" type="password" required>
                    <td>
                </tr>
            </table>
        </section>

        <br/>
        <section id="tableSection2">
            <table>
                <tr id="row3">
                    <td colspan="2">
                        <button id="button">Login</button>
                    </td>
                </tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr id="row4">
                    <td colspan="2"><span id="account">create an account?</span><a href="registerReq" id="reg">Register here</a></td>
                </tr>
            </table>
        </section>
        <br/>
    </section>
</form>
</body>
</html>