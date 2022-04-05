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
                    <h5 class="card-title">Data</h5>

                    <!-- Table with stripped rows -->
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Fullname</th>
                            <th scope="col">Username</th>
                            <th scope="col">Status</th>
                            <th scope="col">IsAdmin</th>
                            <th scope="col">Created at</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Muhammad Ihsan Adly</td>
                            <td>GNite12</td>
                            <td>
                                <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                            </div>
                            </td>
                            <td>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                                </div>
                            </td>
                            <td>
                                15:01 05/04/2022
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Arya Pangestu</td>
                            <td>Brevizz</td>
                            <td>
                                <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                            </div>
                            </td>
                            <td>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                                </div>
                            </td>
                            <td>
                                n.d.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Najla Nur Adila</td>
                            <td>Najla</td>
                            <td>
                                <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                            </div>
                            </td>
                            <td>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                                </div>
                            </td>
                            <td>
                                n.d.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>Putri Samapa Hutapea</td>
                            <td>Putri</td>
                            <td>
                                <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                            </div>
                            </td>
                            <td>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                                </div>
                            </td>
                            <td>
                                n.d.
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <!-- End Table with stripped rows -->

                    </div>
                </div>

                </div
        </div>
    </section>
@endsection
