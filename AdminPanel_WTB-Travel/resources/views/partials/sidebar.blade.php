<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
    <a class="nav-link {{ ($title === "Dashboard") ? '' : 'collapsed' }}" href="/">
        <i class="bi bi-grid"></i>
        <span>Dashboard</span>
    </a>
    </li><!-- End Dashboard Nav -->

    <li>
    <a class="nav-link {{ ($title === "Places") ? '' : 'collapsed' }}" href="/places">
        <i class="bi bi-building"></i>
        <span>Places</span>
    </a>
    </li><!-- End Places Nav -->

    <a class="nav-link {{ ($title === "Users") ? '' : 'collapsed' }}" href="/users">
        <i class="bi bi-people"></i>
        <span>Users</span>
    </a>
    </li><!-- End Users Nav -->

</aside><!-- End Sidebar-->
