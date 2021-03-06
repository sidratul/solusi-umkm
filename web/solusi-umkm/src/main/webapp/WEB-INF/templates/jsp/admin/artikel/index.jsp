<%-- 
    Document   : index
    Created on : Dec 18, 2013, 10:15:21 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<fmt:setLocale value="id_ID" scope="session"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artikel</title>
    </head>
    <body>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Artikel <small>Index</small></h1>
                <ol class="breadcrumb">
                  <li class="active"><i class="fa fa-users"></i> Daftar artikel untuk web solusi UMKM</li>
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
        <c:choose>
            <c:when test="${empty listArtikel}">
                <div class="row">
                    <div class="col-lg-12">
                        <ol class="breadcrumb">
                          <li class="active"><i class="fa fa-arrow-circle-o-right"></i> Data Kosong</li>
                        </ol>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row">
                    <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Judul</th>
                          <th>Isi</th>
                          <th>Foto</th>
                          <th>Tanggal Update</th>
                          <th>Lihat</th>
                          <th>Edit</th>
                          <th>Hapus</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${listArtikel}" var="la" varStatus="i" >
                          <tr>
                              <td>${i.count}</td>
                              <td>${la.judul}</td>
                              <td>${la.isi}</td>
                              <td>
                                  <c:choose>    
                                    <c:when test="${empty la.namaFoto}">
                                        <i><small>(foto tidak ada)</small></i>
                                    </c:when >
                                    <c:otherwise>
                                        <i class="fa fa-check"></i>
                                    </c:otherwise>
                                </c:choose>
                                  
                              </td>
                              <td>
                                <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${la.tglUpdate}" />
                              </td>
                              <td><a title="detail" alt="detail" href="detail?id=${la.id}"><i class="fa fa-eye"></i></a></td>
                              <td><a title="edit" alt="edit" href="input-artikel?id=${la.id}"><i class="fa fa-edit"></i></a></td>
                              <td><a title="hapus" alt="hapus" href="hapus-artikel?id=${la.id}" onclick="return tampil_confirm()"><i class="fa fa-trash-o"></i></a></td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </body>
</html>
