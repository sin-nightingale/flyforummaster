package net.flyclass.forum.dao;

import net.flyclass.forum.domain.Topic;

import java.util.List;

public interface TopicDaoSerivce {
    public int countTotalTopicByCid(int cId);
    public List<Topic> findListByCid(int cId, int from, int pageSize);
    public int countTotalTopicAll();
    public List<Topic> findListAll( int from, int pageSize);
    public List<Topic> listTopicByTitle( String title,int from, int pageSize);
    public List<Topic> list();
    public  Topic findById(int topicId);
    public int save(Topic topic) throws Exception;
    public int findLatestFloorByTopicId(int topicId);
    public int updateTopic(Topic topic, int id) throws Exception;
    public int updatePV(int topicId, int newPV, int oldPV);
    public List<Topic> FindTopicId(int Id);
    public List<Topic> FindTopicByUserId(int Id);
    public  int findTopicCount();
    public int deleteAll(String condition);
}
