<%-- 
    Document   : index
    Created on : Dec 18, 2013, 10:15:21 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h1 class="page-header">UMKM <small>Detail</small></h1>
        </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <small>
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
                </small>
            </div>
        </div> 
        <c:choose>
            <c:when test="${empty umkm}">
                <div class="col-lg-12">
                    <ol class="breadcrumb">
                      <li class="active"><i class="fa fa-arrow-circle-o-right"></i> Data Tidak Ditemukan</li>
                    </ol>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-responsive breadcrumb capital">
                        <tr>
                          <td>Kode</td>
                          <td>:</td>
                          <td>${umkm.kodeUmkm}</td>
                        </tr>
                        <tr>
                          <td>Nama</td>
                          <td>:</td>
                          <td>${umkm.namaUmkm}</td>
                        </tr>
                        <tr>
                          <td>Pemilik</td>
                          <td>:</td>
                          <td>${umkm.pemilikUmkm}</td>
                        </tr>
                        <tr>
                          <td>Username</td>
                          <td>:</td>
                          <td>${umkm.username}</td>
                        </tr>
                        <tr>
                          <td>Keterangan</td>
                          <td>:</td>
                          <td>
                              <c:choose>    
                                <c:when test="${empty umkm.keteranganUmkm}">
                                    <i><small>(keterangan tidak tersedia)</small></i>
                                </c:when >
                                <c:otherwise>
                                    ${umkm.keteranganUmkm}
                                </c:otherwise>
                            </c:choose>
                          </td>
                        </tr>
                        <tr>
                          <td>Visi</td>
                          <td>:</td>
                          <td>
                              <c:choose>    
                                <c:when test="${empty umkm.visi}">
                                    <i><small>(visi tidak tersedia)</small></i>
                                </c:when >
                                <c:otherwise>
                                    ${umkm.visi}
                                </c:otherwise>
                            </c:choose>
                          </td>
                        </tr>
                        <tr>
                          <td>misi</td>
                          <td>:</td>
                          <td>
                              <c:choose>    
                                <c:when test="${empty umkm.misi}">
                                    <i><small>(misi tidak tersedia)</small></i>
                                </c:when >
                                <c:otherwise>
                                    ${umkm.misi}
                                </c:otherwise>
                            </c:choose>
                          </td>
                        </tr>
                        <tr>
                          <td>alamat</td>
                          <td>:</td>
                          <td>
                              <c:choose>    
                                <c:when test="${empty umkm.alamat}">
                                    <i><small>(alamat tidak tersedia)</small></i>
                                </c:when >
                                <c:otherwise>
                                    ${umkm.alamat}
                                </c:otherwise>
                            </c:choose>
                          </td>
                        </tr>
                        <tr>
                          <td>Telepon</td>
                          <td>:</td>
                          <td>
                              <c:choose>    
                                <c:when test="${empty umkm.noTelp}">
                                    <i><small>(Nomer Telepon tidak tersedia)</small></i>
                                </c:when >
                                <c:otherwise>
                                    ${umkm.noTelp}
                                </c:otherwise>
                            </c:choose>
                          </td>
                        </tr>
                        <tr>
                          <td>Email</td>
                          <td>:</td>
                          <td>
                              <c:choose>    
                                <c:when test="${empty umkm.email}">
                                    <i><small>(email tidak tersedia)</small></i>
                                </c:when >
                                <c:otherwise>
                                    ${umkm.email}
                                </c:otherwise>
                            </c:choose>
                          </td>
                        </tr>
                    </table>
                    <a title="edit" class="btn btn-primary" alt="edit" href="edit">Edit <i class="fa fa-edit"></i></a>
                </div>
            </c:otherwise>
        </c:choose>
        <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
        <script>
            $(document).ready(function() {
                $('.active').removeClass('active');
                
                $("#menu-umkm-saya").addClass("active");
            });
        </script>
    </body>
</html>
