package net.flyclass.forum.service;

import net.flyclass.forum.domain.Relation;
import net.flyclass.forum.domain.User;
import net.flyclass.forum.dto.PageDTO;

import java.util.List;

public interface UserService {

    int register(User user);
    int adminregister(User user);
    int updateUser(User user,int id);
    PageDTO<User> listUserPageAll(int page, int pageSize);
    int deleteUser(int id);
    int deleteAll(String content);

    int updateUserPhoneAndUsername(int id,String phone,String username) throws Exception;

    int findNeedUserCount(String phone);
    int findUserCount();

    int updatePwd(String phone,String pwd) throws Exception;
    int repassword(User user);
    List<User> list();
    List<User> findAllUser();

    List<Relation> findMyFance(int my);
    List<Relation> findMyFollower(int my);

    int MyFanceCount(int my);
    int MyFollowerCount(int my);


    List<User> FindUserId(int Id);

    int addrelation(int youid,int loginuser) throws Exception;
    int addfollower(int youid, int loginuser) throws Exception;

    int derelation(int youid,int loginuser) throws Exception;
    int defollower(int youid, int loginuser) throws Exception;


    int if_follower(int youid,int loginuser) throws Exception;


    int postTalk(int loginuser,int youid,String connent) throws Exception;

    User login(String phone, String pwd);
}
