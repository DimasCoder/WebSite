<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page false false>
    <link rel="stylesheet" href="../static/css/cart.css">
    <#if isAdmin>
        <a class="btn btn-warning" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Add new product
        </a>
        <div class="collapse" id="collapseExample">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Title</label>
                    <input type="text" class="form-control" name="title"/>
                </div>
                <div class="form-group mt-3">
                    <label>Description</label>
                    <textarea class="form-control" name="description" rows = 4></textarea>
                </div>
                <div class="form-group mt-3">
                    <label>Price</label>
                    <textarea class="form-control" name="price" rows = 4></textarea>
                </div>
                <div class="form-group mt-3">
                    <label>Category</label>
                    <textarea class="form-control" name="category" rows = 4></textarea>
                </div>
                <div class="form-group mt-3">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose first file</label>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <div class="custom-file">
                        <input type="file" name="fileTwo" id="customFile1">
                        <label class="custom-file-label" for="customFile1">Choose second file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="mt-3">
                    <button class="btn btn-warning" type="submit">Post</button>
                </div>
            </form>
        </div>
    </#if>

    <div class="container">
        <div class="row">
            <#list products as product>
            <div class="col-md-3 col-sm-6">
                <div class="product-grid7">
                    <div class="product-image7">
                        <a href="#">
                            <img class="pic-1" src="/img/${product.image}">
                            <img class="pic-2" src="/img/<#if product.imageTwo??>${product.imageTwo}<#else>${product.image}</#if>">
                        </a>
                        <ul class="social">
                            <li><a href="" class="fa fa-search"></a></li>
                            <li><a href="" class="fa fa-shopping-bag"></a></li>
                            <li><a href="" class="fa fa-shopping-cart"></a></li>
                        </ul>
                        <span class="product-new-label">New</span>
                    </div>
                    <div class="product-content">
                        <h3 class="title"><a href="#">${product.title}</a></h3>
                        <ul class="rating">
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                        </ul>
                        <div class="price">$${product.price}
                        </div>
                    </div>
                </div>
            </div>
            </#list>
        </div>
    </div>
    <hr>

</@c.page>