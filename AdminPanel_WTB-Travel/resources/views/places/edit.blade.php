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
                                <label for="inputText" class="col-sm-2 col-form-label">Address</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control @error('address') is-invalid @enderror"
                                        name="address" required value="{{ old('address', $place->address) }}">
                                    @error('address')
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
                                        name="description" required>{{ old('description', $place->description) }}</textarea>
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
                                        <div class="col-md-12">
                                            <div id="map"></div>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="place_address">Latitude</label>
                                            <input type="text" class="form-control @error('lat') is-invalid @enderror"
                                                name="lat" id="lat" required value="{{ old('lat', $place->lat) }}">
                                            @error('lat')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="col-md-6">
                                            <label for="place_address">Longitude</label>
                                            <input type="text" class="form-control @error('lng') is-invalid @enderror"
                                                name="lng" id="lng" required value="{{ old('lng', $place->lng) }}">
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
                                        accept="image/jpg, image/jpeg" id="src" name="src" onchange="previewImgs(this);"
                                        value=" {{ old('scr', URL::asset($place->src)) }}"></br>
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
    <!-- Load the `mapbox-gl-geocoder` plugin. -->
    <script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v5.0.0/mapbox-gl-geocoder.min.js"></script>
    <link rel="stylesheet"
        href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v5.0.0/mapbox-gl-geocoder.css" type="text/css">
    <script>
        // Vendor Mapbox
        mapboxgl.accessToken = 'pk.eyJ1IjoiYXJ5YXAyIiwiYSI6ImNsMXU1MmJ3NjJpemQzcXVrNnQ3cDFibmEifQ.WtmVOqIR6MWhE9HNjQpPkw';
        const latitude = document.getElementById('lat');
        const longitude = document.getElementById('lng');
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [longitude.value, latitude.value],
            zoom: 15
        });

        /* Given a query in the form "lng, lat" or "lat, lng"
         * returns the matching geographic coordinate(s)
         * as search results in carmen geojson format,
         * https://github.com/mapbox/carmen/blob/master/carmen-geojson.md */
        const coordinatesGeocoder = function(query) {
            // Match anything which looks like
            // decimal degrees coordinate pair.
            const matches = query.match(
                /^[ ]*(?:Lat: )?(-?\d+\.?\d*)[, ]+(?:Lng: )?(-?\d+\.?\d*)[ ]*$/i
            );
            if (!matches) {
                return null;
            }

            function coordinateFeature(lng, lat) {
                return {
                    center: [lng, lat],
                    geometry: {
                        type: 'Point',
                        coordinates: [lng, lat]
                    },
                    place_name: 'Lat: ' + lat + ' Lng: ' + lng,
                    place_type: ['coordinate'],
                    properties: {},
                    type: 'Feature'
                };
            }

            const coord1 = Number(matches[1]);
            const coord2 = Number(matches[2]);
            const geocodes = [];

            if (coord1 < -90 || coord1 > 90) {
                // must be lng, lat
                geocodes.push(coordinateFeature(coord1, coord2));
            }

            if (coord2 < -90 || coord2 > 90) {
                // must be lat, lng
                geocodes.push(coordinateFeature(coord2, coord1));
            }

            if (geocodes.length === 0) {
                // else could be either lng, lat or lat, lng
                geocodes.push(coordinateFeature(coord1, coord2));
                geocodes.push(coordinateFeature(coord2, coord1));
            }

            return geocodes;
        };

        // Marker Awal
        const marker = new mapboxgl.Marker({
                color: 'orange',
                draggable: true
            })
            .setLngLat([longitude.value, latitude.value])
            .addTo(map);

        function onDragEnd() {
            const lngLat = marker.getLngLat();
            latitude.value = `${lngLat.lat}`;
            longitude.value = `${lngLat.lng}`;
        }
        marker.on('dragend', onDragEnd);


        // Search
        var geocoder = new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            localGeocoder: coordinatesGeocoder,
            zoom: 15,
            marker: {
                color: 'orange',
                draggable: true
            },
            mapboxgl: mapboxgl,
            reverseGeocode: true
        });

        map.addControl(geocoder);

        geocoder.on('result', e => {
            marker.remove();
            const lngLat = e.result.center;
            latitude.value = lngLat[1];
            longitude.value = lngLat[0];
            geocoder.mapMarker.on('dragend', (e) => {
                const lngLat = e.target.getLngLat();
                latitude.value = `${lngLat.lat}`;
                longitude.value = `${lngLat.lng}`;
            });
        })
    </script>
@endsection
