<#macro login path isRegisterForm>
    <form class="box" action="${path}" method="post">
        <h1><#if !isRegisterForm>Login<#else>Register</#if></h1>
        <input type="text" name="username" placeholder="Username"/>
        <input type="password" name="password" placeholder="Password"/>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="<#if isRegisterForm>Create<#else>Sign In</#if>">
    </form>
    <div class="box2">
        <p><#if isRegisterForm>Already registered?<#else>Not registered?</#if><a href="<#if isRegisterForm>/login<#else>/registration</#if>"><#if isRegisterForm> Login<#else> Register</#if></a></p>
    </div>
</#macro>
<#macro logout>
    <form action="/logout" method="post">
        <button class="btn btn-warning" type="submit">Sign out</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>
</#macro>