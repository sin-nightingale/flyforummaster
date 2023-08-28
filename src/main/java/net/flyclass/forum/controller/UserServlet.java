package net.flyclass.forum.controller;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import net.flyclass.forum.domain.Relation;
import net.flyclass.forum.domain.Topic;
import net.flyclass.forum.service.TopicService;
import net.flyclass.forum.service.UserService;
import net.flyclass.forum.domain.User;
import net.flyclass.forum.service.impl.TopicServiceImpl;
import net.flyclass.forum.service.impl.UserServiceImpl;
import net.flyclass.forum.util.MoblieCode;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "userServlet",urlPatterns = {"/user"})
public class UserServlet extends BaseServlet {


    private UserService userService = new UserServiceImpl();
    private TopicService topicService=new TopicServiceImpl();
    public String code;


    /**
     *
     * http://localhost:8080/user?method=login
     *
     * @param request
     * @param response
     */
    public void login(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");

        User user = userService.login(phone,pwd);

        if(user != null){
            request.getSession().setAttribute("loginUser",user);
            //跳转页面
            response.sendRedirect("/fly_forum_master_war/topic?method=list&c_id=1");
        }else {
            request.setAttribute("msg","用户名或者密码不正确");
            request.getRequestDispatcher("/user/login.jsp").forward(request,response);
        }

    }






        /**
         * http://localhost:8080/user?method=register
         * @param request
         * @param response
         */
    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = new User();
        Map<String,String[]> map = request.getParameterMap();

        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        int i = userService.register(user);

