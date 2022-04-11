<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link {{ $title === 'Dashboard' ? '' : 'collapsed' }}" href="/">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li>
            <a class="nav-link {{ $title === 'Places' ? '' : 'collapsed' }}" href="/places">
                <i class="bi bi-building"></i>
                <span>Places</span>
            </a>
        </li><!-- End Places Nav -->

        <li>
            <a class="nav-link {{ $title === 'Users' ? '' : 'collapsed' }}" href="/users">
                <i class="bi bi-people"></i>
                <span>Users</span>
            </a>
        </li><!-- End Users Nav -->

        <li>
            <a class="nav-link {{ $title === 'Categories' ? '' : 'collapsed' }}" href="/categories">
                <i class="bi bi-boxes"></i>
                <span>Category</span>
            </a>
        </li><!-- End Category Nav -->
        <li>
            <a class="nav-link {{ $title === 'Reviews' ? '' : 'collapsed' }}" href="/reviews">
                <i class="bi bi-card-text"></i>
                <span>Review</span>
            </a>
        </li><!-- End Category Nav -->


</aside><!-- End Sidebar-->
