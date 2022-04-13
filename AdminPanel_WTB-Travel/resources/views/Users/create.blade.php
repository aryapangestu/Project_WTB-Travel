@extends('layouts.main')

@section('konten')
    <div class="pagetitle">
        <h1>Create Account</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item">Users</li>
                <li class="breadcrumb-item active">Create</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        @if (session()->has('alert'))
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                {{ session('alert') }} <button type="button" class="btn-close"
                                    data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        @endif
                        <h5 class="card-title">Details</h5>

                        <!-- General Form Elements -->
                        <form action="/users/store" method="POST">
                            @csrf
                            <div class="col-12">
                                <label for="yourUsername" class="form-label">Username</label>
                                <div class="input-group has-validation">
                                    <input type="text" name="username"
                                        class="form-control @error('username') is-invalid @enderror" id="yourUsername"
                                        required value="{{ old('username') }}">
                                    @error('username')
                                        <div class="invalid-feedback">Please enter your username.</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="yourPassword" class="form-label">Password</label>
                                <input type="password" name="password"
                                    class="form-control @error('password') is-invalid @enderror" id="yourPassword" required
                                    value="{{ old('password') }}">
                                @error('password')
                                    <div class="invalid-feedback">Please enter your password!</div>
                                @enderror
                            </div>
                            <div class="col-12">
                                <button class="btn btn-primary w-100" type="submit">Create</button>
                            </div>
                        </form><!-- End General Form Elements -->
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
