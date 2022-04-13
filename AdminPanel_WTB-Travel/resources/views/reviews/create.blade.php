@extends('layouts.main')

@section('konten')
    <div class="pagetitle">
        <h1>Create Review</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">Reviews</li>
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
                        <form action="/reviews/store" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Username</label>
                                <div class="col-sm-10">
                                    <select class="form-select @error('user_id') is-invalid @enderror"
                                        aria-label="Default select example" name="user_id" required>
                                        <option selected="" disabled="" value="">Choose...</option>
                                        @foreach ($users as $user)
                                            <option {{ old('user_id') === $user->user_id ? 'selected=""' : '' }}
                                                value="{{ $user->id }}">{{ $user->username }}
                                            </option>
                                        @endforeach
                                        @error('user_id')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Name Place</label>
                                <div class="col-sm-10">
                                    <select class="form-select @error('place_id') is-invalid @enderror"
                                        aria-label="Default select example" name="place_id" required>
                                        <option selected="" disabled="" value="">Choose...</option>
                                        @foreach ($places as $place)
                                            <option {{ old('place_id') === $place->id ? 'selected=""' : '' }}
                                                value="{{ $place->id }}">{{ $place->name }}</option>
                                        @endforeach
                                        @error('place_id')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Rating</label>
                                <div class="col-sm-10">
                                    <select class="form-select @error('rating') is-invalid @enderror"
                                        aria-label="Default select example" name="rating" required>
                                        <option selected="" disabled="" value="">Choose...</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        @error('rating')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="review" class="col-sm-2 col-form-label">Review</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control @error('comment') is-invalid @enderror" style="height: 100px" name="comment"
                                        required>{{ old('comment') }}</textarea>
                                    @error('comment')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </div>
                        </form><!-- End General Form Elements -->
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
