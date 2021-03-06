package com.sidratul.solusiumkm.dao.impl;

import com.sidratul.solusiumkm.dao.ArtikelDao;
import com.sidratul.solusiumkm.model.Artikel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;

@Repository("artikelDao")
public class ArtikelDaoImpl implements ArtikelDao{
    private static final String SQL_GETALL_ARTIKEL="SELECT * FROM artikel ORDER BY tgl_update desc";
    private static final String SQL_GETARTIKEL_BYID="SELECT * FROM artikel where id=?";
    private static final String SQL_DELETE_ARTIKEL="DELETE FROM artikel where id = ?";
    private static final String SQL_UPDATE_ARTIKEL="UPDATE `artikel` "
            + "SET `judul` = ?,`isi` = ?,`gambar` = ?,`tgl_update` = ? "
            + "WHERE `id` = ?";
    private static final String SQL_INSERT_ARTIKEL="INSERT INTO `artikel`(`judul`,`isi`,`gambar`,`tgl_update`)"
            + "VALUES(?,?,?,?)";
    
    private JdbcTemplate jdbcTemplate;

    
    public final class ArtikelParameterizedRowMapper implements ParameterizedRowMapper<Artikel>{

        public Artikel mapRow(ResultSet rs, int i) throws SQLException {
            Artikel artikel = new Artikel();
            artikel.setId(rs.getInt("id"));
            artikel.setJudul(rs.getString("judul"));
            artikel.setIsi(rs.getString("isi"));
            artikel.setNamaFoto(rs.getString("gambar"));
//            artikel.setNamaFile(rs.getString("file"));
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date;
            try{
                date = format.parse(rs.getString("tgl_update"));
            }catch(Exception e){
                date = null;
            }
            artikel.setTglUpdate(date);
            
            return artikel;
        }
    
    }
    
    @Autowired
    public void setDataSource(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    

    public List<Artikel> getAllArtikel() {
        List<Artikel> artikels = jdbcTemplate.query(SQL_GETALL_ARTIKEL, new ArtikelParameterizedRowMapper());
        return  artikels;
    }

    public void saveArtikel(Artikel artikel) {
        if(artikel.getId()!=null){
            jdbcTemplate.update(SQL_UPDATE_ARTIKEL, new Object[]{
                artikel.getJudul(),
                artikel.getIsi().replace("\n","<br>\n"),
                artikel.getNamaFoto(),
                artikel.getTglUpdate(),
                artikel.getId()
            });
        }else{
            jdbcTemplate.update(SQL_INSERT_ARTIKEL, new Object[]{
                artikel.getJudul(),
                artikel.getIsi().replace("\n","<br>\n"),
                artikel.getNamaFoto(),
                artikel.getTglUpdate()
            });
        }
    }

    public Artikel getArtikelById(Integer id) {
        if(id==null){
            return  null;
        }else{
            Artikel artikel =jdbcTemplate.queryForObject(SQL_GETARTIKEL_BYID, new ArtikelParameterizedRowMapper(), id);
            return artikel;
                    
        }
    }

    public void deleteArtikel(Integer id) {
        jdbcTemplate.update(SQL_DELETE_ARTIKEL,id);
    }
    
}
