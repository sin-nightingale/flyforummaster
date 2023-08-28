package net.flyclass.forum.dao.impl;

import net.flyclass.forum.dao.CategoryDaoSerivce;
import net.flyclass.forum.domain.Category;
import net.flyclass.forum.domain.Topic;
import net.flyclass.forum.service.CategoryService;
import net.flyclass.forum.util.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class CategoryDao implements CategoryDaoSerivce {


    private QueryRunner queryRunner = new QueryRunner(DataSourceUtil.getDataSource());
    //开启驼峰映射
    private BeanProcessor beanProcessor = new GenerousBeanProcessor();
    private RowProcessor processor = new BasicRowProcessor(beanProcessor);
    private int id;


    /**
     * 根据id找分类
     * @param id
     * @return
     */
    public Category findById(int id){

        String sql = "select * from category where id=?";

        Category category = null;
        try {
             category  = queryRunner.query(sql,new BeanHandler<>(Category.class,processor),id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return category;

    }


    /**
     * 返回分类列表
     * @return
     */
    public List<Category> list(){

        String sql = "select * from category order by weight desc";

        List<Category> list  = null;
        try {
            list  = queryRunner.query(sql,new BeanListHandler<>(Category.class,processor));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }


    public int save(Category category) throws Exception {

        String sql = "insert into category (name,weight,create_time) values(?,?,?)";
        Object[] params = {
                category.getName(),category.getWeight(),category.getCreateTime()
        };

        int i ;
        try{
            i = queryRunner.update(sql,params);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception();
        }
        return i;
    }




    public int findCategoryCount(){
        String sql = "select count(*) from category ";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }

    public int deleteAll(String condition){
        int count = 0;
        String sql="delete from category where id  in("+condition+")";
        try {
            count =  queryRunner.update(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;

    }






    public int updateCategory(Category category, int id) throws Exception {

        String sql = "update category set name=?,weight=? where id=?";
        Object[] params = {
               category.getName(),category.getWeight() ,category.getId()
        };

        int i ;
        try{
            i = queryRunner.update(sql,params);


        }catch (Exception e){
            e.printStackTrace();
            throw new Exception();
        }
        return i;
    }


    public int countTotalCategoryAll() {

        String sql = "select count(*) from category";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }

    public List<Category> findListAll( int from, int pageSize) {

        String sql = "select * from category where `delete`=0 order by create_time desc limit ?,?";

        List<Category> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Category.class,processor),from,pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }


    public List<Category> FindCategoryId(int Id) {

        String sql = "select * from user where id=? ";

        List<Category> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Category.class,processor),Id);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }


}
