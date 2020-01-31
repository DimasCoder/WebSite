<#import "parts/common.ftl" as c>

<@c.page false true>
    List of users

    <table class="table table-dark">
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td><a href="/profile/${user.id}">${user.username}</a></td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td>
                        <input type="button" class="btn btn-primary" value="Edit" onClick='location.href="http://localhost:8080/user/${user.id}"'>
                    <form action="/user/delete" method="post" >
                        <input type="hidden" name="id" value="${user.id}">
                        <button class="btn btn-danger" type="submit">Delete</button>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                    </form>
                    </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>