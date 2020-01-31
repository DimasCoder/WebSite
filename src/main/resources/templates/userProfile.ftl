<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page false true>

    <link rel="stylesheet" href="../static/css/profile.css">

    <div class="container">
        <div class="row">
            <div class="col align-self-center">
                <div class="card hovercard">
                    <div class="cardheader">
                    </div>
                    <div class="avatar">
                        <#if name == username>
                            <a class="aa">
                                <img src="/img/settings.svg">
                            </a>
                        </#if>
                        <img src="/img/<#if avatar??>${avatar}<#else>guest.png</#if>">
                        <#if name == username>
                            <a class="a1" href="/profile/${userid}/edit">
                                <img src="/img/settings.svg">
                            </a>
                        </#if>
                    </div>
                    <div class="info">
                        <div class="title">
                            <h1>${username}</h1>
                        </div>
                        <#if curUser.isAdmin()>
                            <div class="admin">ADMIN</div>
                        <#else>
                            <div class="user">USER</div>
                        </#if>

                        <div class="desc"><#if description??>${curUser.getDescription()}<#else>This is a new user!</#if></div>
                        <div class="row">
                        <#list curUser.getLanguage() as lang>
                            <div class="col">
                            <#if lang?string == "JAVA">
                                <div class="java">#Java</div>
                            <#elseif lang?string == "CSHARP">
                                <div class="desc">#C#</div>
                            <#elseif lang?string == "CPLUSPLUS">
                                <div class="desc">#C++</div>

                            <#elseif lang?string == "PYTHON">
                                <div class="desc">#Python</div>
                            <#elseif lang?string == "RUBY">
                                <div class="desc">#Ruby</div>

                            <#elseif lang?string == "JAVASCRIPT">
                                <div class="desc">#JavaScript</div>

                            <#elseif lang?string == "GO">
                                <div class="desc">#Go</div>

                            <#elseif lang?string == "SWIFT">
                                <div class="desc">#Swift</div>

                            <#elseif lang?string == "KOTLIN">
                                <div class="desc">#Kotlin</div>

                            <#elseif lang?string == "DART">
                                <div class="desc">#Dart</div>

                            <#elseif lang?string == "OBJECTIVEC">
                                <div class="desc">#Objective-C</div>
                            <#elseif lang?string == "MATLAB">
                                <div class="desc">#Matlab</div>

                            <#elseif lang?string == "TYPESCRIPT">
                                <div class="desc">#TypeScript</div>

                            <#elseif lang?string == "SCALA">
                                <div class="desc">#Scala</div>

                            <#elseif lang?string == "HTML">
                                <div class="html">#HTML</div>

                            <#elseif lang?string == "CSS">
                                <div class="css">#CSS</div>

                            <#elseif lang?string == "VISUALBASIC">
                                <div class="desc">#Visual Basic</div>
                            <#else>
                                <div class="desc">#${lang}</div>
                            </#if>
                            </div>
                        </#list>
                        </div>
                    </div>
                    <div class="bottom">
                        <#if instagram??>
                        <a class="btn1 btn-sm" href="${instagram}">
                            <i class="fa fa-instagram icon"></i>
                        </a>
                        </#if>
                        <#if twitter??>
                        <a class="btn1 btn-sm" rel="publisher"
                           href="${twitter}">
                            <i class="fa fa-twitter icon"></i>
                        </a>
                        </#if>
                        <#if facebook??>
                        <a class="btn1 btn-sm" rel="publisher"
                           href="${facebook}">
                            <i class="fa fa-facebook icon"></i>
                        </a>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>

</@c.page>