package net.flyclass.forum.service;


import net.flyclass.forum.domain.Reply;
import net.flyclass.forum.domain.Topic;
import net.flyclass.forum.domain.User;
import net.flyclass.forum.dto.PageDTO;

import java.util.List;

public interface TopicService  {


    int deleteAll(String content);


    PageDTO<Topic> listTopicPageByCid(int cId, int page, int pageSize);
    PageDTO<Topic> listTopicPageAll(int page, int pageSize);
    PageDTO<Topic> listTopicByTitle(String title,int page, int pageSize);

    Topic findById(int topicId);

    List<Topic> list();

    PageDTO<Reply> findReplyPageByTopicId(int topicId, int page, int pageSize);

    PageDTO<User> findeUserPage(int userId,int page,int pageSize);

    int findUserCount();
    int findTopicCount();

    List<Topic> findTopicById(int id);

    int addTopic(User loginUser, String title, String content, int cId);

    int replyByTopicId(User loginUser, int topicId, String content);

    void addOnePV(int topicId);


    int updateTopic(Topic topic,int id);
}
