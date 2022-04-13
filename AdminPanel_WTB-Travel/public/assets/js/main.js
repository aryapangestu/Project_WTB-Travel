(function () {
    "use strict";

    /**
     * Easy selector helper function
     */
    const select = (el, all = false) => {
        el = el.trim()
        if (all) {
            return [...document.querySelectorAll(el)]
        } else {
            return document.querySelector(el)
        }
    }

    /**
     * Easy event listener function
     */
    const on = (type, el, listener, all = false) => {
        if (all) {
            select(el, all).forEach(e => e.addEventListener(type, listener))
        } else {
            select(el, all).addEventListener(type, listener)
        }
    }

    /**
     * Sidebar toggle
     */
    if (select('.toggle-sidebar-btn')) {
        on('click', '.toggle-sidebar-btn', function (e) {
            select('body').classList.toggle('toggle-sidebar')
        })
    }

})();

$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});


function previewImg(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            document.getElementById("preview").innerHTML =
                "<img src='" + e.target.result + "' width='250'>";
        };

        reader.readAsDataURL(input.files[0]);
    }
}

function ubahStatus(id) {
    $.ajax({
        type: 'POST',
        url: '/places/status/' + id,
        data: {
            Userid: id
        },
        success: function () {
            $('#alertStatusPlace').fadeOut();
            $('#alertStatusPlace').fadeIn();
            setTimeout(function () {
                $('#alertStatusPlace').fadeOut();
            }, 5000);
        }
    });
}

// Vendor Mapbox
mapboxgl.accessToken = 'pk.eyJ1IjoiYXJ5YXAyIiwiYSI6ImNsMXU1MmJ3NjJpemQzcXVrNnQ3cDFibmEifQ.WtmVOqIR6MWhE9HNjQpPkw';
const latitude = document.getElementById('lat');
const longitude = document.getElementById('lng');
const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [107.604, -6.934],
    zoom: 15
});

// Marker Awal
const marker = new mapboxgl.Marker({
    color: 'orange',
    draggable: true
})
    .setLngLat([107.604, -6.934])
    .addTo(map);

function onDragEnd() {
    const lngLat = marker.getLngLat();
    latitude.value = `${lngLat.lng}`;
    longitude.value = `${lngLat.lat}`;
}
marker.on('dragend', onDragEnd);


// Search
var geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    marker: {
        color: 'orange',
        draggable: true
    },
    mapboxgl: mapboxgl
});

map.addControl(geocoder);

geocoder.on('result', e => {
    marker.remove();
    const lngLat = e.result.center;
    latitude.value = lngLat[0];
    longitude.value = lngLat[1];
    geocoder.mapMarker.on('dragend', (e) => {
        const lngLat = e.target.getLngLat();
        latitude.value = `${lngLat.lng}`;
        longitude.value = `${lngLat.lat}`;
    });
})
