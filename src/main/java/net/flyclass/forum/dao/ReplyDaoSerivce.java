package net.flyclass.forum.dao;

import net.flyclass.forum.domain.Reply;

import java.util.List;

public interface ReplyDaoSerivce {
    public int countTotalReplyByCid(int topicId);
    public List<Reply> findListByTopicId(int topicId, int from, int pageSize);
    public int save(Reply reply);
    public int findReplyCount( );
    public int updateReply(Reply reply, int id) throws Exception;
    public List<Reply> list();
    public int countTotalUserAll();
    public List<Reply> findListAll( int from, int pageSize);
    public List<Reply> FindReplyId(int Id);
    public int deleteAll(String content);

}
