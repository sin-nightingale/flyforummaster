package net.flyclass.forum.service;

import net.flyclass.forum.domain.Category;
import net.flyclass.forum.domain.Reply;
import net.flyclass.forum.domain.Topic;
import net.flyclass.forum.dto.PageDTO;

import java.util.List;

public interface ReplyService {

    List<Reply> list();

    int updateReply(Reply reply, int id);

    PageDTO<Reply> listReplyPageAll(int page, int pageSize);

    int deleteAll(String content);

    int findReplyCount( );

}
