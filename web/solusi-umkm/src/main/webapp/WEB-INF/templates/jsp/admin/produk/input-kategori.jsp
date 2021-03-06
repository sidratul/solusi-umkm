<%-- 
    Document   : input-umkm
    Created on : Dec 18, 2013, 9:43:51 PM
    Author     : sidratul
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="col-lg-12">
                <c:choose>
                    <c:when test="${empty kategoriProduk.id}">
                        <c:set var="ket" value="Input"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="ket" value="Edit"/>
                    </c:otherwise>
                </c:choose>
                <h1 class="page-header">Produk <small> ${ket} Kategori</small>
                </h1>
                <ol class="breadcrumb">
                  <li class="active"><i class="fa fa-download"></i> ${ket} kategori produk</li>
                </ol>
            </div>
        </div>
        
        <div class="row">
            <div class="col-lg-12">
                <c:if test="${not empty listPesan}">
                    <div class="row">
                        <div class="col-lg-12">
                             <c:forEach items="${listPesan}" var="lp" varStatus="i" >
                                <div class="alert alert-${lp.jenisPesan} alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <span class="kapital"> ${lp.isiPesan}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </div>
        </div> 
        
        
        <div class="row">
            <div class="col-lg-12">                
            <sf:form class="form-horizontal" role="form" modelAttribute="kategoriProduk" action="input-kategori">
                <sf:hidden path="id"/>
                <div class="form-group">
                  <label class="col-sm-2 control-label">Jenis Kategori</label>
                  <div class="col-xs-4">
                      <sf:input type="text" class="form-control" path="jenisProduk" placeholder="jenis kategori" required="required"/>
                  </div>
                </div>
                  
                <div class="form-group">
                  <label class="col-sm-2 control-label">Kode</label>
                  <div class="col-xs-4">
                      <sf:input type="text" class="form-control" path="kode" placeholder="jenis kategori" required="required"/>
                  </div>
                </div>

                <!--button-->
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Proses</button>
                    <button type="reset" class="btn btn-danger">Hapus</button>
                  </div>
                </div>
            </sf:form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Kategori</th>
                  <th>Kode</th>
                  <th>Edit</th>
                  <th>Hapus</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${listKategoriProduk}" var="lk" varStatus="i" >
                  <tr>
                      <td>${i.count}</td>
                      <td>${lk.jenisProduk}</td>
                      <td>${lk.kode}</td>
                      <td><a title="edit" alt="edit" href="input-kategori?id=${lk.id}"><i class="fa fa-edit"></i></a></td>
                      <td><a title="hapus" alt="hapus" href="hapus-kategori?id=${lk.id}" onclick="return tampil_confirm()"><i class="fa fa-trash-o"></i></a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
        </div>
            </div>                    
        </div>
    </body>
</html>
