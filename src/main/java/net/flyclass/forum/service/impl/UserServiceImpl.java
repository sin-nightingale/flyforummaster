package net.flyclass.forum.service.impl;

import net.flyclass.forum.dao.impl.UserDao;
import net.flyclass.forum.domain.Relation;
import net.flyclass.forum.dto.PageDTO;
import net.flyclass.forum.service.UserService;
import net.flyclass.forum.domain.User;
import net.flyclass.forum.util.CommonUtil;

import java.util.Date;
import java.util.List;
import java.util.Random;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDao();


    @Override
    public List<User> FindUserId(int id) {
        return userDao.FindUserId(id);
    }

    @Override
    public int addrelation(int youid, int loginuser) throws Exception {
        return userDao.addrelation(youid,loginuser);
    }

    @Override
    public int addfollower(int youid, int loginuser) throws Exception {
        return userDao.addfollower(youid,loginuser);
    }

    @Override
    public int derelation(int youid, int loginuser) throws Exception {
        return userDao.derelation(youid,loginuser);
    }

    @Override
    public int defollower(int youid, int loginuser) throws Exception {
        return userDao.defollower(youid,loginuser);
    }

    @Override
    public int if_follower(int youid, int loginuser) throws Exception {
        return userDao.if_follower(youid,loginuser);
    }

    @Override
    public int postTalk(int loginuser, int youid,String connent) throws Exception {
        return userDao.postTalk(loginuser, youid,connent);
    }

    @Override
    public int register(User user) {

        user.setRole(1);
        user.setSex(1);
        user.setCreateTime(new Date());
        user.setImg(getRandomImg());

        user.setPwd( CommonUtil.MD5(user.getPwd()) );

        try {
           return userDao.save(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }



    @Override
    public int adminregister(User user) {

        user.setCreateTime(new Date());
        user.setImg(getRandomImg());

        user.setPwd( CommonUtil.MD5(user.getPwd()) );

        try {
            return userDao.save(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int updateUser(User user,int id) {
        user.setUsername(user.getUsername());
        user.setPhone(user.getPhone());
        user.setPwd(CommonUtil.MD5(user.getPwd()));
        user.setSex(user.getSex());
        user.setRole(user.getRole());
        try {
            return userDao.updateUser(user,id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public PageDTO<User> listUserPageAll(int page, int pageSize) {
        //查询总记录数
        int totalRecordNum = userDao.countTotalUserAll();

        int from = (page-1) * pageSize;

        //分页查询
        List<User> userList =  userDao.findListAll(from,pageSize);

        PageDTO<User> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(userList);

        return pageDTO;
    }

    @Override
    public int deleteUser(int id) {
        return userDao.deleteUser(id);
    }

    @Override
    public int deleteAll(String content) {
        return userDao.deleteAll(content);
    }

    @Override
    public int updateUserPhoneAndUsername(int id,String phone, String username) throws Exception {
        return userDao.updateUserPhoneAndUsername(id,phone,username);
    }

    @Override
    public int findNeedUserCount(String phone) {
        return userDao.findNeedUserCount(phone);
    }


    @Override
    public int repassword(User user) {
        return 0;
    }

    @Override
    public List<User> list() {
        return userDao.findUserPage();
    }

    @Override
    public List<User> findAllUser() {
        return userDao.findAllUser();
    }

    @Override
    public List<Relation> findMyFance(int my) {
        return userDao.findMyFance(my);
    }

    @Override
    public List<Relation> findMyFollower(int my) {
        return userDao.findMyFollower(my);
    }

    @Override
    public int MyFanceCount(int my) {
        return userDao.MyFanceCount(my);
    }

    @Override
    public int MyFollowerCount(int my) {
        return userDao.MyFollowerCount(my);
    }

    public int findUserCount(){
        return userDao.findUserCount();
    }

    @Override
    public int updatePwd(String phone, String pwd) throws Exception {
        return userDao.updatePwd(phone,CommonUtil.MD5(pwd));
    }


    @Override
    public User login(String phone, String pwd) {

        String md5pwd = CommonUtil.MD5(pwd);

        User user = userDao.findByPhoneAndPwd(phone,md5pwd);

        return user;
    }


    /**
     * 放在CDN上的随机头像
     */
    private static final String [] headImg = {
            "https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/16218212686675093.jpg",
            "https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/16218212847645048.jpg",
            "https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/5416142845ce3ec630541197568142f3.jpeg",
            "https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/7c2a556066c1419587f1397f41e60531.jpeg",
            "http://yun.flyskill.cn/view.php/2502ae6ec1d247ef9af689a2d1b9c195.jpeg",
            "http://yun.flyskill.cn/view.php/afabef4535c467e3051e3f535a09a4de.jpeg"
    };

    private String getRandomImg(){
        int size =  headImg.length;
        Random random = new Random();
        int index = random.nextInt(size);
        return headImg[index];
    }
}
