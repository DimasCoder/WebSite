<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
    >
<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    isAdmin = user.isAdmin()
    name = user.getUsername()
    userid = user.getId()
        >
<#else>
    <#assign
        name = "Guest"
        isAdmin = false
        userid = -1
        >
</#if>