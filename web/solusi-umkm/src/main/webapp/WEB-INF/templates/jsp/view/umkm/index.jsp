<%-- 
    Document   : index
    Created on : Dec 21, 2013, 11:52:43 AM
    Author     : sidratul
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>UMKM <small>Index</small></h1>
        <hr>
    <form class="form-horizontal">
        <div class="form-group">
                <div class="col-lg-5">
                  <input type="text" class="form-control" placeholder="Kata Kunci">
                </div>
                <div class="col-lg-5">
                    <select class="form-control">
                        <option value="">Kategori UMKM</option>
                        <c:forEach items="${listKategoriUmkm}" var="lku">
                            <option value="${lku.id}">${lku.jenisUmkm}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-lg-2">
                    <input type="submit" class="btn btn-info" value="Cari">
                </div>
        </div>
      </form>  
        <hr>
        <c:forEach items="${listUmkm}" var="lu">
            <div class="col-md-12 p-padd breadcrumb" >
                <table class="capital">
                    <tr>
                        <td>Nama UMKM</td>
                        <td width="30px" > : </td>
                        <td>${lu.namaUmkm}</td>
                    </tr>
                    <tr>
                        <td>Pemilik UMKM</td>
                        <td> : </td>
                        <td><div>${lu.pemilikUmkm}</div></td>
                    </tr>
                    <tr>
                        <td>Kategori UMKM</td>
                        <td> : </td>
                        <td><div>${lu.kategoriUmkm.jenisUmkm}</div></td>
                    </tr>
                    <tr>
                        <td>Alamat</td>
                        <td> : </td>
                        <td>
                            <c:choose>    
                                <c:when test="${empty lu.noTelp}">
                                    <i><small>(alamat tidak tersedia)</small></i>
                                </c:when >
                                <c:otherwise>
                                    ${lu.alamat}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td>no telepon</td>
                        <td> : </td>
                        <td>
                            <di>
                                <c:choose>    
                                    <c:when test="${empty lu.noTelp}">
                                        <i><small>(nomor telepon tidak tersedia)</small></i>
                                    </c:when >
                                    <c:otherwise>
                                        ${lu.noTelp}
                                    </c:otherwise>
                                </c:choose>
                            </di>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div >
                                <a href="detail?id=${lu.id}" class="btn btn-sm btn-info">Lihat UMKM</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <hr>
        </c:forEach>    

    </body>
</html>