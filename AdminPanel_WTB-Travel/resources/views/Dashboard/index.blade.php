@extends('layouts.main')

@section('konten')
    <div class="pagetitle">
        <h1>Dashboard</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <div class="col-lg-8">
                <div class="row">

                    <!-- Sales Card -->
                    <div class="col-xxl-3 col-md-6">
                        <div class="card info-card sales-card">

                            <div class="card-body">
                                <h5 class="card-title">Users <span>| Total</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>{{ $totUser }}</h6>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Customers Card -->
                    <div class="col-xxl-3 col-md-6">

                        <div class="card info-card customers-card">

                            <div class="card-body">
                                <h5 class="card-title">Places <span>| Total</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-building"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>{{ $totPlace }}</h6>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div><!-- End Customers Card -->

                    <!-- Customers Card -->
                    <div class="col-xxl-3 col-md-6">

                        <div class="card info-card customers-card">

                            <div class="card-body">
                                <h5 class="card-title">Category <span>| Total</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-building"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>{{ $totCategory }}</h6>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div><!-- End Customers Card -->

                    <!-- Customers Card -->
                    <div class="col-xxl-3 col-md-6">

                        <div class="card info-card customers-card">

                            <div class="card-body">
                                <h5 class="card-title">Review <span>| Total</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-building"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>{{ $totReview }}</h6>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div><!-- End Customers Card -->

                    <div id="map"></div>

                </div>
            </div><!-- End Left side columns -->

        </div>
    </section>
    <script>
        mapboxgl.accessToken = 'pk.eyJ1IjoiYXJ5YXAyIiwiYSI6ImNsMXU1MmJ3NjJpemQzcXVrNnQ3cDFibmEifQ.WtmVOqIR6MWhE9HNjQpPkw';
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [107.604, -6.934],
            zoom: 11.15
        });


        map.on('load', () => {
            var places = {!! json_encode($places->toArray()) !!};
            var jsonArr = [];
            var jsonStr = "";
            var jsonTot = "{" +
                "'type': 'geojson'," +
                "'data': {" +
                "'type': 'FeatureCollection'," +
                "'features': ["
            for (const place of places) {
                jsonStr = "{" +
                    "'type': 'Feature'," +
                    "'properties': {" +
                    "'description': '<strong>" + place.name + "</strong><p>" + place.description + "</p>'," +
                    "'icon': 'theatre-15'" +
                    "}," +
                    "'geometry': {" +
                    "'type': 'Point'," +
                    "'coordinates': [" + place.lng + ", " + place.lat + "]" +
                    "}" +
                    "},"

                jsonTot = jsonTot + jsonStr;
            }
            jsonStr = "]" +
                "}" +
                "}"
            jsonTot = jsonTot + jsonStr;
            console.log(jsonTot);

            map.addSource('places', jsonTot);
            // Add a layer showing the places.
            map.addLayer({
                'id': 'places',
                'type': 'symbol',
                'source': 'places',
                'layout': {
                    'icon-image': '{icon}',
                    'icon-allow-overlap': true
                }
            });

            // When a click event occurs on a feature in the places layer, open a popup at the
            // location of the feature, with description HTML from its properties.
            map.on('click', 'places', (e) => {
                // Copy coordinates array.
                const coordinates = e.features[0].geometry.coordinates.slice();
                const description = e.features[0].properties.description;

                // Ensure that if the map is zoomed out such that multiple
                // copies of the feature are visible, the popup appears
                // over the copy being pointed to.
                while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
                    coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
                }

                new mapboxgl.Popup()
                    .setLngLat(coordinates)
                    .setHTML(description)
                    .addTo(map);
            });

            // Change the cursor to a pointer when the mouse is over the places layer.
            map.on('mouseenter', 'places', () => {
                map.getCanvas().style.cursor = 'pointer';
            });

            // Change it back to a pointer when it leaves.
            map.on('mouseleave', 'places', () => {
                map.getCanvas().style.cursor = '';
            });
        });
    </script>
@endsection
