<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>RuangAdmin - Dashboard</title>
        <link href="dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="dashboard/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="dashboard/css/ruang-admin.min.css" rel="stylesheet">
    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-text mx-3">Admin</div>
                </a>
                <hr class="sidebar-divider my-0">
                <li class="nav-item active">
                    <a class="nav-link" href="home">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Home</span></a>
                </li>
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Features
                </div>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBootstrap"
                       aria-expanded="true" aria-controls="collapseBootstrap">
                        <i class="far fa-fw fa-window-maximize"></i>
                        <span>Course</span>
                    </a>
                    <div id="collapseBootstrap" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="#">Manage Course</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"
                       aria-controls="collapseForm">
                        <i class="fab fa-fw fa-wpforms"></i>
                        <span>User</span>
                    </a>
                    <div id="collapseForm" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="form_basics.html">Manage User</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTable" aria-expanded="true"
                       aria-controls="collapseTable">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Lesson</span>
                    </a>
                    <div id="collapseTable" class="collapse" aria-labelledby="headingTable" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="datatables.html">Manage Lesson</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTable1" aria-expanded="true"
                       aria-controls="collapseTable">
                        <i class="fas fa-fw fa-warehouse"></i>
                        <span>Slide</span>
                    </a>
                    <div id="collapseTable1" class="collapse" aria-labelledby="headingTable" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="datatables.html">Manage Slide</a>
                        </div>
                    </div>
                </li>
                <hr class="sidebar-divider">
            </ul>
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
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                            </ol>
                        </div>

                        <div class="row mb-3">
                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-uppercase mb-1">Earnings (Monthly)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                                <div class="mt-2 mb-0 text-muted text-xs">
                                                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
                                                    <span>Since last month</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-primary"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Earnings (Annual) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-uppercase mb-1">Sales</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">650</div>
                                                <div class="mt-2 mb-0 text-muted text-xs">
                                                    <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>
                                                    <span>Since last years</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-shopping-cart fa-2x text-success"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- New User Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-uppercase mb-1">New User</div>
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">366</div>
                                                <div class="mt-2 mb-0 text-muted text-xs">
                                                    <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 20.4%</span>
                                                    <span>Since last month</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-users fa-2x text-info"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-uppercase mb-1">Pending Requests</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                                <div class="mt-2 mb-0 text-muted text-xs">
                                                    <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span>
                                                    <span>Since yesterday</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-warning"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Area Chart -->
                            <div class="col-xl-12 col-lg-12">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Monthly Recap Report</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"
                                               aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                 aria-labelledby="dropdownMenuLink">
                                                <div class="dropdown-header">Dropdown Header:</div>
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="myAreaChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Pie Chart -->
                            <!-- Invoice Example -->
                            <div class="col-xl-8 col-lg-7 mb-5">
                                <div class="card">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Invoice</h6>
                                        <a class="m-0 float-right btn btn-danger btn-sm" href="#">View More <i
                                                class="fas fa-chevron-right"></i></a>
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
                            <!-- Message From Customer-->
                            <div class="col-xl-4 col-lg-5 ">
                                <div class="card">
                                    <div class="card-header py-4 bg-primary d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-light">Message From Customer</h6>
                                    </div>
                                    <div>
                                        <div class="customer-message align-items-center">
                                            <a class="font-weight-bold" href="#">
                                                <div class="text-truncate message-title">Hi there! I am wondering if you can help me with a
                                                    problem I've been having.</div>
                                                <div class="small text-gray-500 message-time font-weight-bold">Udin Cilok � 58m</div>
                                            </a>
                                        </div>
                                        <div class="customer-message align-items-center">
                                            <a href="#">
                                                <div class="text-truncate message-title">But I must explain to you how all this mistaken idea
                                                </div>
                                                <div class="small text-gray-500 message-time">Nana Haminah � 58m</div>
                                            </a>
                                        </div>
                                        <div class="customer-message align-items-center">
                                            <a class="font-weight-bold" href="#">
                                                <div class="text-truncate message-title">Lorem ipsum dolor sit amet, consectetur adipiscing elit
                                                </div>
                                                <div class="small text-gray-500 message-time font-weight-bold">Jajang Cincau � 25m</div>
                                            </a>
                                        </div>
                                        <div class="customer-message align-items-center">
                                            <a class="font-weight-bold" href="#">
                                                <div class="text-truncate message-title">At vero eos et accusamus et iusto odio dignissimos
                                                    ducimus qui blanditiis
                                                </div>
                                                <div class="small text-gray-500 message-time font-weight-bold">Udin Wayang � 54m</div>
                                            </a>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a class="m-0 small text-primary card-link" href="#">View More <i
                                                    class="fas fa-chevron-right"></i></a>
                                        </div>
                                    </div>
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