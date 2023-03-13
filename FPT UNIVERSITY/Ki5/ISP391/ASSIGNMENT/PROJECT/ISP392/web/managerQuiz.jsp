<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin - Dashboard</title>
        <link href="dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="dashboard/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="dashboard/css/ruang-admin.min.css" rel="stylesheet">
    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <%@ include file="component/adminNvabar.jsp" %>
            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <!-- TopBar -->
                    <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
                        <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </nav>
                    <!-- Topbar -->
                    <!-- Container Fluid-->
                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Manager Quiz</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Manager Quiz</li>
                            </ol>
                        </div>
                            <div class="row">
                                <div class="col-lg-12 mb-4">
                                    <!-- Simple Tables -->
                                    <div class="card">
                                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Simple Tables</h6>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table align-items-center table-flush">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>Order ID</th>
                                                        <th>Customer</th>
                                                        <th>Item</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><a href="#">RA0449</a></td>
                                                        <td>Udin Wayang</td>
                                                        <td>Nasi Padang</td>
                                                        <td><span class="badge badge-success">Delivered</span></td>
                                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="#">RA5324</a></td>
                                                        <td>Jaenab Bajigur</td>
                                                        <td>Gundam 90' Edition</td>
                                                        <td><span class="badge badge-warning">Shipping</span></td>
                                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="#">RA8568</a></td>
                                                        <td>Rivat Mahesa</td>
                                                        <td>Oblong T-Shirt</td>
                                                        <td><span class="badge badge-danger">Pending</span></td>
                                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="#">RA1453</a></td>
                                                        <td>Indri Junanda</td>
                                                        <td>Hat Rounded</td>
                                                        <td><span class="badge badge-info">Processing</span></td>
                                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="#">RA1998</a></td>
                                                        <td>Udin Cilok</td>
                                                        <td>Baby Powder</td>
                                                        <td><span class="badge badge-success">Delivered</span></td>
                                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="card-footer"></div>
                                    </div>
                                </div>
                            </div>
                        <!--Row-->
                    </div>
                    <!---Container Fluid-->
                </div>
            </div>
        </div>

        <!-- Scroll to top -->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <script src="dashboard/vendor/jquery/jquery.min.js"></script>
        <script src="dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="dashboard/js/ruang-admin.min.js"></script>
        <script src="dashboard/vendor/chart.js/Chart.min.js"></script>
        <script src="dashboard/js/demo/chart-area-demo.js"></script>  
    </body>

</html>