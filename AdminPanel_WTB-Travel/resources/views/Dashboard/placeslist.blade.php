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
            <h5 class="card-title">Places</h5>

            <!-- Table with stripped rows -->
            <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">WARNING</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" style="text-align: center; font-weight:bold">
                            Are you sure want to DELETE
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">YES</button>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table datatable table-striped table-bordered">
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
                        <a href="/form" class="btn btn-outline-warning" style="margin-right:2px">Edit</a>
                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete" data-bs-whatever="@getbootstrap">
                            Delete
                        </button>
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
                        <a href="/form" class="btn btn-outline-warning" style="margin-right:2px">Edit</a>
                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete" data-bs-whatever="@getbootstrap">
                            Delete
                        </button>
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
                        <a href="/form" class="btn btn-outline-warning" style="margin-right:2px">Edit</a>
                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete" data-bs-whatever="@getbootstrap">
                            Delete
                        </button>
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
