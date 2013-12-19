package com.sidratul.solusiumkm.admin.controller;

import com.sidratul.solusiumkm.dao.KategoriProdukDao;
import com.sidratul.solusiumkm.dao.ProdukDao;
import com.sidratul.solusiumkm.dao.UmkmDao;
import com.sidratul.solusiumkm.model.KategoriProduk;
import com.sidratul.solusiumkm.model.Produk;
import com.sidratul.solusiumkm.model.Umkm;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/produk")
public class ProdukController {
    @Autowired private ProdukDao produkDao;
    @Autowired private UmkmDao umkmDao;
    @Autowired private KategoriProdukDao kategoriProdukDao;
    
    @RequestMapping("/index")
    public void tampilUmkm(ModelMap modelMap){
        List<Produk> produks = produkDao.getAllProduk();
        modelMap.addAttribute("listProduk",produks);
    }
    
    @RequestMapping(value = "/input-produk",method = RequestMethod.GET)
    public void formInputProduk(@RequestParam(value = "id", required = false) Integer id,
    ModelMap modelMap){
        Produk produk = produkDao.getProdukById(id);
        if(produk==null){
            produk = new Produk();
        }
        
        List<KategoriProduk> kategoriProduks = kategoriProdukDao.getAllKategoriProduk();
        List<Umkm> umkms = umkmDao.getAllUmkm();
        
        modelMap.addAttribute("produk", produk);
        
        modelMap.addAttribute("listUmkm", umkms);
        modelMap.addAttribute("listKategoriProduk", kategoriProduks);
    }
    
    @RequestMapping(value = "/input-produk",method = RequestMethod.POST)
    public String prosesInputProduk(@ModelAttribute Produk produk,
    @RequestParam(value = "foto",required = false) List<MultipartFile> files,
    ModelMap modelMap){
        produk.setTglUpdateProduk(new Date());
        
        if(files!= null && files.size() > 0) {
            for (MultipartFile multipartFile : files) {
 
                String fileName = multipartFile.getOriginalFilename();
                System.out.println("nama file :"+fileName);
 
            }
        }
        
        produkDao.saveProduk(produk);
        return "redirect:index";
    }
    
    @RequestMapping("/hapus-produk")
    public String hapusProduk(@RequestParam("id") Integer id,
    ModelMap modelMap){
        produkDao.deleteProduk(id);
        return "redirect:index";
    }
    
//    kategori produk
    @RequestMapping("/kategori")
    public void tampilKategoriProduk(ModelMap modelMap){
        List<KategoriProduk> kategoriProduks = kategoriProdukDao.getAllKategoriProduk();
        modelMap.addAttribute("listKategoriProduk", kategoriProduks);
    }
    
    @RequestMapping(value = "/input-kategori",method = RequestMethod.GET)
    public void formInputKategoriProduk(@RequestParam(value = "id",required = false) Integer id,
    ModelMap modelMap){
        KategoriProduk kategoriProduk = kategoriProdukDao.getKategoriProdukById(id);
        if(kategoriProduk==null){
            kategoriProduk = new KategoriProduk();
        }
        
        modelMap.addAttribute("kategoriProduk", kategoriProduk);
    }
    
    @RequestMapping(value = "/input-kategori",method = RequestMethod.POST)
    public String prosesInputKategoriProduk(@ModelAttribute KategoriProduk kategoriProduk,
    ModelMap modelMap){
        kategoriProdukDao.saveKategoriProduk(kategoriProduk);
        return "redirect:kategori";
    }
    
    @RequestMapping("/hapus-kategori")
    public String hapusKategoriProduk(@RequestParam("id") Integer id,
    ModelMap modelMap){
        kategoriProdukDao.deleteKategoriProduk(id);
        return "redirect:kategori";
    }
}
