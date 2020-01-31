<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page false false>
    <#if known>
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>Title</label>
                <input type="text" class="form-control" name="title"/>
            </div>
            <div class="form-group mt-3">
                <label>Text</label>
                <textarea class="form-control" name="text" rows = 4></textarea>
            </div>
            <div class="form-group mt-3">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="mt-3">
                <button class="btn btn-warning" type="submit">Post</button>
            </div>
        </form>
    </#if>

    <div class="row">
        <div class="col-xs-6 col-md-3"></div>
        <div class="col-xs-6 col-md-7">
            <#list messages?reverse as message>
                <div class="card border-warning my-3 col-md-12">
                    <div class="row mt-2 mx-1">
                        <div class="col col-1">
                            <img src="img/${message.authorAvatar}"  class="circle img-fluid" >
                        </div>
                        <div class="col-md-3 col-5" onClick='location.href="http://localhost:8080/profile/${message.author.getId()}"'><b>${message.authorName}</b></div>
                        <div class="col-md-8 col-6 text-right">
                            <p class="ml-2">${message.date}</p>
                        </div>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${message.title}</h5>
                        <p class="card-text">${message.text}</p>
                    </div>
                    <#if message.file??>
                        <div class="mx-3 mb-3">
                            <img class="card-img-top rounded" style="height: 25rem;" src="/img/${message.file}">
                        </div>
                    </#if>
                </div>

            <#else>
                No message
            </#list>
        </div>
        <div class="col-xs-6 col-md-2"></div>
    </div>

</@c.page>