        if(i>0){
            //注册成功，跳转到登录界面
            request.getRequestDispatcher("/user/login.jsp").forward(request,response);
        }else {
            //注册失败，跳转到注册页面
            request.getRequestDispatcher("/user/register.jsp").forward(request,response);
        }


    }


    public void youhome(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int id=Integer.parseInt(request.getParameter("id"));
        int loginuser=Integer.parseInt(request.getParameter("loginuser"));
        String login=request.getParameter("loginuser");
        String isfollow;

        System.out.println("login"+login);


        if ( login.length()<=0) {
            request.getRequestDispatcher("/user/login.jsp").forward(request,response);
        }

        List<User> users= userService.FindUserId(id);
        List<User> user= userService.findAllUser();


        List<Topic> topics=topicService.findTopicById(id);

        request.setAttribute("userList",users);
        request.setAttribute("topicList",topics);

        int i=userService.if_follower(id,loginuser);

        if(i>0){
            isfollow="取消关注";
        }else{
            isfollow="添加关注";
        }

        List<Relation> fance=userService.findMyFance(id);
        List<Relation> follower=userService.findMyFollower(id);


        int countfans=userService.MyFanceCount(id);
        int countfollower=userService.MyFollowerCount(id);


        request.setAttribute("countfans",countfans);
        request.setAttribute("countfollower",countfollower);

        request.setAttribute("fanceList",fance);

        System.out.println("fanceList"+fance);

        request.setAttribute("followerList",follower);
        request.setAttribute("usersList",user);



        request.setAttribute("isfollow",isfollow);
        request.getRequestDispatcher("/user/home.jsp").forward(request,response);

    }


    public void getRelation(HttpServletRequest request,HttpServletResponse response) throws Exception {

        //我的关注：SELECT user_id FROM user_relation WHERE follower_id=1 and relation_type=2
        //我的粉丝：SELECT follower_id FROM user_relation WHERE user_id=1 and relation_type=2
        int loginuser=Integer.parseInt(request.getParameter("loginuser"));
        List<Relation> fance=userService.findMyFance(loginuser);
        List<Relation> follower=userService.findMyFollower(loginuser);
        List<User> users= userService.findAllUser();

        request.setAttribute("fanceList",fance);

        System.out.println("fanceList"+fance);

        request.setAttribute("followerList",follower);
        request.setAttribute("userList",users);
        request.getRequestDispatcher("/user/userfans.jsp").forward(request,response);




    }



    public void qxfollower(HttpServletRequest request,HttpServletResponse response) throws Exception {

        int youid=Integer.parseInt(request.getParameter("youid"));
        int loginuser=Integer.parseInt(request.getParameter("loginuser"));
        userService.defollower(youid,loginuser);
        userService.derelation(youid,loginuser);
        request.getRequestDispatcher("/home.jsp").forward(request,response);
    }

    public void gzfollower(HttpServletRequest request,HttpServletResponse response) throws Exception {

        int youid=Integer.parseInt(request.getParameter("youid"));
        int loginuser=Integer.parseInt(request.getParameter("loginuser"));
        userService.addrelation(youid,loginuser);
        userService.addfollower(youid,loginuser);
        request.getRequestDispatcher("/home.jsp").forward(request,response);
    }


    public void relation(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int youid=Integer.parseInt(request.getParameter("youid"));
        int loginuser=Integer.parseInt(request.getParameter("loginuser"));
        String isfollow="";

        System.out.println("youid="+youid+" loginuser= "+loginuser);
//        userService.addrelation(youid,loginuser);
//        userService.addfollower(youid,loginuser);

        int i=userService.if_follower(youid,loginuser);
        if(i>0){
            isfollow="添加关注";
            userService.defollower(youid,loginuser);
            userService.derelation(youid,loginuser);


        }else {
            isfollow="取消关注";
                 userService.addrelation(youid,loginuser);
                 userService.addfollower(youid,loginuser);

        }



        List<Relation> fance=userService.findMyFance(youid);
        List<Relation> follower=userService.findMyFollower(youid);
        List<User> users= userService.findAllUser();

        request.setAttribute("fanceList",fance);

        System.out.println("fanceList"+fance);

        request.setAttribute("followerList",follower);
        request.setAttribute("userList",users);


        request.setAttribute("isfollow",isfollow);
        request.getRequestDispatcher("/home.jsp").forward(request,response);





    }


    public void talk(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int youid=Integer.parseInt(request.getParameter("youid"));;
        int loginuser=Integer.parseInt(request.getParameter("loginuser"));


        List<User> you= userService.FindUserId(youid);
        List<User> lo= userService.FindUserId(loginuser);

        request.setAttribute("youList",you);
        request.setAttribute("myList",lo);





        request.getRequestDispatcher("/talk/index.jsp").forward(request,response);

    }

    public void talks(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int youid=Integer.parseInt(request.getParameter("youid"));;
        int loginuser=Integer.parseInt(request.getParameter("loginuser"));
        String text=request.getParameter("text");

        List<User> you= userService.FindUserId(youid);
        List<User> lo= userService.FindUserId(loginuser);

        request.setAttribute("youList",you);
        request.setAttribute("myList",lo);

        userService.postTalk(loginuser,youid,text);



        request.getRequestDispatcher("/talk/index.jsp").forward(request,response);

    }








    public void MoblieCode(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String phone=request.getParameter("phone");
        MoblieCode.setNewcode();
        code = Integer.toString(MoblieCode.getNewcode());
        SendSmsResponse sendSms =MoblieCode.sendSms(phone,code);
        System.out.println("login验证码测试："+code);

    }

    public void forgetpass(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");

        userService.updatePwd(phone,pwd);

        request.getRequestDispatcher("/user/login.jsp").forward(request,response);

    }





    public void updateUserPhoneAndUsername(HttpServletRequest request,HttpServletResponse response) throws Exception {


        int user;

       user= Integer.parseInt(request.getParameter("id"));
        String phone =request.getParameter("phone");
        String username=request.getParameter("username");

       System.out.println("user= "+user+" phone "+ phone+" usernmae="+username);



       if(userService.updateUserPhoneAndUsername(user,phone,username)>0){

           login( request, response);
           System.out.println("更新成功");
       }else {
           System.out.println("更新失败");
       }

    }


    public void updatePwd(HttpServletRequest request,HttpServletResponse response) throws Exception {


        String phone = request.getParameter("phone");


        String pwd =request.getParameter("oldpwd");

        String newpwd =request.getParameter("newpwd");


        User user = userService.login(phone,pwd);




        if(user != null){
          System.out.println("原始密码正确");
            if(userService.updatePwd(phone,newpwd)>0){
                request.setAttribute("msg", "success");
                request.getRequestDispatcher("/user/userpsw.jsp").forward(request,response);
            }else{
                request.setAttribute("msg", "error1");
                request.getRequestDispatcher("/user/userpsw.jsp").forward(request,response);
            }


        }else {
            request.setAttribute("msg", "error");
            request.getRequestDispatcher("/user/userpsw.jsp").forward(request,response);
        }













    }







    /**
     *  http://localhost:8080/user?method=logout
     * 退出登录
     * @param request
     * @param response
     */
    public void  logout(HttpServletRequest request,HttpServletResponse response) throws IOException {

        request.getSession().invalidate();

        response.sendRedirect("/fly_forum_master_war/topic?method=list&c_id=1");
    }




    public void  userhome(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        int id= Integer.parseInt(request.getParameter("id"));

//        List<User> users=userService.FindUserId(id);
        List<Topic> topics=topicService.findTopicById(id);

//        System.out.println("主题"+topics);

        request.setAttribute("topicList",topics);

        request.getRequestDispatcher("/user/userhome.jsp").forward(request,response);

    }


    public void  usertitle(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        int id= Integer.parseInt(request.getParameter("id"));

//        List<User> users=userService.FindUserId(id);
        List<Topic> topics=topicService.findTopicById(id);

//        System.out.println("主题"+topics);

        request.setAttribute("topicList",topics);

        request.getRequestDispatcher("/user/usertitle.jsp").forward(request,response);

    }














}
