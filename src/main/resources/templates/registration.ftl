<#import "fragments/page.ftl" as p>
<#import "fragments/modal.ftl" as m>

<@p.page "Registration">
    <#if !user_now??>
        <form method="post" action="/registration/${uuid}">
            <div class="form-group">
                <label for="name" class="col-form-label">Логин:</label>
                <input type="text" class="form-control" name="username">
            </div>
            <div class="form-group">
                <label for="password" class="col-form-label">Пароль:</label>
                <input class="form-control" name="password" type="text">
            </div>
            <div class="form-group">
                <label for="name" class="col-form-label">Имя:</label>
                <input class="form-control" name="name" type="text">
            </div>
            <div class="form-group">
                <label for="surname" class="col-form-label">Фамилия:</label>
                <input class="form-control" name="surname" type="text">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit">Зарегистрироваться</button>
        </form>
    <#else>
        <h3>
            Извините, но вы уже в системе
        </h3>
    </#if>
</@p.page>
