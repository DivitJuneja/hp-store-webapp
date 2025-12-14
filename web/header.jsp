<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    <title>Hp World</title>
    <link rel="icon" href="images/hp2.png">
</head>

<body id="bod" class="user-select-none"> 
    <nav id="a" class="navbar navbar-expand-lg fixed-top transparent">
        <div class="container">
            <a class="navbar-brand col-3" href="index.jsp">
                <h3><span><i class="fa-solid fa-laptop ico"></i></span>Hp World</h3>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Products
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="laptops.jsp">Laptops</a></li>
                            <li><a class="dropdown-item" href="printers.jsp">Printers</a></li>
                            <li><a class="dropdown-item" href="pc.jsp">PC</a></li>
                            <li><a class="dropdown-item" href="accessories.jsp">Accessories</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Services
                        </a>
                        <ul class="dropdown-menu">
                             <li><a class="dropdown-item" href="trackorder.jsp">Track Order</a></li>
                            <li><a class="dropdown-item" href="contactus.jsp">Contact Us</a></li>
                            <%
                            if(session.getAttribute("mail")==null)
                            {%>
                                <li><a class="dropdown-item" href="login.jsp">Login</a></li>
                                <li><a class="dropdown-item" href="signup.jsp">Sign Up</a></li>
                            <%  }
                                else
                                 { %>
                                   <li><a class="dropdown-item" href="dashboard.jsp">My Profile</a></li>
                                    <li><a class="dropdown-item" href="myorders.jsp">My Orders</a></li>
                                     <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                                  <%}
                                  %>
                                   
<!--                             the above code is written that if the userpanel page(uname 
                             attribute is only passed when this page is opened)
                             opens then signup and login 
                             should disappear and only logout should be shown -->
                        </ul>
                    </li>
                    
                </ul>
                <a href="contact.html"><button class="btn btn1 btn-outline-success bs mx-3" type="submit">Purchase</button></a>
            </div>
        </div>
    </nav>
</body>
</html>

    <!-- navigation closed -->
