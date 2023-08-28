package net.flyclass.forum.service.impl;

import net.flyclass.forum.dao.impl.ReplyDao;
import net.flyclass.forum.domain.Reply;
import net.flyclass.forum.dto.PageDTO;
import net.flyclass.forum.service.ReplyService;

import java.util.List;

public class ReplyServiceImpl implements ReplyService {
    private ReplyDao replyDao=new ReplyDao();
    @Override
    public List<Reply> list() {
        return replyDao.list();
    }


    @Override
    public int updateReply(Reply reply, int id) {
        reply.setTopicId(reply.getTopicId());
        reply.setFloor(reply.getFloor());
        reply.setContent(reply.getContent());
        reply.setUserId(reply.getUserId());
        try {
            return replyDao.updateReply(reply,id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public PageDTO<Reply> listReplyPageAll(int page, int pageSize) {
        //查询总记录数
        int totalRecordNum = replyDao.countTotalUserAll();

        int from = (page-1) * pageSize;

        //分页查询
        List<Reply> replyList =  replyDao.findListAll(from,pageSize);

        PageDTO<Reply> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(replyList);

        return pageDTO;
    }

    @Override
    public int deleteAll(String content) {
        return replyDao.deleteAll(content);
    }

    @Override
    public int findReplyCount( )   {
        return replyDao.findReplyCount();
    }
}
