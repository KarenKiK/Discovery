<#import "fragments/page.ftl" as p>
<#import "fragments/modal.ftl" as m>

<@p.page "Intensive info">
    <div class="row">
        <div class="col-lg-6">
            <h1 id="1"><@p.text "1" "${intensive.name}"/></h1>
        </div>
        <#if user_now.isCurator() >
             <div class="col-lg-6">
                <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#editIntensiveModal">
                    Редактировать </button>
            </div>
        </#if>
    </div>

    <!-- Description of intensive -->
    <div class="row">
        <div class="col-lg-9">
            <p id="2"><@p.text "2" "${intensive.description}"/></p>
        </div>
        <div class="col-lg-3">
            <i>Даты:</i> <a id="3"><@p.text "3" "${intensive.date_start} - ${intensive.date_end}"/></a><br>
            <i>Куратор:</i> <a id="4"><@p.text "4" "${intensive.curator.username}"/></a>
        </div>
        <div class="col-lg-9">
            <i class="text-muted">Файлы:</i>
            <#if intensive.files??>
                <#list intensive.files as file>
                    <a href="/image/${file}" download="${intensive.file_name(file)}" id="${file}list-1">
                        <@p.text "${file}list-1" "${intensive.file_name(file)}"/></a>
                    <#sep>; <#--<#else> No files-->
                </#list>
            <#else>Нет файлов</#if>
        </div>
    </div>

    <!-- Control zone -->
    <#if user_now.isCurator()>
        <div class="form-row my-3">
            <div class="col">
                <button type="button" class="btn btn-primary"
                        data-toggle="modal" data-target="#addProject">Добавить проект
                </button>
            </div>
        </div>
        <div class="my-4">
            <form method="post" action="/intensive/${intensive.id}/upload" enctype="multipart/form-data">
                <input name="file" type="file">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit">Загрузить</button>
            </form>
        </div>
    </#if>

    <!-- Modals -->
    <@m.modal "editIntensiveModal" "intensive" "Обновить" "Редактировать интенсив">
        <form method="post" action="/intensive/${intensive.id}/edit" id="intensive">
            <div class="form-group">
                <label for="name" class="col-form-label">Название интенсива:</label>
                <input type="text" class="form-control" name="name">
            </div>
            <div class="form-group">
                <label for="description" class="col-form-label">Описание:</label>
                <textarea class="form-control" name="description"></textarea>
            </div>
            <div class="form-group">
                <label for="description" class="col-form-label">Дата начала (YYYY-MM-DD):</label>
                <input class="form-control" name="date_start"></input>
            </div>
            <div class="form-group">
                <label for="description" class="col-form-label">Дата конца (YYYY-MM-DD):</label>
                <input class="form-control" name="date_end"></input>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </@m.modal>

    <@m.modal "addProject" "project" "Добавить" "Добавить проект">
        <#if isEmpty>
            <p>Нет новых проектов</p>
        </#if>
        <div class="input-group mb3">
            <form method="post" action="/intensive/${intensive.id}" id="project" class="form-inline">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="selectProject">Проекты</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <select id="selectProject" name="project_name" class="custom-select">
                    <option selected>Выберите...</option>
                    <#list all_projects as item>
                        <option selected id="${item.id}list1"><@p.text "${item.id}list1" "${item.name}"/></option>
                    </#list>
                </select>
            </form>
        </div>
    </@m.modal>

    <!-- List of projects -->
    <div class="row">
        <#list projects as project>
            <div class="col-4">
                <div class="card my-2" style="width: 18rem;">
                    <div class="card-body">
                        <a href="/intensive/${intensive.id}/project/${project.id}" style="color: inherit;"><h5
                                    class="card-title"
                                    id="${project.id}list2">
                                <@p.text "${project.id}list2" "${project.name}"/></h5></a>
                        <p class="card-text" id="${project.id}list3">
                            <@p.text "${project.id}list3" "${project.description}"/>
                        </p>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"
                                id="${project.id}list4"><@p.text "${project.id}list4" "Дата: ${project.date_created}"/></li>
                        </ul>
                    </div>
                    <div class="card-footer text-muted" id="${project.id}list5">
                        <@p.text "${project.id}list5" "Создатель: ${project.creator.username}"/>
                    </div>
                </div>
            </div>
        <#else>
            <h3>Пока нет проектов</h3>
        </#list>
    </div>
</@p.page>