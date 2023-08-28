package net.flyclass.forum.controller;


import net.flyclass.forum.domain.Banner;
import net.flyclass.forum.service.BannerService;
import net.flyclass.forum.service.CategoryService;
import net.flyclass.forum.service.TopicService;
import net.flyclass.forum.service.UserService;
import net.flyclass.forum.service.impl.BannerServiceImpl;
import net.flyclass.forum.service.impl.CategoryServiceImpl;
import net.flyclass.forum.domain.Reply;
import net.flyclass.forum.domain.Topic;
import net.flyclass.forum.domain.User;
import net.flyclass.forum.dto.PageDTO;
import net.flyclass.forum.service.impl.TopicServiceImpl;
import net.flyclass.forum.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "topicServlet",urlPatterns = {"/topic"})
public class TopicServlet extends BaseServlet {



    private TopicService topicService = new TopicServiceImpl();
    private UserService userService=new UserServiceImpl();
    private BannerService bannerService=new BannerServiceImpl();


    private CategoryService categoryService = new CategoryServiceImpl();

    /**
     * 默认分页大小
     */
    private static final int pageSize = 8;

    /**
     * http://localhost:8080/topic?method=list&c_id=2&page=2
     *
     * topic分页接口
     * @param request
     * @param response
     */
    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int cId = Integer.parseInt(request.getParameter("c_id"));
        PageDTO<Topic> pageDTO;
        //默认第一页
        int page=1;

        String currentPage = request.getParameter("page");

        if(currentPage !=null && currentPage !=""){
            page = Integer.parseInt(currentPage);
        }

        if(cId==0){
             pageDTO =  topicService.listTopicPageAll(page,pageSize);
        }else{
             pageDTO =  topicService.listTopicPageByCid(cId,page,pageSize);
        }


        System.out.println(pageDTO.toString());
        List<Banner> banner=bannerService.findAllBanner();
        request.setAttribute("BannerList",banner);



        request.getSession().setAttribute("categoryList",categoryService.list());
        request.getSession().setAttribute("userList",userService.list());

        request.setAttribute("topicPage" ,pageDTO);

        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }


    /**

    /**
     * http://localhost:8080/topic?method=findDetailById&topic_id=1&page=1
     *
     * 查看主题的全部回复
     * @param request
     * @param response
     */
    public void  findDetailById(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        //获取topicid
        int topicId = Integer.parseInt(request.getParameter("topic_id"));

        //默认第一页
        int page=1;

        String currentPage = request.getParameter("page");

        if(currentPage !=null && currentPage !=""){
            page = Integer.parseInt(currentPage);
        }


        //处理浏览量，如果同个session内只算一次
        String sessionReadKey = "is_read_"+topicId;

        Boolean isRead = (Boolean) request.getSession().getAttribute(sessionReadKey);

        if(isRead == null){
            request.getSession().setAttribute(sessionReadKey,true);
            //新增一个pv
            topicService.addOnePV(topicId);

        }




        Topic topic = topicService.findById(topicId);
       List banner= bannerService.findAllBanner();

        PageDTO<Reply> pageDTO =  topicService.findReplyPageByTopicId(topicId,page,pageSize);
        request.getSession().setAttribute("categoryList",categoryService.list());


        System.out.println(pageDTO.toString());


        request.setAttribute("topic" ,topic);
        request.setAttribute("replyPage",pageDTO);
        request.setAttribute("BannerList",banner);
        request.getSession().setAttribute("userList",userService.list());
        System.out.println("Banner:"+banner);


        request.getRequestDispatcher("/topic_detail.jsp").forward(request,response);



    }


    /**
     * http://localhost:8080/topic?method=addTopic
     * 发布主题
     * @param request
     * @param response
     */
    public void addTopic(HttpServletRequest request,HttpServletResponse response) throws IOException {

        User loginUser = (User)request.getSession().getAttribute("loginUser");
        if(loginUser == null){
            request.setAttribute("msg","请登录");
            response.sendRedirect("/user/login.jsp");
            return;
            //页面跳转 TODO
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int cId = Integer.parseInt(request.getParameter("c_id"));

        topicService.addTopic(loginUser,title,content,cId);

        //发布主题成功
        response.sendRedirect("/fly_forum_master_war/topic?method=list&c_id="+cId);


    }


    /**
     * http://localhost:8080/topic?method=replyByTopicId&topic_id=9
     * 盖楼回复
     * @param request
     * @param response
     */
    public void replyByTopicId(HttpServletRequest request,HttpServletResponse response) throws IOException {

        User loginUser = (User)request.getSession().getAttribute("loginUser");
        if(loginUser == null){
            request.setAttribute("msg","请登录");
            response.sendRedirect("/user/login.jsp");
            return;

        }

        int topicId = Integer.parseInt(request.getParameter("topic_id"));

        String content = request.getParameter("content");


         topicService.replyByTopicId(loginUser,topicId,content);


        response.sendRedirect("/fly_forum_master_war/topic?method=findDetailById&topic_id="+topicId+"&page=1");

    }

//    SELECT * FROM topic where title LIKE "%vm%"

    public void searchTopic(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        int page=1;
        String title = request.getParameter("searchtitle");
        String keyword=title;
        title="%"+title+"%";

        PageDTO<Topic> pageDTO =topicService.listTopicByTitle(title,page,pageSize);

        request.setAttribute("search",pageDTO);
        request.setAttribute("key",keyword);

        request.getSession().setAttribute("userList",userService.list());
        System.out.println("search"+pageDTO);


        request.getRequestDispatcher("/search.jsp").forward(request,response);



    }






}
