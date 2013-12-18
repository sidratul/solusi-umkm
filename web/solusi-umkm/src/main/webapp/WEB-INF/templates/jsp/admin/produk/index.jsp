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
        <div class="col-lg-12">
            <h2>UMKM <small>Index</small></h2>
            <ol class="breadcrumb">
              <li class="active"><i class="fa fa-users"></i> Daftar anggota asosiasi UMKM</li>
            </ol>
        </div>
        <c:choose>
            <c:when test="${empty listProduk}">
                <div class="col-lg-12">
                    <ol class="breadcrumb">
                      <li class="active"><i class="fa fa-arrow-circle-o-right"></i> Data Kosong</li>
                    </ol>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Kode Produk</th>
                          <th>Nama Produk</th>
                          <th>Kategori Produk</th>
                          <th>Nama Umkm</th>
                          <th>harga</th>
                          <th>keterangan</th>
                          <th>tgl update</th>
                          <th colspan="2"></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${listProduk}" var="lp" varStatus="i" >
                          <tr>
                              <td>${i.count}</td>
                              <td>${lp.kodeProduk}</td>
                              <td>${lp.namaProduk}</td>
                              <td>${lp.kategoriProduk.jenisProduk}</td>
                              <td>${lp.umkm.namaUmkm}</td>
                              <td>${lp.harga}</td>
                              <td>${lp.keteranganProduk}</td>
                              <td>${lp.tglUpdateProduk}</td>
                              <td><a title="edit" alt="edit" href="input-produk?id=${lp.id}"><i class="fa fa-edit"></i></a></td>
                              <td><a title="hapus" alt="hapus" href="hapus-produk?id=${lp.id}"><i class="fa fa-trash-o"></i></a></td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </body>
</html>
