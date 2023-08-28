package net.flyclass.forum.dao.impl;

import net.flyclass.forum.dao.UserDaoSerivce;
import net.flyclass.forum.domain.Relation;
import net.flyclass.forum.domain.Topic;
import net.flyclass.forum.domain.User;
import net.flyclass.forum.util.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import javax.print.DocFlavor;
import java.sql.SQLException;
import java.util.List;

public class UserDao implements UserDaoSerivce {


    private QueryRunner queryRunner = new QueryRunner(DataSourceUtil.getDataSource());

    //开启驼峰映射
    private BeanProcessor beanProcessor = new GenerousBeanProcessor();
    private RowProcessor processor = new BasicRowProcessor(beanProcessor);

    /**
     * @param user inser 插入
     * @return
     * @throws Exception
     */
    public int save(User user) throws Exception {

        String sql = "insert into user (phone,pwd,sex,img,create_time,role,username) values(?,?,?,?,?,?,?)";
        Object[] params = {
          user.getPhone(),user.getPwd(),user.getSex(),user.getImg(),user.getCreateTime(),user.getRole(),user.getUsername()
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
     *修改用户信息
     */

    public int updateUser(User user,int id) throws Exception {

        String sql = "update user set username=?,phone=?,pwd=?,sex=?,role=? where id=?";
        Object[] params = {
               user.getUsername(),user.getPhone(),user.getPwd(),user.getSex(),user.getRole(),user.getId()
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
     *User Login 登陆用户判断
     * @param phone
     * @param md5pwd
     * @return
     */

    public User findByPhoneAndPwd(String phone, String md5pwd) {

        String sql = "select * from user where phone=? and pwd=?";

        User user = null;

        try{

            user = queryRunner.query(sql,new BeanHandler<>(User.class,processor),phone,md5pwd);

        }catch (Exception e){
            e.printStackTrace();
        }

        return user;
    }


    /**
     *
     * 查询用户条数
     */

    public  int findUserCount(){
        String sql = "select count(*) from user ";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }


    public  int updateUserPhoneAndUsername(int id ,String phone ,String username) throws Exception {
        String sql = "update user set username=?,phone=? where id=?";
        Object[] params = {
                username,phone,id
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

    public List<User> findUserPage() {

        String sql = "select * from user ";

        List<User> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(User.class,processor));
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }





    public int findNeedUserCount(String phone) {

        String sql = "select count(*) from user where phone=? ";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>(),phone);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }

    public int updatePwd(String phone,String pwd) throws Exception {
        String sql = "update user set pwd=?  where phone=?";
        Object[] params = {
                 pwd , phone
        };

        int i;
        try {
            i = queryRunner.update(sql, params);


        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        }
        return i;
    }

    public int countTotalUserAll() {

        String sql = "select count(*) from user where `delete`=0";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }

    public List<User> findListAll( int from, int pageSize) {

        String sql = "select * from user where `delete`=0 order by create_time desc limit ?,?";

        List<User> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(User.class,processor),from,pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public int deleteUser(int id){
        int count = 0;
        String sql = "delete  from user where id=? ";

        try {
            count =  queryRunner.update(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;

    }


    public int deleteAll(String condition){
        int count = 0;
        String sql="delete from user where id  in("+condition+")";
        try {
            count =  queryRunner.update(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;

    }

    public List<User> findAllUser(){
        String sql = "select * from user ";

        List<User> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(User.class,processor));
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }



    public List<User> FindUserId(int Id) {

        String sql = "select * from user where id=? ";

        List<User> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(User.class,processor),Id);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int addrelation(int youid, int loginuser) throws Exception {
        String sql = "insert into user_relation (user_id,follower_id,relation_type) values(?,?,1)";

        int i ;
        try{
            i = queryRunner.update(sql,loginuser,youid);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception();
        }
        return i;
    }


    public int addfollower(int youid, int loginuser) throws Exception {
        String sql = "insert into user_relation (user_id,follower_id,relation_type) values(?,?,2)";

        int i ;
        try{
            i = queryRunner.update(sql,youid,loginuser);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception();
        }
        return i;
    }

    @Override
    public int if_follower(int youid, int loginuser) throws Exception {
//        SELECT * FROM user_relation WHERE user_id=1 and follower_id=3 AND relation_type=1

        String sql = "SELECT count(*) FROM user_relation WHERE relation_type=1 and user_id=? and follower_id=?  ";

        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>(),loginuser,youid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();

    }

    @Override
    public int derelation(int youid, int loginuser) throws Exception {
        int count = 0;
        String sql="delete from user_relation where  relation_type=1 and user_id=? and follower_id=?";
        try {
            count =  queryRunner.update(sql,loginuser,youid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    @Override
    public int defollower(int youid, int loginuser) throws Exception {

        int count = 0;
        String sql="delete from user_relation where  relation_type=2 and user_id=? and follower_id=?";
        try {
            count =  queryRunner.update(sql,youid,loginuser);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    @Override
    public int postTalk(int loginuser, int youid,String connent) throws Exception {
        String sql = "insert into speak (send_id,receiver_id,connent) values(?,?,?)";

        int i ;
        try{
            i = queryRunner.update(sql,loginuser,youid,connent);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception();
        }
        return i;
    }

    @Override
    public List<Relation> findMyFance(int my) {
        String sql = "SELECT follower_id FROM user_relation WHERE  relation_type=2 and user_id=?";

        List<Relation> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Relation.class,processor),my);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Relation> findMyFollower(int my) {
        String sql = "SELECT user_id FROM user_relation WHERE  relation_type=2 and follower_id=?";

        List<Relation> list = null;
        try{
            list = queryRunner.query(sql,new BeanListHandler<>(Relation.class,processor),my);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int MyFanceCount(int my) {
        String sql = "SELECT count(follower_id) FROM user_relation WHERE  relation_type=2 and user_id=?";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>(),my);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count.intValue();
    }

    @Override
    public int MyFollowerCount(int my) {
        String sql = "SELECT count(user_id) FROM user_relation WHERE  relation_type=2 and follower_id=?";
        Long count = null;
        try {
            count =  (Long)queryRunner.query(sql,new ScalarHandler<>(),my);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count.intValue();
    }


}
