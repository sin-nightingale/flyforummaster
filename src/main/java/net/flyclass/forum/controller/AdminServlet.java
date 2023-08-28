package net.flyclass.forum.controller;

import net.flyclass.forum.domain.*;
import net.flyclass.forum.dto.PageDTO;
import net.flyclass.forum.factory.serviceFactory;
import net.flyclass.forum.service.*;
import net.flyclass.forum.service.impl.*;
import net.flyclass.forum.util.httpClientList;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@WebServlet(name = "adminServlet",urlPatterns = {"/admin"})
public class AdminServlet extends BaseServlet {
    //默认分页为：8
    private static final int pageSize = 8;

    private UserService userService = new UserServiceImpl();
    private CategoryService categoryService=new CategoryServiceImpl();
    private TopicService topicService=new TopicServiceImpl();
    private ReplyService replyService=new ReplyServiceImpl();
    private BannerService bannerService=new BannerServiceImpl();

    /**
     * http://localhost:8080/admin?method=login
     *
     */

    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");

        User user = userService.login(phone,pwd);


        if(user != null){

            request.getSession().setAttribute("loginUser",user);

            if (user.getRole()==2){
                /**
                 * list--> user
                 * list1-->category
                 * list2-->topic
                 * list3-->reply
                 */

                /**
                 *
                 * userLiset
                 *
                 */
                int usercount=0;
                int categorycount=0;
                int topiccount=0;
                int replycount=0;

                List<User> list =  userService.list();
                usercount=userService.findUserCount();

                topiccount=topicService.findTopicCount();
                categorycount=categoryService.findCategoryCount();
                replycount=replyService.findReplyCount();


                //用户数量统计
                request.getSession().setAttribute("userCount",usercount);
                request.getSession().setAttribute("topiccount",topiccount);
                request.getSession().setAttribute("replycount",replycount);
                request.getSession().setAttribute("categorycount",categorycount);
                //用户列表输出
                request.getSession().setAttribute("userList",list);


                /**
                 *
                 * topicList
                 *
                 */
                List<Topic> list2=topicService.list();

                request.getSession().setAttribute("topicList",list2);


                /**
                 *
                 * categoryList
                 *
                 */

                List<Category> list1=categoryService.list();
                request.getSession().setAttribute("categoryList",list1);

                /**
                 *
                 * replyList
                 *
                 */

                List<Reply> list3=replyService.list();
                request.getSession().setAttribute("replyList",list3);


                /**
                 *
                 * topic 分页
                 *
                 */
                //默认第一页
                int page=1;

                String currentPage = request.getParameter("page");

                if(currentPage !=null && currentPage !=""){
                    page = Integer.parseInt(currentPage);
                }



                PageDTO<Topic> topicPageDTO =  topicService.listTopicPageAll(page,pageSize);
                PageDTO<User>  userPageDTO =userService.listUserPageAll(page,pageSize);
                PageDTO<Reply>  replyPageDTO =replyService.listReplyPageAll(page,pageSize);
                PageDTO<Category>  categoryPageDTO =categoryService.listCategoryPageAll(page,pageSize);
                PageDTO<Banner>  bannerPageDTO =bannerService.listBannerPageAll(page,pageSize);


                request.getSession().setAttribute("topicPage" ,topicPageDTO);
                request.getSession().setAttribute("userPage" ,userPageDTO);
                request.getSession().setAttribute("replyPage" ,replyPageDTO);
                request.getSession().setAttribute("categoryPage" ,categoryPageDTO);
                request.getSession().setAttribute("bannerPage" ,bannerPageDTO);




                request.getRequestDispatcher("/admin/index.jsp").forward(request,response);


            }

        }else {

            request.setAttribute("msg","用户名或者密码不正确");
            request.getRequestDispatcher("/admin/login.jsp").forward(request,response);

        }

    }
    public void  logout(HttpServletRequest request,HttpServletResponse response) throws IOException {

        request.getSession().invalidate();

        response.sendRedirect("/admin/login.jsp");
    }


    public void updateIndex(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int usercount=0;
        int categorycount=0;
        int topiccount=0;
        int replycount=0;

        List<User> list =  userService.list();
        usercount=userService.findUserCount();

        topiccount=topicService.findTopicCount();
         categorycount=categoryService.findCategoryCount();
        replycount=replyService.findReplyCount();


        //用户数量统计
        request.getSession().setAttribute("userCount",usercount);
        request.getSession().setAttribute("topiccount",topiccount);
        request.getSession().setAttribute("replycount",replycount);
        request.getSession().setAttribute("categorycount",categorycount);

        //用户列表输出
        request.getSession().setAttribute("userList",list);
        request.getRequestDispatcher("/admin/index_v1.jsp").forward(request,response);











    }

    public void userdown(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<User> userList=userService.findAllUser();

//        CommonExcel excel=new CommonExcel();
//
//        excel.Stuinf_Excel(userList);
        request.getRequestDispatcher("/admin/usertable.jsp").forward(request, response);


    }





    public void topicgather(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User loginUser = (User)request.getSession().getAttribute("loginUser");
        if(loginUser == null){
            request.setAttribute("msg","请登录");
            response.sendRedirect("/user/login.jsp");
            return;
            //页面跳转 TODO
        }

        int c_id = Integer.parseInt(request.getParameter("c_id"));
        String add = request.getParameter("add");

        httpClientList httpClientList=new httpClientList();
        String title=httpClientList.getTitle(add);
        String body=httpClientList.getBody(add);

        topicService.addTopic(loginUser,title,body,c_id);

        topicPage(request,response);


    }







    public void addcategory(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        /**
         *
         * 1.判断是否存在概分类（存在msg 注册失败 返回原页面）
         * 2.注册成功 执行添加分类
         *
         */

        Category category=new Category();

        Map<String, String[]> map = request.getParameterMap();

        try {
            BeanUtils.populate(category, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        /**
         *
         * 1.判断
         */
        int i=categoryService.addcatory(category);



            if (i > 0) {
                //注册成功，跳转到登录界面
                request.setAttribute("msg", "添加成功");
                request.getRequestDispatcher("/admin/addcategory.jsp").forward(request, response);
            } else {
                //注册失败，跳转到注册页面
                request.setAttribute("msg", "添加失败");
            }





    }



    public void addbanner(HttpServletRequest request, HttpServletResponse response) throws Exception {

        /**
         *
         * 1.判断是否存在概分类（存在msg 注册失败 返回原页面）
         * 2.注册成功 执行添加分类
         *
         */

        String title = request.getParameter("title");
        String bannerImg = request.getParameter("bannerImg");
        String goHref = request.getParameter("goHref");
        int isShow = Integer.parseInt(request.getParameter("isShow"));



        System.out.println("title"+title+"bannerImg"+bannerImg+"goHref"+goHref+"isShow"+isShow);




        /**
         *
         * 1.判断
         */
        int i=bannerService.addbanner(title,bannerImg,goHref,isShow);



        if (i > 0) {
            //注册成功，跳转到登录界面
            request.setAttribute("msg", "添加成功");
            request.getRequestDispatcher("/admin/addBanner.jsp").forward(request, response);
        } else {
            //注册失败，跳转到注册页面
            request.setAttribute("msg", "添加失败");
            request.getRequestDispatcher("/admin/addBanner.jsp").forward(request, response);

        }





    }





    public void adminregister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = new User();
        String phone = request.getParameter("phone");
        Map<String, String[]> map = request.getParameterMap();

        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        /**
         *
         * 1.判断
         */
        int k=userService.findNeedUserCount(phone);
        if (k>1){
            request.setAttribute("msg", "注册失败");
            request.getRequestDispatcher("/admin/adduser.jsp").forward(request, response);
        }else{
            int i = userService.adminregister(user);

            if (i > 0) {
                //注册成功，跳转到登录界面
                request.setAttribute("msg", "注册成功");
                int page=1;
                String currentPage = request.getParameter("page");
                if(currentPage !=null && currentPage !=""){
                    page = Integer.parseInt(currentPage);
                }
                PageDTO<User> userPageDTO=userService.listUserPageAll(page,pageSize);
                request.getSession().setAttribute("userPage" ,userPageDTO);
                request.getRequestDispatcher("/admin/adduser.jsp").forward(request, response);
            } else {
                //注册失败，跳转到注册页面
                request.setAttribute("msg", "注册失败");
                request.getRequestDispatcher("/admin/adduser.jsp").forward(request, response);
            }

        }

    }



    /**
     *
     * 通过user的id来删除数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        int id=Integer.parseInt(request.getParameter("id"));

        int istrue=0;
        istrue=userService.deleteUser(id);
        if(istrue>0) {
            userPage(request,response);
            request.getRequestDispatcher("/admin/usertable.jsp").forward(request, response);
        }


    }

    public String getCheckAll(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String condition="";
        try{
            String ids[]=request.getParameterValues("checkAll");
            int i=0;

            for(i=0;i<ids.length;i++){
                condition+=ids[i];
                if(i!=ids.length-1) condition+=",";
            }
        }catch(Exception e){

        }
        System.out.print("checkall  ooooooo"+condition);
        return condition;
    }



    public void deleteAll(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        response.setBufferSize(1298);
        String condition="";
        condition=getCheckAll(request,response);
        int istrue=0;
        istrue=userService.deleteAll(condition);
        if(istrue>0) {
         userPage(request,response);
//            request.getRequestDispatcher("/admin/usertable.jsp").forward(request, response);
        }


    }

    public void deleteAllCategory(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        response.setBufferSize(1298);
        String condition="";

        condition=getCheckAll(request,response);

        int istrue=0;
        istrue=categoryService.deleteAll(condition);
        if(istrue>0) {
            categoryPage(request,response);
//            request.getRequestDispatcher("/admin/usertable.jsp").forward(request, response);
        }


    }


    public void TopicdeleteAll(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        response.setBufferSize(1298);
        String condition="";
        condition=getCheckAll(request,response);

        if(condition==""){
            topicPage(request,response);
        }

        int istrue=0;
        istrue=topicService.deleteAll(condition);
        if(istrue>0) {
            topicPage(request,response);
//            request.getRequestDispatcher("/admin/usertable.jsp").forward(request, response);
        }


    }


    public void ReplydeleteAll(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        response.setBufferSize(1298);
        String condition="";
        condition=getCheckAll(request,response);

        if(condition==""){
            replyPage(request,response);
        }

        int istrue=0;
        istrue=replyService.deleteAll(condition);
        if(istrue>0) {
            replyPage(request,response);
//            request.getRequestDispatcher("/admin/usertable.jsp").forward(request, response);
        }


    }





    public void FindUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int page=1;

        response.setBufferSize(512);


        int id=Integer.parseInt(request.getParameter("userid"));


        List<User> list = userService.FindUserId(id);

        request.getSession().setAttribute("isMyId",list);

        request.getRequestDispatcher("/admin/uploadtable/uploaduser.jsp").forward(request, response);

    }


    public void FindCategoryId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int page=1;

        response.setBufferSize(512);


        int id=Integer.parseInt(request.getParameter("categoryid"));


        Category category = categoryService.findById(id);

        request.getSession().setAttribute("isCategory",category);
        request.getSession().setAttribute("categoryList",categoryService.list());

        System.out.println("分类信息读取："+category);



        request.getRequestDispatcher("/admin/uploadtable/uploadcategory.jsp").forward(request, response);


    }



    public void FindBannerId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int page=1;

        response.setBufferSize(512);


        int id=Integer.parseInt(request.getParameter("bannerid"));



        Banner banner=bannerService.findById(id);

        request.getSession().setAttribute("isBanner",banner);
        request.getSession().setAttribute("bannerList",bannerService.findAllBanner());


        System.out.println("isBanner"+banner);







        request.getRequestDispatcher("/admin/uploadtable/uploadbanner.jsp").forward(request, response);


    }



    public void FindTopicId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int page=1;

        response.setBufferSize(512);


        int id=Integer.parseInt(request.getParameter("topicid"));


        Topic topic = topicService.findById(id);

        request.getSession().setAttribute("isTopic",topic);
        request.getSession().setAttribute("categoryList",categoryService.list());



        request.getRequestDispatcher("/admin/uploadtable/uploadtopic.jsp").forward(request, response);

    }

    /**
     *
     *
     * 下面是后台全部分页模块
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */


    public void userPage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//        response.setBufferSize(128);
        int page=1;
        String currentPage = request.getParameter("page");
        if(currentPage !=null && currentPage !=""){
            page = Integer.parseInt(currentPage);
        }
        PageDTO<User> userPageDTO=userService.listUserPageAll(page,pageSize);
        request.getSession().setAttribute("userPage" ,userPageDTO);
        request.getRequestDispatcher("/admin/usertable.jsp").forward(request,response);
    }

    public void replyPage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int page=1;
        String currentPage = request.getParameter("page");
        if(currentPage !=null && currentPage !=""){
            page = Integer.parseInt(currentPage);
        }
        PageDTO<Reply> replyPageDTO=replyService.listReplyPageAll(page,pageSize);
        request.getSession().setAttribute("replyPage" ,replyPageDTO);
        request.getRequestDispatcher("/admin/replytable.jsp").forward(request,response);
    }


    public void categoryPage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int page=1;
        String currentPage = request.getParameter("page");
        if(currentPage !=null && currentPage !=""){
            page = Integer.parseInt(currentPage);
        }
        PageDTO<Category> categoryPageDTO=categoryService.listCategoryPageAll(page,pageSize);
        request.getSession().setAttribute("categoryPage" ,categoryPageDTO);
        request.getRequestDispatcher("/admin/categorytable.jsp").forward(request,response);
    }

    public void topicPage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int page=1;
        String currentPage = request.getParameter("page");
        if(currentPage !=null && currentPage !=""){
            page = Integer.parseInt(currentPage);
        }
        PageDTO<Topic> TopicpageDTO =  topicService.listTopicPageAll(page,pageSize);
        request.getSession().setAttribute("topicPage" ,TopicpageDTO);
        request.getRequestDispatcher("/admin/topictable.jsp").forward(request,response);
    }

    public void bannerPage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int page=1;
        String currentPage = request.getParameter("page");
        if(currentPage !=null && currentPage !=""){
            page = Integer.parseInt(currentPage);
        }
        PageDTO<Banner> BannerpageDTO =  bannerService.listBannerPageAll(page,pageSize);
        request.getSession().setAttribute("banerPage" ,BannerpageDTO);
        request.getRequestDispatcher("/admin/bannertable.jsp").forward(request,response);
    }



    public void uploadUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException  {
        User user = new User();
        int id=Integer.parseInt(request.getParameter("id"));
        String username=request.getParameter("username");
        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");
        String sex = request.getParameter("sex");
        String role = request.getParameter("role");

        Map<String, String[]> map = request.getParameterMap();

        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        int i=0;
        i=userService.updateUser(user,id);
        if (i>0){
            userPage(request,response);
//            request.getRequestDispatcher("/admin/usertable.jsp").forward(request,response);
        }
    }

    public void uploadTopic(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Topic topic = new Topic();
        int id=Integer.parseInt(request.getParameter("id"));
        int c_id=Integer.parseInt(request.getParameter("cId"));
        String title = request.getParameter("title");
        int pv=Integer.parseInt(request.getParameter("pv"));
        int user_id=Integer.parseInt(request.getParameter("userId"));
        int hot=Integer.parseInt(request.getParameter("hot"));
//        System.out.print("update:c_id"+c_id+" title:"+title+" pv"+pv+" user_id:"+user_id+" hot:"+hot);
        Map<String, String[]> map = request.getParameterMap();

        try {
            BeanUtils.populate(topic, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        int i=0;


        i=topicService.updateTopic(topic,id);
        if (i>0){
            topicPage(request,response);
//            request.getRequestDispatcher("/admin/usertable.jsp").forward(request,response);
        }
    }


    public void uploadReply(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Reply reply = new Reply();
        int id=Integer.parseInt(request.getParameter("id"));
        int topic_id=Integer.parseInt(request.getParameter("topic_id"));
        int floor=Integer.parseInt(request.getParameter("floor"));;
        String content = request.getParameter("content");
        int user_id=Integer.parseInt(request.getParameter("user_id"));

        Map<String, String[]> map = request.getParameterMap();

        try {
            BeanUtils.populate(reply, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
//        System.out.print("update:topic_id"+topic_id+" floor:"+floor+" content"+content+" user_id:"+user_id);
        int i=0;
        i=replyService.updateReply(reply,id);
        if (i>0){
            topicPage(request,response);
//            request.getRequestDispatcher("/admin/usertable.jsp").forward(request,response);
        }
    }


    public void uploadCategory(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Category category = new Category();
        int id=Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int weight=Integer.parseInt(request.getParameter("weight"));

        Map<String, String[]> map = request.getParameterMap();

        try {
            BeanUtils.populate(category, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
//        System.out.print("update:name"+name+" weight:"+weight);
        int i=0;
        i=categoryService.updateCategory(category,id);
        if (i>0){
            categoryPage(request,response);
//            request.getRequestDispatcher("/admin/usertable.jsp").forward(request,response);
        }
    }


    public void uploadBanner(HttpServletRequest request,HttpServletResponse response) throws Exception {
        Banner banner = new Banner();
        int id=Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String bannerImg = request.getParameter("bannerImg");
        String goHref = request.getParameter("goHref");
        int isShow = Integer.parseInt(request.getParameter("isShow"));
        int i=0;
        banner.setTitle(title);
        banner.setBannerImg(bannerImg);
        banner.setGoHref(goHref);
        banner.setIsShow(isShow);


        System.out.println("title:"+title+"bannerimg"+bannerImg+"goherf"+goHref+"isshow"+isShow+"id"+id);


        i=bannerService.updateBanner(banner,id);





        if (i>0){
            bannerPage(request,response);
//            request.getRequestDispatcher("/admin/usertable.jsp").forward(request,response);
        }
    }

}
