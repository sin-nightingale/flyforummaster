package net.flyclass.forum.dao.impl;

import net.flyclass.forum.dao.TopicDaoSerivce;
import net.flyclass.forum.domain.Topic;
import net.flyclass.forum.domain.User;
import net.flyclass.forum.util.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class TopicDao implements TopicDaoSerivce {


    private QueryRunner queryRunner = new QueryRunner(DataSourceUtil.getDataSource());

    //开启驼峰映射
    private BeanProcessor beanProcessor = new GenerousBeanProcessor();
    private RowProcessor processor = new BasicRowProcessor(beanProcessor);


    /**
     * 根据cid查询总行数
     * @param cId
     * @return
     */
    public int countTotalTopicByCid(int cId) {

        String sql = "select count(*) from topic where c_id=? and `delete`=0";
        Long count = null;
        try {
             count =  (Long)queryRunner.query(sql,new ScalarHandler<>(),cId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }


    /**
     * 分页查询
     * @param cId
     * @param from
     * @param pageSize
     * @return
     */
    public List<Topic> findListByCid(int cId, int from, int pageSize) {

        String sql = "select * from topic where c_id=? and `delete`=0 order by update_time desc limit ?,?";

        List<Topic> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Topic.class,processor),cId,from,pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }












    /**
     * 根据topic查询总行数
     * @param
     * @return
     */
    public int countTotalTopicAll() {

        String sql = "select count(*) from topic where `delete`=0";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }


    /**
     * 分页查询]juu                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 cdde
     * @param
     * @param from
     * @param pageSize
     * @return
     */
    public List<Topic> findListAll( int from, int pageSize) {

        String sql = "select * from topic where `delete`=0 order by update_time desc limit ?,?";

        List<Topic> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Topic.class,processor),from,pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }





    public List<Topic> listTopicByTitle( String title,int from, int pageSize) {

        String sql = "SELECT * FROM topic where title LIKE ? order by update_time desc limit ?,?";

        List<Topic> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Topic.class,processor),title,from,pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }














    /**
     * 返回Topic列表
     * @return
     */
    public List<Topic> list(){

        String sql = "select * from topic ";

        List<Topic> list  = null;
        try {
            list  = queryRunner.query(sql,new BeanListHandler<>(Topic.class,processor));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }




    public  Topic findById(int topicId) {

        String sql = "select * from topic where id = ?";

        Topic topic = null;

        try{

            topic =  queryRunner.query(sql,new BeanHandler<>(Topic.class,processor),topicId);

        }catch (Exception e){
            e.printStackTrace();
        }
        return  topic;

    }

    public int save(Topic topic) throws Exception {

        String sql = "insert into topic(c_id,title,content,pv,user_id,create_time,update_time,hot,`delete`) " +
                "values(?,?,?,?,?,?,?,?,?)";

        Object [] params = {
                topic.getcId(),
                topic.getTitle(),
                topic.getContent(),
                topic.getPv(),
                topic.getUserId(),
                topic.getCreateTime(),
                topic.getUpdateTime(),
                topic.getHot(),
                topic.getDelete()
        };

        int i =0;

        try{
            i= queryRunner.update(sql,params);

        }catch (Exception e){
            e.printStackTrace();
            throw new Exception();
        }

        return i;


    }

    /**
     * 查找最新楼层的问题
     * @param topicId
     * @return
     */
    public int findLatestFloorByTopicId(int topicId) {

        //楼层是0，返回后才加1
        int defaultFloor = 0;

        String sql = "select floor from reply where topic_id=? order by floor desc limit 1";

        Integer floor = null;

        try {
              floor = (Integer) queryRunner.query(sql,new ScalarHandler<>(),topicId);

              if(floor == null){
                  return defaultFloor;

              }else {
                  return floor.intValue();
              }

        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }



    public int updateTopic(Topic topic, int id) throws Exception {

        String sql = "update topic set c_id=?,title=?,pv=?,user_id=?,hot=? where id=?";
        Object[] params = {
                topic.getcId(),topic.getTitle(),topic.getPv(),topic.getUserId(),topic.getHot(),topic.getId()
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


    /**
     * 更新浏览量
     * @param topicId
     * @param newPV
     * @param
     * @return
     */
    public int updatePV(int topicId, int newPV, int oldPV) {

        String sql = "update topic set pv=? where pv=? and id=?";

        int rows = 0;

        try {

            rows =  queryRunner.update(sql,newPV,oldPV,topicId);

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows;

    }
    public List<Topic> FindTopicId(int Id) {

        String sql = "select * from user where id=? ";

        List<Topic> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Topic.class,processor),Id);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }





    public List<Topic> FindTopicByUserId(int Id) {

        String sql = "select * from topic where user_id=? ";

        List<Topic> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Topic.class,processor),Id);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }


    public  int findTopicCount(){
        String sql = "select count(*) from topic ";
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
        String sql="delete from topic where id  in("+condition+")";

        try {
            count =  queryRunner.update(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;

    }



}


