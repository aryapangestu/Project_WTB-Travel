@extends('layouts.main')

@section('konten')
    <div class="pagetitle">
    <h1>Data Tables</h1>
    <nav>
        <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
        <li class="breadcrumb-item">Tables</li>
        <li class="breadcrumb-item active">Data</li>
        </ol>
    </nav>
    </div><!-- End Page Title -->

    <section class="section">
    <div class="row">
        <div class="col-lg-12">

        <div class="card">
            <div class="card-body">
            <h5 class="card-title">Datatables</h5>
            <p>Add lightweight datatables to your project with using the <a href="https://github.com/fiduswriter/Simple-DataTables" target="_blank">Simple DataTables</a> library. Just add <code>.datatable</code> class name to any table you wish to conver to a datatable</p>

            <!-- Table with stripped rows -->
            <table class="table datatable">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Thumbnail</th>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td><img class="place_list_thumb" src="assets/img/gedungsate.jpg" style="width: 70px; height:70px"></td>
                    <td>Gedung Sate</td>
                    <td>Landmark</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                        </div>
                    </td>
                    <td>
                        <a href="" class="btn btn-outline-warning" style="margin-right:2px">Edit</a>
                        <a href="" class="btn btn-outline-danger" style="margin-left: 2px">Delete</a>
                    </td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td><img class="place_list_thumb" src="assets/img/museumgeologi.jpg" style="width: 70px; height:70px"></td>
                    <td>Museum Geologi</td>
                    <td>Museum</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                        </div>
                    </td>
                    <td>
                        <a href="" class="btn btn-outline-warning" style="margin-right:2px">Edit</a>
                        <a href="" class="btn btn-outline-danger" style="margin-left: 2px">Delete</a>
                    </td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td><img class="place_list_thumb" src="assets/img/museumasaf.jpg" style="width: 70px; height:70px"></td>
                    <td>Museum Konfrensi Asia Afrika</td>
                    <td>Museum</td>
                    <td>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                        </div>
                    </td>
                    <td>
                        <a href="" class="btn btn-outline-warning" style="margin-right:2px">Edit</a>
                        <a href="" class="btn btn-outline-danger" style="margin-left: 2px">Delete</a>
                    </td>
                </tr>
                </tbody>
            </table>
            <!-- End Table with stripped rows -->

            </div>
        </div>

        </div>
    </div>
</section>
@endsection
