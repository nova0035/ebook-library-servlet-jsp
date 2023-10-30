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
        window.location.href = "index.jsp";
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
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link rel="icon" href="IMAGES/MAIN_ICON.png" type="image/icon type">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="STYLES/searchbookstyle.css">
    
  </head>
  <body>

    <h1 class="title center">Ebook Site</h1> <br><br>
    <div class="form">
        <form action="" method="GET">

            <input type="text" placeholder="Enter Book Name" name="userinputbook" class="form-control bookname"> <br><br><br>

            <input type="submit" class="position-absolute start-50 translate-middle btn btn-outline-dark submitbtn" value="Search" name="submitbutton">
        </form>
    </div>

    <div class="container">
        <div class="row d-flex">

        <!-- <?php 

            // $conn = mysqli_connect("localhost", "root", "", "book_store");

            // function displayBooks($name,$fullName,$authorName,$posterLocation,$bookLocation){

            //     echo '<div class="col-lg-4">';
            //     echo '<div class="w3-card-4 box">';
            //     echo '<img src="' . $posterLocation . '" title="' .$fullName .' - '. $authorName . '">';
            //     echo '<div class="w3-container w3-center text">';
            //     echo '<p>' . $name . '</p>';
            //     echo '<a href="POSTER/' . $bookLocation . '" class="button-30 btn" role="button" target="_blank">View</a>';
            //     echo '<a href="BOOK/' . $bookLocation . '" class="button-30" download="demopdf">Download</a>';
            //     echo '</div>';
            //     echo '</div>';
            //     echo '</div>';
            // }

            // if (isset($_GET['submitbutton'])) {

            //     if(empty($_GET['userinputbook'])){

            //         echo "<script>alert('Please Enter Keyword Or Book Name To Search');</script>";
            //     }

            //     else{

            //         if ($conn) {

            //             $sql = "SELECT * FROM booksdata";
            //             $result1 = mysqli_query($conn, $sql);
    
            //             $flag = FALSE;

            //             $inputKeyword = $_GET["userinputbook"];
            //             $inputKeyword = strtolower($inputKeyword);

            //             if(empty($_COOKIE["searchKeywords"])){

            //                 $inputKeyword = $inputKeyword . ",";
            //                 setcookie("searchKeywords",$inputKeyword,time() + 3600);
            //             }
            //             else{
                            
            //                 $flag = FALSE;

            //                 $srchKeywords = explode(",",$_COOKIE["searchKeywords"]);

            //                 foreach($srchKeywords as $kyWord){

            //                     if(!($kyWord == $inputKeyword)){
            //                         $flag = TRUE;
            //                     }
            //                 }

            //                 if($flag){

            //                     $inputKeyword = $_COOKIE["searchKeywords"] . $inputKeyword . ",";
            //                     setcookie("searchKeywords",$inputKeyword,time() +3600);
            //                 }
                                       
            //             }

            //             while ($data = mysqli_fetch_assoc($result1)) {
            //                 $keywords = explode(",", $data['keywords']);
    
            //                 foreach ($keywords as $keyword) {
    
            //                     $keyword = trim($keyword);
            //                     $input = strtolower($_GET['userinputbook']);
    
            //                     if ($input == $keyword) {
    
            //                         $flag = TRUE;
            //                         displayBooks($data["book_name"],$data["fullname"],$data['author_name'],$data['poster_location'],$data['booklocation']);
                                    
            //                     }
            //                 }
            //             }
    
            //             if(!$flag){
    
            //                 echo "<script>alert('Sorry :) , Book Not Found ');</script>";
            //             }
            //         }
            //     } 
            // }

            // else{

            //     if(isset($_COOKIE["searchKeywords"])){

            //         if ($conn) {
                        
            //             $sql = "SELECT * FROM booksdata";                                     
            //             $result1 = mysqli_query($conn, $sql);
                                    
            //             $displayedBooks = array(); // Array to store displayed book names

            //             while ($data = mysqli_fetch_assoc($result1)) {
            //                 $keywords = explode(",", $data['keywords']);
            //                 $searchedKeywords = explode(",", $_COOKIE["searchKeywords"]);

            //                 foreach ($searchedKeywords as $sechKeywrds) {
            //                     foreach ($keywords as $keyword) {
            //                         $sechKeywrds = trim($sechKeywrds);

            //                         if ($sechKeywrds == $keyword && !in_array($data['name'], $displayedBooks)) {
            //                             displayBooks($data["name"], $data["fullname"], $data['authorname'], $data['poster_location'], $data['booklocation']);
            //                             $displayedBooks[] = $data['name']; // Add displayed book name to the array
            //                         }
            //                     }
            //                 }
            //             }
            //         }
            //     }  
            // }

        // ?> -->

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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script type="text/javascript">
    document.getElementById("homePage").onclick = function () {
        location.href = "index.jsp";
    };
</script>
  </body>
</html>