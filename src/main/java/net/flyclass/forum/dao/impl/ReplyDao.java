package net.flyclass.forum.dao.impl;


import net.flyclass.forum.dao.ReplyDaoSerivce;
import net.flyclass.forum.domain.Reply;
import net.flyclass.forum.domain.Topic;
import net.flyclass.forum.util.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class ReplyDao implements ReplyDaoSerivce {


    private QueryRunner queryRunner = new QueryRunner(DataSourceUtil.getDataSource());

    //开启驼峰映射
    private BeanProcessor beanProcessor = new GenerousBeanProcessor();
    private RowProcessor processor = new BasicRowProcessor(beanProcessor);



    /**
     * 根据topic_id查询回复总记录
     * @param topicId
     * @return
     */
    public int countTotalReplyByCid(int topicId) {

        String sql = "select count(*) from reply where topic_id=?";

        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>(),topicId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }


    public List<Reply> findListByTopicId(int topicId, int from, int pageSize) {

        String sql = "select * from reply where topic_id=? order by create_time asc limit ?,?";

        List<Reply> replyList = null;

        try{

           replyList =  queryRunner.query(sql,new BeanListHandler<>(Reply.class,processor),topicId,from,pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }

        return replyList;
    }



    public int save(Reply reply) {

        String sql = "insert into reply (topic_id,floor,content,user_id,create_time,update_time,`delete`)" +
                "values (?,?,?,?,?,?,?)";

        Object [] params = {
                reply.getTopicId(),
                reply.getFloor(),
                reply.getContent(),
                reply.getUserId(),
                reply.getCreateTime(),
                reply.getUpdateTime(),
                reply.getDelete()
        };

        int rows = 0;
        try{

            rows = queryRunner.update(sql,params);

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }


    public int findReplyCount( ){
        String sql = "select count(*) from reply ";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }







    public int updateReply(Reply reply, int id) throws Exception {

        String sql = "update topic set topic_id=?,floor=?,content=?,user_id=? where id=?";
        Object[] params = {
                reply.getTopicId(),reply.getFloor(),reply.getContent(),reply.getUserId(),reply.getId()
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




    public List<Reply> list(){

        String sql = "select * from reply";

        List<Reply> list  = null;
        try {
            list  = queryRunner.query(sql,new BeanListHandler<>(Reply.class,processor));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }



    public int countTotalUserAll() {

        String sql = "select count(*) from reply";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }

    public List<Reply> findListAll( int from, int pageSize) {

        String sql = "select * from reply where `delete`=0 order by update_time desc limit ?,?";

        List<Reply> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Reply.class,processor),from,pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }



    public List<Reply> FindReplyId(int Id) {

        String sql = "select * from user where id=? ";

        List<Reply> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Reply.class,processor),Id);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }


    public int deleteAll(String content){
        int count = 0;
        String sql="delete from reply where id  in("+content+")";


        try {
            count =  queryRunner.update(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
}
