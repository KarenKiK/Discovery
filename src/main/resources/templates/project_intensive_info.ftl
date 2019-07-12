<#import "fragments/page.ftl" as p>
<#import "fragments/modal.ftl" as m>

<@p.page "Project info">
    <!-- Description of project top side -->
    <div class="row">
        <div class="col-lg-8">
            <h1 id="1"><@p.text "1" "${project.name}"/></h1>
        </div>
    </div>
    <hr>

    <!-- Description of project right side -->
    <div class="row">
        <p class="col-lg-12" id="2"><@p.text "2" "${project.description}"/></p>
    </div>

    <div class="row">
        <div class="col-lg-9">
            <!-- Team -->
            <i class="text-muted">Команда:</i> <#list team.participants as user>
                <a id="${user.id}list1"><@p.text "${user.id}list1" "${user.username}"/></a><#sep>, <#--<#else>--> ... </#list>
        </div>
        <div class="col-lg-3 list-group list-group-flush">
            <span class="list-group-item"><i class="text-muted">Создан:</i>
                <a id="3"><@p.text "3" "${project.date_created}"/></a><br></span>
            <span class="list-group-item"><i class="text-muted">Создатель:</i>
                <a id="4"><@p.text "4" "${project.creator.username}"/></a><br></span>
            <span class="list-group-item"><i class="text-muted">Руководитель:</i>
                <#if team.supervisor??><a id="5">
                    <@p.text "5" "${team.supervisor.username}"/></a><#else>...</#if></span>
            <#if user_now.isCurator()>
                <#list project.type as t>
                    <span class="list-group-item"><i class="text-muted">Тип:</i> ${t}<br></span>
                </#list>
            </#if>
        </div>
    </div>
    <hr>

    <!-- Control zone -->
    <#if user_now.isCurator()>
        <div class="form-row my-3">
            <#if !team.supervisor??>
                <div class="col">
                    <button type="button" class="btn btn-primary"
                            data-toggle="modal" data-target="#addSupervisorModal">Добавить руководителя
                    </button>
                </div>
            </#if>
            <div class="col">
                <button type="button" class="btn btn-primary"
                        data-toggle="modal" data-target="#addUserModal">Добавить пользователя
                </button>
            </div>
        </div>
    </#if>

    <!-- Modals -->
    <@m.modal "addUserModal" "user" "Добавить" "Добавить участников">
        <#if isEmptyTeam>
            <p>Нет новых участников</p>
        </#if>
        <div class="input-group mb3">
            <form method="post" action="/intensive/${intensive.id}/project/${project.id}/add" id="user"
                  class="form-inline">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="selectUser">Users</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <select id="selectUser" name="username" class="custom-select">
                    <option selected>Выберите...</option>
                    <#list available_users as user>
                        <option id="${user.id}list1"><@p.text "${user.id}list1" "${user.username}"/></option>
                    </#list>
                </select>
            </form>
        </div>
    </@m.modal>

    <@m.modal "addSupervisorModal" "supervisor" "Добавить" "Добавить руководителя">
        <#if isEmptySupervisor>
            <p>Кураторы отсутствуют</p>
        </#if>
        <div class="input-group mb3">
            <form method="post" action="/intensive/${intensive.id}/project/${project.id}/supervisor" id="supervisor"
                  class="form-inline">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="selectSupervisor">Пользователи</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <select id="selectSupervisor" name="supervisor" class="custom-select">
                    <option selected>Выберите...</option>
                    <#list supervisors as user>
                        <option id="${user.id}list2"><@p.text "${user.id}list2" "${user.username}"/></option>
                    </#list>
                </select>
            </form>
        </div>
    </@m.modal>

    <!-- Send comment -->
    <form method="post" action="/intensive/${intensive.id}/project/${project.id}/comment" class="row">
        <div class="col-lg-10">
            <input type="text" name="text" placeholder="Your message" class="form-control my-2"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </div>
        <div class="col-lg-2">
            <button type="submit" class="btn btn-primary mt-2">Отправить</button>
        </div>
    </form>

    <!-- Comments -->
    <ul class="list-group list-group-flush">
        <#list comments as comment>
            <li class="list-group-item">
                <div class="row">
                    <div class="col-lg-2 mr-2">
                        <i class="text-muted" id="${comment.id}list1">
                            <@p.text "${comment.id}list1" "${comment.creator.username}: "/></i>
                    </div>
                    <div class="col-lg-7" id="${comment.id}list2">
                        <@p.text "${comment.id}list2" "${comment.text}"/>
                    </div>
                    <div class="col-lg-3 text-muted">
                        <i>${comment.date_created}</i>
                    </div>
                </div>
            </li>
        <#else>
            <span class="list-group-item text-muted">Комментариев нет, добавьте первый комментарий</span>
        </#list>
    </ul>
</@p.page>