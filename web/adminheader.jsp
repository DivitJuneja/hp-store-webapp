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
    <%
                            if(session.getAttribute("aname")!=null)
                            {%>
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
                                <a class="nav-link active" aria-current="page" href="adminpanel.jsp">Home</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    Add
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="outlet.jsp">Add outlet</a></li>
                                    <li><a class="dropdown-item" href="stock.jsp">Add Stock</a></li>
                                    <li><a class="dropdown-item" href="sales.jsp">Add Sales</a></li>
                                 </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    List
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="stock_list.jsp">Stock List</a></li>
                                    <li><a class="dropdown-item" href="sales_list.jsp">Sales List</a></li>
                                    <li><a class="dropdown-item" href="orders.jsp">Orders List</a></li>
                                    <li><a class="dropdown-item" href="outlet_list.jsp">Outlet List</a></li>
                                 </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="logout.jsp">Logout</a>
                            </li>

                                </ul>


                    </div>
                </div>
            </nav>
<%}
%> 
</body>
</html>

    <!-- navigation closed -->

