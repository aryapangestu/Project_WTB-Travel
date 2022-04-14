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
                    <div class="card-body" style="padding: 1rem">
                        @if (session()->has('alert'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('alert') }} <button type="button" class="btn-close"
                                    data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        @endif
                        <div class="alert alert-success" id="alertStatusUser" style="display:none;">
                            User status updated successfully!
                        </div>
                        <div class="alert alert-success" id="alertAdminUser" style="display:none;">
                            User admin updated successfully!
                        </div>
                        <a type="button" class="btn btn-primary mb-3" href="/users/create">Add new user</a>

                        <!-- Table with stripped rows -->
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">IsAdmin</th>
                                    <th scope="col">Action</th>
                                    <th scope="col">Created at</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($users as $user)
                                    <tr>
                                        <th scope="row">{{ $user->id }}</th>
                                        <td>{{ $user->username }}</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" onclick="ubahStatusUser({{ $user->id }})"
                                                {{ $user->status === 1 ? 'checked = ""' : '' }}>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" onclick="ubahAdminUser({{ $user->id }})"
                                                {{ $user->is_admin === 1 ? 'checked = ""' : '' }}>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex">
                                                <form action="/users/{{ $user->id }}" method="post">
                                                    @method('delete')
                                                    @csrf
                                                    <button type="submit" class="btn btn-danger"
                                                        onclick="return confirm('Are you sure you want to delete this user?')"
                                                        style="margin-top: 2px">
                                                        Delete
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                        <td>
                                            {{ $user->created_at }}
                                        </td>
                                    </tr>
                                @endforeach



                            </tbody>
                        </table>
                        <!-- End Table with stripped rows -->

                    </div>
                </div>

            </div </div>
    </section>
@endsection
