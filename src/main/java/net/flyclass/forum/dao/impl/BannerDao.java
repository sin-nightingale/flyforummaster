package net.flyclass.forum.dao.impl;

import net.flyclass.forum.dao.BannerDaoSerivce;
import net.flyclass.forum.domain.Banner;
import net.flyclass.forum.dto.PageDTO;
import net.flyclass.forum.util.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class BannerDao implements BannerDaoSerivce {


    private QueryRunner queryRunner = new QueryRunner(DataSourceUtil.getDataSource());
    //开启驼峰映射
    private BeanProcessor beanProcessor = new GenerousBeanProcessor();
    private RowProcessor processor = new BasicRowProcessor(beanProcessor);


    public PageDTO<Banner> listBannerPageAll(int page, int pageSize) {
        return null;

   }

    public int countTotalBannerAll() {

        String sql = "select count(*) from banner";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }

    public List<Banner> findListAll( int from, int pageSize) {

        String sql = "select * from banner limit ?,?";

        List<Banner> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Banner.class,processor),from,pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public List<Banner> FindAllBanner() {

        String sql = "select * from banner";

        List<Banner> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Banner.class,processor));
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public int save(String title,String bannerImg,String goHref,int isShow) throws Exception {



        String sql = "insert into banner (title,banner_img,go_href,is_show) values(?,?,?,?)";

        int i ;
        try{
            i = queryRunner.update(sql,title,bannerImg,goHref,isShow);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception();
        }
        return i;
    }

    @Override
    public Banner findById(int bannerId) {
        String sql = "select * from banner where id=?";

        Banner banner = null;
        try {
            banner  = queryRunner.query(sql,new BeanHandler<>(Banner.class,processor),bannerId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return banner;

    }

    @Override
    public int updateBanner(Banner banner, int id) throws Exception {
        String sql = "update banner set title=?,banner_img=? ,go_href=?,is_show=? where id=?";
        Object[] params = {
                banner.getTitle(),banner.getBannerImg(),banner.getGoHref(),banner.getIsShow(),id
        };

        int i =0;
        try{
            i = queryRunner.update(sql,params);


        }catch (Exception e){
            e.printStackTrace();

        }
        return i;
    }


}
