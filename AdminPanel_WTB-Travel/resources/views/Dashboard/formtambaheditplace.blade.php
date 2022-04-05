@extends('layouts.main')

@section('konten')
<div class="pagetitle">
    <h1>Edit Place</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
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
            <h5 class="card-title">Info</h5>

            <!-- General Form Elements -->
            <form>
              <div class="row mb-3">
                <label for="inputText" class="col-sm-2 col-form-label">Name</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control">
                </div>
              </div>
              <div class="row mb-3">
                <label for="inputPassword" class="col-sm-2 col-form-label">Description</label>
                <div class="col-sm-10">
                  <textarea class="form-control" style="height: 100px"></textarea>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Category</label>
                <div class="col-sm-10">
                  <select class="form-select" aria-label="Default select example">
                    <option value="1">Zoo</option>
                    <option value="2">Museum</option>
                    <option value="3">Landmark</option>
                  </select>
                </div>
              </div>
              <div id="location" class="row mb-3">
                  <label for="inputLocation" class="col-sm-2 col-form-label">Location</label>
                  <div class="col-sm-10">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="place_address">Latitude</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label for="place_address">Longitude</label>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                  </div>
              </div>
              <div class="row mb-3">
                <label for="inputNumber" class="col-sm-2 col-form-label">Image Upload</label>
                <div class="col-sm-10">
                  <input class="form-control" type="file" id="formFile">
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
