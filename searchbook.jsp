<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.IOException" %>

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
        alert("Page Access Denied. You Need To Login To Access This Page.");
        window location.href = "index.jsp";
    </script>
<%
    }
%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search A Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous">
    <link rel="icon" href="IMAGES/MAIN_ICON.png" type="image/icon type">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="STYLES/searchbookstyle.css">
    <link rel="stylesheet" type="text/css" href="STYLES/buttonstyle.css">
  </head>
  <body>
    <h1 class="title center">Ebook Site</h1><br><br>
    <div class="form">
        <form action="" method="GET">
            <input type="text" placeholder="Enter Book Name" name="userinputbook" class="form-control bookname"><br><br><br>
            <input type="submit" class="position-absolute start-50 translate-middle btn btn-outline-dark submitbtn" value="Search" name="submitbutton">
        </form>
    </div>
    <div class="container">
        <div class="row d-flex">
        <%
            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebooks", "root", "");

                String submitButton = request.getParameter("submitbutton");
                Statement stmt = conn.createStatement();

                // Retrieve search history from cookies
                String searchHistory = "";
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie c : cookies) {
                        if (c.getName().equals("bookSearchHistory")) {
                            searchHistory = c.getValue().replace("_", " "); // Replace underscores with spaces
                            out.print(searchHistory);
                            break;
                        }
                    }
                }

                ResultSet allBooksData = null; // Initialize the variable here

                if (submitButton != null) {
                    String searchInput = request.getParameter("userinputbook");
                    if (!searchInput.isEmpty()) {
                        searchInput = searchInput.toLowerCase();

                        allBooksData = stmt.executeQuery("SELECT * FROM books_data;");

                        if (!allBooksData.next()) {
                            out.print("<script>alert('No Books Found In Database, Try Again After Some Time');</script>");
                        } else {
                            do {
                                String keywords[] = allBooksData.getString(6).split(",");
                                for (String keyword : keywords) {
                                    keyword = keyword.toLowerCase(); // Convert keyword to lowercase
                                    String searchInputLower = searchInput.toLowerCase(); // Convert search input to lowercase
                                    if (searchInputLower.equals(keyword)) {
                                        // Append search input to search history
                                        if (!searchHistory.contains(searchInput)) {
                                            searchHistory = searchHistory.isEmpty() ? searchInput : searchHistory + "." + searchInput;
                                            Cookie historyCookie = new Cookie("bookSearchHistory", searchHistory.replace(" ", "_")); // Replace spaces with underscores
                                            historyCookie.setMaxAge(60 * 60);
                                            response.addCookie(historyCookie);
                                        }
                                        // Display book details
                                        String name = allBooksData.getString(1);
                                        String authorName = allBooksData.getString(2);
                                        String bookLocation = allBooksData.getString(3);
                                        String posterLocation = allBooksData.getString(4);
                                        String fullName = allBooksData.getString(5);
                                        out.print("<div class='col-lg-4'>");
                                        out.print("<div class='w3-card-4 box'>");
                                        out.print("<img src='http://localhost:9090/ebook-library-servlet-jsp/POSTER/" + posterLocation + "' title='" + fullName + " - " + authorName + "'>");
                                        out.print("<div class='w3-container w3-center text'>");
                                        out.print("<p>" + name + "</p>");
                                        out.print("<a href='BOOKS/" + bookLocation + "' class='button-30 btn' role='button' target='_blank'>View</a>");
                                        out.print("<a href='BOOKS/" + bookLocation + "' class='button-30' download='" + bookLocation + "'>Download</a>");
                                        out.print("</div>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    }
                                }
                            } while (allBooksData.next());
                        }
                    } else {
                        out.print("<script>alert('Please Enter Keyword Or Book Name To Search');</script>;");
                    }
                } else {
                    // Reinitialize ResultSet to retrieve books based on search history
                    allBooksData = stmt.executeQuery("SELECT * FROM books_data;");
                    // Use search history from cookies for displaying books
                    if (!searchHistory.isEmpty()) {
                        String[] searchedKeywords = searchHistory.split("\\."); // Use '.' as separator
                        while (allBooksData.next()) {
                            // Display books based on search history
                            String name = allBooksData.getString(1);
                            String authorName = allBooksData.getString(2);
                            String bookLocation = allBooksData.getString(3);
                            String posterLocation = allBooksData.getString(4);
                            String fullName = allBooksData.getString(5);
                            out.print("<div class='col-lg-4'>");
                            out.print("<div class='w3-card-4 box'>");
                            out.print("<img src='http://localhost:9090/ebook-library-servlet-jsp/POSTER/" + posterLocation + "' title='" + fullName + " - " + authorName + "'>");
                            out.print("<div class='w3-container w3-center text'>");
                            out.print("<p>" + name + "</p>");
                            out.print("<a href='BOOKS/" + bookLocation + "' class='button-30 btn' role='button' target='_blank'>View</a>");
                            out.print("<a href='BOOKS/" + bookLocation + "' class='button-30' download='" + bookLocation + "'>Download</a>");
                            out.print("</div>");
                            out.print("</div>");
                            out.print("</div>");
                        }
                    }
                }
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
        </div>
    </div>
    <footer>
        <div class="card text-center card-body">
            <div class="buttontext">
                <p class="card-text">Return To Home Page</p>
            </div>
            <div class="button">
                <button class="btn btn-outline-dark homePageButton" id="homePage">Home</button>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFu
</html>
