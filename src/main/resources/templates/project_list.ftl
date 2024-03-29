<#import "fragments/page.ftl" as p>
<#import "fragments/modal.ftl" as m>

<@p.page "Projects list">
    <div class="row">
        <div class="col-lg-4">
            <h1>Проекты</h1>
        </div>
        <div class="col-lg-8">
            <button type="button" class="btn btn-primary float-right"
                    data-toggle="modal" data-target="#newProjectModal"> Новый проект
            </button>
        </div>
    </div>
    <hr>

    <!-- Project search -->
    <form method="post" action="/project/search">
        <div class="row my-4">
            <div class="col-10">
                <input type="text" class="form-control" placeholder="Введите имя проекта или тэг" name="name">
            </div>
            <div class="col-2">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary">Поиск</button>
            </div>
        </div>
    </form>

    <#if error??><h3>${error}</h3><#else>
        <!-- Project types -->
        <#if !search??>
            <div class="btn-group btn-group-lg" role="group" aria-label="Button group for project by type searching" style="margin-bottom: 10px;">
                <a href="/project"> <button type="button" class="btn btn-light"> Все </button> </a>
                <a href="/project?type=NEW"> <button type="button" class="btn btn-light"> Новый проект </button> </a>
                <a href="/project?type=ACCEPTED"> <button type="button" class="btn btn-light"> Принятые проекты </button> </a>
                <a href="/project?type=DECLINED"> <button type="button" class="btn btn-light"> Отклоненные проекты </button> </a>
                <a href="/project?type=ARCHIVED"> <button type="button" class="btn btn-light"> Архивные проекты </button> </a>
            </div>
        </#if>

        <@m.modal "newProjectModal" "project" "Создать" "Создать проект">
            <form method="post" action="/project" id="project">
                <div class="form-group">
                    <label for="name" class="col-form-label">Название проекта:</label>
                    <input type="text" class="form-control" name="name">
                </div>
                <div class="form-group">
                    <label for="description" class="col-form-label">Описание:</label>
                    <textarea class="form-control" name="description"></textarea>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </form>
        </@m.modal>

        <!-- List of projects -->
        <div class="row">
            <#list projects as project>
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="card my-2 shadow" style="width: 18rem">
                        <div class="card-body">
                            <a href="/project/${project.id}" style="color: inherit;"><h5 class="card-title"
                                                                                         id="${project.id}list1">
                                    <@p.text "${project.id}list1" "${project.name}"/></h5></a>
                            <p class="card-text text-break"
                               style="max-height: 150px; overflow: hidden; text-overflow: ellipsis;"
                               id="${project.id}list2">
                                <@p.text "${project.id}list2" "${project.description}"/>
                            </p>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item" id="${project.id}list3">
                                    <@p.text "${project.id}list3" "Дата создания: ${project.date_created}"/></li>
                                <li class="list-group-item">
                                    ${project.like_amount()}
                                    <a href="/project/${project.id}/like">Like</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-footer text-muted" id="${project.id}list5">
                            <@p.text "${project.id}list5" "Создатель: ${project.creator.username}"/>
                        </div>
                    </div>
                </div>
            <#else>
                Сейчас нет проектов, предложите свой проект.
            </#list>
        </div>
    </#if>
</@p.page>