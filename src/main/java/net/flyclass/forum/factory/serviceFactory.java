package net.flyclass.forum.factory;

import net.flyclass.forum.service.*;
import net.flyclass.forum.service.impl.*;

public class serviceFactory {
    private static BannerService getBannerServiceInstance()
    {
        return new BannerServiceImpl();
    }
    public static CategoryService getCategoryServiceInstance(){return  new CategoryServiceImpl(); }
    public static ReplyService getReplyServiceInstance(){return  new ReplyServiceImpl(); }
    public static TopicService getTopicServiceInstance(){return  new TopicServiceImpl(); }
    public static UserService getUserServiceInstance(){return  new UserServiceImpl(); }
}
