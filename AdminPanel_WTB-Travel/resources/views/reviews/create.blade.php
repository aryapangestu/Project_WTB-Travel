@extends('layouts.main')

@section('konten')
    <div class="pagetitle">
        <h1>Create Place</h1>
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
                                    <select class="form-select @error('user') is-invalid @enderror"
                                        aria-label="Default select example" name="user_id" required>
                                        <option selected="" disabled="" value="">Choose...</option>
                                        @foreach ($reviews as $review)
                                            <option {{ old('user_id') === $review->user_id ? 'selected=""' : '' }}
                                                value="{{ $review->user_id }}">{{ $review->name->username }}</option>
                                        @endforeach
                                        @error('user')
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
                                    <select class="form-select @error('user') is-invalid @enderror"
                                        aria-label="Default select example" name="category_id" required>
                                        <option selected="" disabled="" value="">Choose...</option>
                                        @foreach ($users as $user)
                                            <option {{ old('user') === $user->id ? 'selected=""' : '' }}
                                                value="{{ $user->id }}">{{ $user->name }}</option>
                                        @endforeach
                                        @error('user')
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
                                    <select class="form-select @error('user') is-invalid @enderror"
                                        aria-label="Default select example" name="category_id" required>
                                        <option selected="" disabled="" value="">Choose...</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="review" class="col-sm-2 col-form-label">Review</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control @error('description') is-invalid @enderror" style="height: 100px" name="description"
                                        required>{{ old('description') }}</textarea>
                                    @error('description')
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
