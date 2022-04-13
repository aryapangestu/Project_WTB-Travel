@extends('layouts.main')

@section('konten')
    <div class="pagetitle">
        <h1>Create Place</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item">Places</li>
                <li class="breadcrumb-item active">Edit</li>
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
                        <form action="/places/{{ $place->id }}" method="POST" enctype="multipart/form-data">
                            @method('put')
                            @csrf
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control @error('name') is-invalid @enderror" name="name"
                                        required value="{{ old('name', $place->name) }}">
                                    @error('name')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputPassword" class="col-sm-2 col-form-label">Description</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control @error('description') is-invalid @enderror" aria-label="description" style="height: 100px"
                                        name="description"
                                        required>{{ old('description', $place->description) }}</textarea>
                                    @error('description')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Category</label>
                                <div class="col-sm-10">
                                    <select class="form-select @error('category') is-invalid @enderror"
                                        aria-label="Default select example" name="category_id" required>
                                        <option selected="" disabled="" value="">Choose...</option>
                                        @foreach ($categories as $category)
                                            <option
                                                {{ old('category', $place->category_id) === $category->id ? 'selected=""' : '' }}
                                                value="{{ $category->id }}">{{ $category->name_category }}</option>
                                        @endforeach
                                        @error('category')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </select>
                                </div>
                            </div>
                            <div id="location" class="row mb-3">
                                <label for="inputLocation" class="col-sm-2 col-form-label">Location</label>
                                <div class="col-sm-10">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="place_address">Latitude</label>
                                            <input type="text" class="form-control @error('lat') is-invalid @enderror"
                                                name="lat" required value="{{ old('lat', $place->lat) }}">
                                            @error('lat')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="col-md-6">
                                            <label for="place_address">Longitude</label>
                                            <input type="text" class="form-control @error('lng') is-invalid @enderror"
                                                name="lng" required value="{{ old('lng', $place->lng) }}">
                                            @error('lng')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputNumber" class="col-sm-2 col-form-label">Image Upload</label>
                                <div class="col-sm-10">
                                    <input class="form-control @error('formFile') is-invalid @enderror" type="file"
                                        accept="image/jpg, image/jpeg" id="src" name="src" onchange="readURL(this);"
                                        value=" {{ old('scr', URL::asset($place->src)) }}">
                                    <div id="preview">
                                        <img src='{{ asset('storage/' . $place->src) }}' width='250'>
                                    </div>
                                    @error('src')
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
