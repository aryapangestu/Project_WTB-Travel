@extends('layouts.main')

@section('konten')
    <div class="pagetitle">
    <h1>Places</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
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
    </div>
@endsection
