<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page false false>
    <div>Hello, user</div>
    <#if known>
        <form method="post" action="/hello">
            <div class="form-group">
                <label>Category</label>
                <input type="text" class="form-control" name="categoryName"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            ${message?ifExists}
            <div class="mt-3">
                <button class="btn btn-warning" type="submit">Post</button>
            </div>
        </form>
    </#if>
</@c.page>
