package net.flyclass.forum.dao;

import net.flyclass.forum.domain.Relation;
import net.flyclass.forum.domain.User;

import java.util.List;

public interface UserDaoSerivce {
    public int save(User user) throws Exception;
    public int updateUser(User user,int id) throws Exception;
    public User findByPhoneAndPwd(String phone, String md5pwd);
    public  int findUserCount();
    public  int updateUserPhoneAndUsername(int id ,String phone ,String username) throws Exception;
    public List<User> findUserPage();
    public int findNeedUserCount(String phone);
    public int updatePwd(String phone,String pwd) throws Exception;
    public int countTotalUserAll();
    public List<User> findListAll( int from, int pageSize);
    public int deleteUser(int id);
    public int deleteAll(String condition);
    public List<User> findAllUser();
    public List<User> FindUserId(int Id);
    public int addrelation(int youid, int loginuser) throws Exception;
    public int addfollower(int youid, int loginuser) throws Exception;
    public int if_follower(int youid,int loginuser)  throws Exception;

    public int derelation(int youid, int loginuser) throws Exception;
    public int defollower(int youid, int loginuser) throws Exception;
    public int postTalk(int loginuser, int youid,String connent) throws Exception;
    public List<Relation> findMyFance(int my);
    public List<Relation> findMyFollower(int my);
    public int MyFanceCount(int my);
    public int MyFollowerCount(int my);

}
