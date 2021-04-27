<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UsersCRUD</title>

    <!-- Custom fonts for this template-->
    <link href="/theme/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/theme/css/sb-admin-2.min.css" rel="stylesheet">

    <style type="text/css">/* Chart.js */
    @keyframes chartjs-render-animation {
        from {
            opacity: .99
        }
        to {
            opacity: 1
        }
    }

    .chartjs-render-monitor {
        animation: chartjs-render-animation 1ms
    }

    .chartjs-size-monitor, .chartjs-size-monitor-expand, .chartjs-size-monitor-shrink {
        position: absolute;
        direction: ltr;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        overflow: hidden;
        pointer-events: none;
        visibility: hidden;
        z-index: -1
    }

    .chartjs-size-monitor-expand > div {
        position: absolute;
        width: 1000000px;
        height: 1000000px;
        left: 0;
        top: 0
    }

    .chartjs-size-monitor-shrink > div {
        position: absolute;
        width: 200%;
        height: 200%;
        left: 0;
        top: 0
    }</style>
    <style type="text/css">/* Chart.js */
    @keyframes chartjs-render-animation {
        from {
            opacity: .99
        }
        to {
            opacity: 1
        }
    }

    .chartjs-render-monitor {
        animation: chartjs-render-animation 1ms
    }

    .chartjs-size-monitor, .chartjs-size-monitor-expand, .chartjs-size-monitor-shrink {
        position: absolute;
        direction: ltr;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        overflow: hidden;
        pointer-events: none;
        visibility: hidden;
        z-index: -1
    }

    .chartjs-size-monitor-expand > div {
        position: absolute;
        width: 1000000px;
        height: 1000000px;
        left: 0;
        top: 0
    }

    .chartjs-size-monitor-shrink > div {
        position: absolute;
        width: 200%;
        height: 200%;
        left: 0;
        top: 0
    }</style>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center"
           href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/index.html">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <c:url value="/user/list" var="listURL"/>
            <a class="nav-link"
               href="${listURL}">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Powrót</span></a>
        </li>

        <!-- Divider -->


        <!-- Heading -->


        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">

            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Custom Components:</h6>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/buttons.html">Buttons</a>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/cards.html">Cards</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">

            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Custom Utilities:</h6>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/utilities-color.html">Colors</a>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/utilities-border.html">Borders</a>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/utilities-animation.html">Animations</a>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/utilities-other.html">Other</a>
                </div>
            </div>
        </li>

        <!-- Divider -->


        <!-- Heading -->


        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">

            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Login Screens:</h6>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/login.html">Login</a>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/register.html">Register</a>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/forgot-password.html">Forgot
                        Password</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Other Pages:</h6>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/404.html">404
                        Page</a>
                    <a class="collapse-item"
                       href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/blank.html">Blank
                        Page</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Charts -->
        <li class="nav-item">

        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item">

        </li>

        <!-- Divider -->


        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">

                        <div class="input-group-append">

                        </div>
                    </div>
                </form>

                <!-- Topbar Navbar -->


            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
<%--                    wstawiam link który odsyła do servletu UserAdd--%>
                    <c:url value="/user/add" var="addURL"/>
                    <a href="${addURL}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i> Dodaj użytkownika</a>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <!-- Earnings (Monthly) Card Example -->


                    <!-- Earnings (Monthly) Card Example -->


                    <!-- Earnings (Monthly) Card Example -->


                    <!-- Pending Requests Card Example -->

                </div>

                <!-- Content Row -->

                <div class="row">

                    <!-- Area Chart -->
                    <%----------------------------------------------------------------------------------------------------------------------------------%>
                    <div class="col-xl-12 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Lista wszystkich użytkowników</h6>
                            </div>
                            <!-- Card Body -->

<%--                            tworze tabele i jstl'em metoda forEach pobieram kolejnych uzytkownikow user z obiektu User--%>
                            <div class="py-3 d-flex flex-row align-items- justify-content-center">
                                <table border=1 frame=void rules=rows width="90%">
                                    <tr>
                                        <th>ID</th>
                                        <th>Nazwa użytkownika</th>
                                        <th>Email</th>
                                        <th>Akcja</th>
                                    </tr>
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <td><h6 class="m-0 font-weight-bold text-primary">${user.id}</h6></td>
                                            <td><h6 class="m-0 font-weight-bold text-primary">${user.userName}</h6></td>
                                            <td><h6 class="m-0 font-weight-bold text-primary">${user.email}</h6></td>
                                            <td>
<%--                                                wstawiam linki które odsyłają do odpowiednich servletów USUN,EDYTUJ I POKAZ--%>

                                                <a href='<c:url value="/user/delete?id=${user.id}"/>'> Usuń </a>
                                                <a href='<c:url value="/user/edit?id=${user.id}"/>'> Edytuj </a>
                                                <a href='<c:url value="/user/show?id=${user.id}"/>'> Pokaż </a>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>


                            <div class="card-body">
                                <div class="chart-area">
                                    <div class="chartjs-size-monitor">
                                        <div class="chartjs-size-monitor-expand">
                                            <div class=""></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink">
                                            <div class=""></div>
                                        </div>
                                    </div>
                                    <canvas id="myAreaChart" style="display: block; width: 993px; height: 320px;"
                                            width="993" height="320" class="chartjs-render-monitor"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Pie Chart -->

                </div>

                <!-- Content Row -->
                <div class="row">

                    <!-- Content Column -->


                </div>

            </div><!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Your Website 2019</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top" style="display: none;">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary"
                   href="file:///home/krzysztof/Downloads/Szablon/startbootstrap-sb-admin-2-gh-pages/login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<%--<!-- Bootstrap core JavaScript-->--%>
<%--<script src="SB%20Admin%202%20-%20Dashboard_files/jquery_002.js"></script>--%>
<%--<script src="SB%20Admin%202%20-%20Dashboard_files/bootstrap.js"></script>--%>

<%--<!-- Core plugin JavaScript-->--%>
<%--<script src="SB%20Admin%202%20-%20Dashboard_files/jquery.js"></script>--%>

<%--<!-- Custom scripts for all pages-->--%>
<%--<script src="SB%20Admin%202%20-%20Dashboard_files/sb-admin-2.js"></script>--%>

<%--<!-- Page level plugins -->--%>
<%--<script src="SB%20Admin%202%20-%20Dashboard_files/Chart.js"></script>--%>

<%--<!-- Page level custom scripts -->--%>
<%--<script src="SB%20Admin%202%20-%20Dashboard_files/chart-area-demo.js"></script>--%>
<%--<script src="SB%20Admin%202%20-%20Dashboard_files/chart-pie-demo.js"></script>--%>


</body>
</html>
