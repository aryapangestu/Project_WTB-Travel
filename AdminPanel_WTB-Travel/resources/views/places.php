<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Admin Panel - WTB Travel</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    
    <!-- Vendor CSS Files -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

<div class="d-flex align-items-center justify-content-between">
    <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">WTB Travel</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn"></i>
</div><!-- End Logo -->

<nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">
        <li class="nav-item dropdown pe-3">
            <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
                <span class="d-none d-md-block dropdown-toggle ps-2">Admin</span>
            </a><!-- End Profile Iamge Icon -->
            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                    <i class="bi bi-box-arrow-right"></i>
                    <span>Sign Out</span>
                    </a>
                </li>
            </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->
    </ul>
</nav><!-- End Icons Navigation -->

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
    <a class="nav-link collapsed" href="index.html">
        <i class="bi bi-grid"></i>
        <span>Dashboard</span>
    </a>
    </li><!-- End Dashboard Nav -->
    <li>
    <a class="nav-link " href="places.html">
        <i class="bi bi-building"></i>
        <span>Places</span>
    </a>
    </li>
    <a class="nav-link collapsed" href="users.html">
        <i class="bi bi-people"></i>
        <span>Users</span>
    </a>
    </li>
</aside><!-- End Sidebar-->

<main id="main" class="main">

<div class="pagetitle">
    <h1>Places</h1>
    <nav>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
        <li class="breadcrumb-item active">Places</li>
    </ol>
    </nav>
</div><!-- End Page Title -->
<button type="submit" class="btn btn-dark rounded-pill" style="width: auto; margin-bottom: 1rem;">
    <a href="addplaces.html" class="text-light">
        + Add Place
    </a>
</button>
<div class="col-12">
    <div class="card">
        <div>
            <div class="d-flex align-items-center">
                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="margin-left: 20px;">
                    <img src="assets/img/gedungsate.jpg" class="img-fluid rounded-stop" style="max-width: 130px; border-radius: 20px;">
                </div>
                <div class="ps-3">
                    <div class="card-body">
                        <h5 class="card-title">Gedung Sate</h5>
                        <p class="card-text">Jl. Diponegoro No.22, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40115</p>
                        <div style="display: flex; margin-top: auto;">
                            <button type="submit" class="btn btn-dark rounded-pill" style="width: 6rem; margin-right: 5px;">
                                <a href="editplaces.html" class="text-light">
                                    Edit
                                </a>
                            </button>
                            <button type="submit" class="btn btn-dark rounded-pill" style="width: 6rem; margin-right: 5px;">
                                <a href="ulasanplaces.html" class="text-light">
                                    Ulasan
                                </a>
                            </button>
                            <button type="submit" class="btn btn-dark rounded-pill" style="width: 6rem;">
                                <a href="deleteplaces.html" class="text-light">
                                    Delete
                                </a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-12">
    <div class="card">
        <div>
            <div class="d-flex align-items-center">
                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="margin-left: 20px;">
                    <img src="assets/img/museumgeologi.jpg" class="img-fluid rounded-stop" style="max-width: 130px; border-radius: 20px;">
                </div>
                <div class="ps-3">
                    <div class="card-body">
                        <h5 class="card-title">Museum Geologi</h5>
                        <p class="card-text">Jl. Diponegoro No.57, Cihaur Geulis, Kec. Cibeunying Kaler, Kota Bandung, Jawa Barat 40122</p>
                        <div style="display: flex; margin-top: auto;">
                            <button type="submit" class="btn btn-dark rounded-pill" style="width: 6rem; margin-right: 5px;">
                                <a href="editplaces.html" class="text-light">
                                    Edit
                                </a>
                            </button>
                            <button type="submit" class="btn btn-dark rounded-pill" style="width: 6rem; margin-right: 5px;">
                                <a href="ulasanplaces.html" class="text-light">
                                    Ulasan
                                </a>
                            </button>
                            <button type="submit" class="btn btn-dark rounded-pill" style="width: 6rem;">
                                <a href="deleteplaces.html" class="text-light">
                                    Delete
                                </a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-12">
    <div class="card">
        <div>
            <div class="d-flex align-items-center">
                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="margin-left: 20px;">
                    <img src="assets/img/museumasaf.jpg" class="img-fluid rounded-stop" style="max-width: 130px; border-radius: 20px;">
                </div>
                <div class="ps-3">
                    <div class="card-body">
                        <h5 class="card-title">Museum Konfrensi Asia Afrika</h5>
                        <p class="card-text">Jl. Asia Afrika No.65, Braga, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40111</p>
                        <div style="display: flex; margin-top: auto;">
                            <button type="submit" class="btn btn-dark rounded-pill" style="width: 6rem; margin-right: 5px;">
                                <a href="editplaces.html" class="text-light">
                                    Edit
                                </a>
                            </button>
                            <button type="submit" class="btn btn-dark rounded-pill" style="width: 6rem; margin-right: 5px;">
                                <a href="ulasanplaces.html" class="text-light">
                                    Ulasan
                                </a>
                            </button>
                            <button type="submit" class="btn btn-dark rounded-pill" style="width: 6rem;">
                                <a href="deleteplaces.html" class="text-light">
                                    Delete
                                </a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!-- End Reports -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
</body>
</html>