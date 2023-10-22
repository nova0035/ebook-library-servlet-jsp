
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="STYLES/homestyle.css">
    <link rel="icon" href="IMAGES/HOME_EBOOK_ICON.png" type="image/icon type">
    <title>XYZ Ebooks</title>
    
</head>
<body>
<!--HEADER CODE START-->
<header class="text-gray-600 body-font">
    <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
           
            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
              <rect x="15" y="20" width="70" height="60" rx="10" ry="10" fill="#3498db" />
              <path d="M25 20 L50 45 L75 20" fill="none" stroke="#2980b9" stroke-width="6" />
              <line x1="50" y1="45" x2="50" y2="90" stroke="#ecf0f1" stroke-width="4" />
              <rect x="15" y="90" width="70" height="10" rx="5" ry="5" fill="#ecf0f1" />
            </svg>

            <span class="ml-3 text-xl">XYZ Ebooks</span>
        </a>
        <nav class="md:mr-auto md:ml-4 md:py-1 md:pl-4 md:border-l md:border-gray-400 flex flex-wrap items-center text-base justify-center">
            <a href="searchbook.php" class="mr-5 hover:text-gray-900">Search Book</a>
            <a href="admin.php" class="mr-5 hover:text-gray-900">Admin Panel</a>

            <%

                Cookie ck[] = request.getCookies();
                boolean loged_in = false;
                if(ck!=null){
                    for(Cookie c : ck){
                        if(c.getName().equals("username")){
                            loged_in = true;
                        }
                    }
                }

                if(loged_in){
                    out.print("<a href='logout.jsp' class='mr-5 hover:text-gray-900'>Logout</a>");
                }
                else{
                    out.print("<a href='login.jsp' class='mr-5 hover:text-gray-900'>Login</a>");
                    out.print("<a href='signup.jsp' class='mr-5 hover:text-gray-900'>Sign Up</a>");
                }

            %>

        </nav>

    </div>
</header>

<section class="text-gray-600 body-font">
    <div class="container mx-auto flex px-5 py-24 md:flex-row flex-col items-center">
        <div class="lg:max-w-lg lg:w-full md:w-1/2 w-5/6 mb-10 md:mb-0">
            <img class="object-cover object-center rounded" alt="image of books" src="IMAGES/HOME_IMAGE.jpg">
        </div>
        <div class="lg:flex-grow md:w-1/2 lg:pl-24 md:pl-16 flex flex-col md:items-start md:text-left items-center text-center">
            <h1 class="title-font sm:text-4xl text-3xl mb-4 font-medium text-gray-900">Unlock the World of eBooks:
                <br class="hidden lg:inline-block"> Where Stories and Knowledge Await
            </h1>
            <p class="mb-8 leading-relaxed">Explore the boundless realm of knowledge and fiction in our eBook collection. Dive into captivating stories, embark on journeys of self-discovery, and expand your horizons, all from the comfort of your screen.</p>
            <div class="flex justify-center">
                <button id="myButton" class="inline-flex text-white bg-purple-500 border-0 py-2 px-6 focus:outline-none hover:bg-purple-600 rounded text-lg">Search Book &#128270;</button>
            </div>
        </div>
    </div>


<!-- <script type="text/javascript">
    document.getElementById("myButton").onclick = function () {
        location.href = "searchbook.php";
    };
</script> -->
</body>
</html>