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


  if (!exists) {
%>
    <script>
        alert("Page Access Denied , You Need Login To Access This Page");
        window.location.href = "index.jsp";
    </script>
<%
    }
%>

<html>
<head>
    <title>Logout</title>
</head>

<script>
    var response = confirm("Are Sure You Wanna Logout ?");

    if(response){
        
        window.location.href = "Logout";
    }
    else{

        alert("Logout Cancelled");
        window.location.href = "index.jsp";

    }
</script>
</html>