<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/catalog">Catalog</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Messages</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">User list</a>
            </li>
            </#if>
            <#if known>
                <li class="nav-item">
                    <form method="get">
                        <div class="input-field">
                            <input id="search" type="search" required name="filter">
                            <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                            <i class="material-icons">close</i>
                        </div>
                    </form>
                </li>
            </#if>
        </ul>
        <#if known>
        <div class="navbar-text mr-3" onClick='location.href="http://localhost:8080/profile/${userid}"'>${name}</div>
        </#if>
        <#if !known>
            <div class="navbar-text mr-3">${name}</div>
        </#if>
        <#if known>
            <@l.logout/>
        </#if>
        <#if !known>
            <form>
                <input type="button" class="btn btn-warning" value="Register" onClick='location.href="http://localhost:8080/registration"'>
            </form>

        </#if>
    </div>
</nav>