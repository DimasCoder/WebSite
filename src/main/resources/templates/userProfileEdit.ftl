<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page false false>

    <link rel="stylesheet" href="/static/css/profile.css">


    <div class="container">
        <div class="row">
            <div class="col align-self-center">
                <div class="card hovercard">
                    <div class="cardheader">
                    </div>
                    <div class="avatar">
                        <img src="/img/<#if avatar??>${avatar}<#else>guest.png</#if>"">
                    </div>
                    <div style="max-width:200px;margin:auto">
                        <form method="post" enctype="multipart/form-data" action="/profile/profile">
                        <div class="upload-btn-wrapper">
                            <button class="btn3">Change photo</button>
                            <input type="file" name="file" />
                        </div>
                        <div class="input-icons">
                            <i class="fa fa-user icon"></i>
                            <input class="input-field" type="text" name="username" value="${username}">
                            <i class="fa fa-envelope icon"></i>
                            <input class="input-field" type="text" value="Email">
                            <i class="fa fa-instagram icon"></i>
                            <input class="input-field" type="text" name="instagram" <#if instagram??>value="${instagram}"<#else>value="" placeholder="Instagram" </#if>>
                            <i class="fa fa-twitter icon"></i>
                            <input class="input-field" type="text" name="twitter" <#if twitter??>value="${twitter}"<#else>value="" placeholder="Twitter" </#if>>
                            <i class="fa fa-facebook icon"></i>
                            <input class="input-field" type="text" name="facebook" <#if facebook??>value="${facebook}"<#else>value="" placeholder="Facebook" </#if>>
                            <textarea placeholder="Description" class="input-field-area" name="description" rows = 4></textarea>
                            <#list languages as lang>
                                <div>
                                    <label><input type="checkbox" name="${lang}" ${user.language?seq_contains(lang)?string("checked", "")}>
                                        <#if lang?string == "JAVA">
                                            Java
                                        <#elseif lang?string == "CSHARP">
                                            C#
                                        <#elseif lang?string == "CPLUSPLUS">
                                            C++
                                        <#elseif lang?string == "PYTHON">
                                            Python
                                        <#elseif lang?string == "RUBY">
                                            Ruby
                                        <#elseif lang?string == "JAVASCRIPT">
                                            JavaScript
                                        <#elseif lang?string == "GO">
                                            Go
                                        <#elseif lang?string == "SWIFT">
                                            Swift
                                        <#elseif lang?string == "KOTLIN">
                                            Kotlin
                                        <#elseif lang?string == "DART">
                                            Dart
                                        <#elseif lang?string == "OBJECTIVEC">
                                            Objective-C
                                        <#elseif lang?string == "MATLAB">
                                            Matlab
                                        <#elseif lang?string == "TYPESCRIPT">
                                            TypeScript
                                        <#elseif lang?string == "SCALA">
                                            Scala
                                        <#elseif lang?string == "VISUALBASIC">
                                            Visual Basic
                                        <#else>
                                            ${lang}
                                        </#if></label>
                                </div>
                            </#list>
                        </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button class="btn3" type="submit">Save</button>
                        </form>
                    </div>

</@c.page>