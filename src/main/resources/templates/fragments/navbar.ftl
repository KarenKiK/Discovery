<nav class="navbar navbar-expand-lg navbar-light bg-info mb-3">
    <!-- Main page -->
    <#if title == "Home page">
    <a class="navbar-brand text-danger" href="/" style="font-weight: bold">
        <#else>
        <a class="navbar-brand text-white" href="/" style="font-weight: bold">
            </#if>
            Главная странница</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <!-- Intensives list -->
            <li class="nav-item">
                <#if title == "Intensive info" || title == "Intensives list">
                <a class="nav-link text-danger" href="/intensive">
                    <#else>
                    <a class="nav-link text-white" href="/intensive">
                        </#if>
                        Интенсивы</a>
            </li>
            <!-- Projects list -->
            <li class="nav-item">
                <#if title == "Project info" || title == "Projects list">
                <a class="nav-link text-danger" href="/project">
                    <#else>
                    <a class="nav-link text-white" href="/project">
                        </#if>
                        Проекты</a>
            </li>
            <!-- Users list -->
            <#if isAdmin>
                <li class="nav-item">
                    <#if title == "Users List">
                    <a class="nav-link text-danger" href="/user">
                        <#else>
                        <a class="nav-link text-white" href="/user">
                            </#if>
                            Панель АДМИНА</a>
                </li>
            </#if>
        </ul>

        <!-- Profile -->
        <div class="navbar-text mr-3">
            <a href="/profile">
                <#if title == "Profile">
                <i class="text-danger" id="-1">
                    <#else>
                    <i class="text-white" id="-1">
                        </#if>
                        <@text "-1" "${name}"/></i></a>
        </div>

        <!-- Logout -->
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary">Выйти</button>
        </form>
    </div>
</nav>