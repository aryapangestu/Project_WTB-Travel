@extends('layouts.main')

@section('konten')
    <div class="pagetitle">
        <h1>Users</h1>
        <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item">Users</li>
        </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
        <div class="col-lg-12">

            <div class="card">
            <div class="card-body">

                <!-- Table with stripped rows -->
                <table class="table datatable" style="margin-top: 1.5rem;">
                <thead>
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <th scope="row">1</th>
                    <td>Muhammad Ihsan Adly</td>
                    <td>
                        <button type="submit" class="btn btn-dark rounded-pill" style="width: fit-content; margin-right: 1rem;">
                            <a href="editusers.html" class="text-light">
                                Edit
                            </a>
                        </button>
                        <button type="submit" class="btn btn-dark rounded-pill" style="width: fit-content;">
                            <a href="deleteusers.html" class="text-light">
                                Delete
                            </a>
                        </button>
                    </td>
                    </tr>
                    <tr>
                    <th scope="row">2</th>
                    <td>Arya Pangestu</td>
                    <td>
                        <button type="submit" class="btn btn-dark rounded-pill" style="width: fit-content; margin-right: 1rem;">
                            <a href="editusers.html" class="text-light">
                                Edit
                            </a>
                        </button>
                        <button type="submit" class="btn btn-dark rounded-pill" style="width: fit-content;">
                            <a href="deleteusers.html" class="text-light">
                                Delete
                            </a>
                        </button>
                    </td>
                    </tr>
                    <tr>
                    <th scope="row">3</th>
                    <td>Najla Nur Adila</td>
                    <td>
                        <button type="submit" class="btn btn-dark rounded-pill" style="width: fit-content; margin-right: 1rem;">
                            <a href="editusers.html" class="text-light">
                                Edit
                            </a>
                        </button>
                        <button type="submit" class="btn btn-dark rounded-pill" style="width: fit-content;">
                            <a href="deleteusers.html" class="text-light">
                                Delete
                            </a>
                        </button>
                    </td>
                    </tr>
                    <tr>
                    <th scope="row">4</th>
                    <td>Putri Samapa Hutapea</td>
                    <td>
                        <button type="submit" class="btn btn-dark rounded-pill" style="width: fit-content; margin-right: 1rem;">
                            <a href="editusers.html" class="text-light">
                                Edit
                            </a>
                        </button>
                        <button type="submit" class="btn btn-dark rounded-pill" style="width: fit-content;">
                            <a href="deleteusers.html" class="text-light">
                                Delete
                            </a>
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
