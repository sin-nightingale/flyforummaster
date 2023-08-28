package net.flyclass.forum.service.impl;

import net.flyclass.forum.dao.impl.CategoryDao;
import net.flyclass.forum.dao.impl.ReplyDao;
import net.flyclass.forum.dao.impl.TopicDao;
import net.flyclass.forum.dao.impl.UserDao;
import net.flyclass.forum.domain.Category;
import net.flyclass.forum.domain.Reply;
import net.flyclass.forum.domain.Topic;
import net.flyclass.forum.domain.User;
import net.flyclass.forum.dto.PageDTO;
import net.flyclass.forum.service.TopicService;

import java.util.Date;
import java.util.List;

public class TopicServiceImpl implements TopicService {


    private TopicDao topicDao = new TopicDao();

    private ReplyDao replyDao = new ReplyDao();

    private CategoryDao categoryDao = new CategoryDao();

    private UserDao userDao=new UserDao();

    @Override
    public int deleteAll(String content) {
        return topicDao.deleteAll(content);
    }

    @Override
    public PageDTO<Topic> listTopicPageByCid(int cId, int page, int pageSize) {

        //查询总记录数
        int totalRecordNum = topicDao.countTotalTopicByCid(cId);

        int from = (page-1) * pageSize;

        //分页查询
        List<Topic> topicList =  topicDao.findListByCid(cId,from,pageSize);

        PageDTO<Topic> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(topicList);

        return pageDTO;
    }

    @Override
    public PageDTO<Topic> listTopicPageAll(int page, int pageSize) {
        //查询总记录数
        int totalRecordNum = topicDao.countTotalTopicAll();

        int from = (page-1) * pageSize;

        //分页查询
        List<Topic> topicList =  topicDao.findListAll(from,pageSize);

        PageDTO<Topic> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(topicList);

        return pageDTO;
    }

    @Override
    public PageDTO<Topic> listTopicByTitle(String title, int page, int pageSize) {

        int totalRecordNum = topicDao.countTotalTopicAll();
        int from = (page-1) * pageSize;

        List<Topic> topicList =  topicDao.listTopicByTitle(title,from,pageSize);

        PageDTO<Topic> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(topicList);

        return pageDTO;
    }

    @Override
    public Topic findById(int topicId) {
        return topicDao.findById(topicId);
    }


    @Override

    public List<Topic> list() {
        return topicDao.list();
    }


    /**
     * user 分页内容
     * @return
     */




    @Override
    public PageDTO<User> findeUserPage(int userId, int page, int pageSize) {
        //查询总记录数
        int totalRecordNum = userDao.findUserCount();

        int from = (page-1) * pageSize;

        //分页查询
        List<User> userList =  userDao.findUserPage();

        PageDTO<User> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(userList);

        return pageDTO;
    }

    @Override
    public int findUserCount() {
        return userDao.findUserCount();
    }

    @Override
    public int findTopicCount() {
        return topicDao.findTopicCount();
    }

    @Override
    public List<Topic> findTopicById(int id) {
        return topicDao.FindTopicByUserId(id);
    }


    @Override
    public PageDTO<Reply> findReplyPageByTopicId(int topicId, int page, int pageSize) {

        //查询总的回复
        int totalRecordNum = replyDao.countTotalReplyByCid(topicId);

        int from = (page-1) * pageSize;

        //分页查询
        List<Reply> replyList =  replyDao.findListByTopicId(topicId,from,pageSize);

        PageDTO<Reply> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(replyList);

        return pageDTO;

    }




    @Override
    public int addTopic(User loginUser, String title, String content, int cId) {

        Category category = categoryDao.findById(cId);
        if(category == null){ return 0;}

        Topic topic = new Topic();
        topic.setTitle(title);
        topic.setContent(content);
        topic.setCreateTime(new Date());
        topic.setUpdateTime(new Date());
        topic.setPv(1);
        topic.setDelete(0);
        topic.setUserId(loginUser.getId());
        topic.setcId(cId);
        topic.setHot(0);

        int rows = 0;
        try {
            rows = topicDao.save(topic);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows;
    }



    @Override
    public int replyByTopicId(User loginUser, int topicId, String content) {

        int floor = topicDao.findLatestFloorByTopicId(topicId);

        Reply reply = new Reply();
        reply.setContent(content);
        reply.setCreateTime(new Date());
        reply.setUpdateTime(new Date());
        reply.setFloor(floor+1);
        reply.setTopicId(topicId);
        reply.setUserId(loginUser.getId());
        reply.setDelete(0);

        int rows = replyDao.save(reply);

        return rows;
    }

    @Override
    public void addOnePV(int topicId) {

        Topic topic = topicDao.findById(topicId);

        int newPV = topic.getPv()+1;

        topicDao.updatePV(topicId,newPV,topic.getPv());

    }

    @Override
    public int updateTopic(Topic topic, int id) {
        topic.setcId(topic.getcId());
        topic.setTitle(topic.getTitle());
        topic.setPv(topic.getPv());
        topic.setUserId(topic.getUserId());
        topic.setHot(topic.getHot());


        try {
            return topicDao.updateTopic(topic,id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}
