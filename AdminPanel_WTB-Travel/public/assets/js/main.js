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

function ubahStatusUser(id) {
    $.ajax({
        type: 'POST',
        url: '/users/status/' + id,
        data: {
            Userid: id
        },
        success: function () {
            $('#alertStatusUser').fadeOut();
            $('#alertStatusUser').fadeIn();
            setTimeout(function () {
                $('#alertStatusUser').fadeOut();
            }, 5000);
        }
    });
}

function ubahAdminUser(id) {
    $.ajax({
        type: 'POST',
        url: '/users/admin/' + id,
        data: {
            Userid: id
        },
        success: function () {
            $('#alertAdminUser').fadeOut();
            $('#alertAdminUser').fadeIn();
            setTimeout(function () {
                $('#alertAdminUser').fadeOut();
            }, 5000);
        }
    });
}
