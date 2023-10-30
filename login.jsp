<% 
    Cookie ck[] = request.getCookies();
    boolean exists = false;

    if (ck != null) {
        for (Cookie c : ck) {
            if (c.getName().equals("username")) {
                exists = true;
                break;
            }
        }
    }

    if (exists) {
%>
    <script>
        alert("Page Access Denied. Already Logged In.");
        window.location.href = "index.jsp";
    </script>
<%
    }
%>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login</title>
        <link rel="icon" type="image/png" href="IMAGES/LOGIN_ICON.png"/>
         <link rel="stylesheet" href="STYLES/buttonstyle.css"> <!-- for button style -->
         <link rel="stylesheet" href="STYLES/formstyle.css"> <!-- for input form style-->
        
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Lato&display=swap');
        </style>
    </head>

    <body>
        
        <div class="Frm">
            <form action="Login" method="POST" class="form" onsubmit="return validateForm()">
            <h1 class="title">Login</h1>

            <div class="inputContainer">
                <input type="text" name="userinput" class="input" placeholder="a" required>
                <label for="" class="label">Username Or Email</label>
            </div>

            <div class="inputContainer">
                <input type="password" name="password" class="input" placeholder="a" required>
                <label for="" class="label">Password</label>
            </div>

            <input type="submit" name="submit" class="submitBtn" value="Login">
            <span id="error" class="error"></span>
            </form>
        </div>

        <div class="buttoncontainer">
            <a href="index.jsp"class="button-30" role="button">Home</a>
        </div>

        <script>
            function validateForm() {
                var userinput = document.forms[0]["userinput"].value;
                var password = document.forms[0]["password"].value;
                var errorElement = document.getElementById("error");

                if (userinput === "" || password === "") {
                errorElement.innerText = "Please fill in all fields";
                return false;
                } else {
                errorElement.innerText = ""; 
                return true; 
                }
            }

        </script>
    </body>
</html>