package net.flyclass.forum.service;

import net.flyclass.forum.domain.Banner;
import net.flyclass.forum.dto.PageDTO;

import java.util.List;

public interface BannerService {
    PageDTO<Banner> listBannerPageAll(int page, int pageSize);
    List<Banner> findAllBanner();
    int addbanner(String title,String bannerImg,String goHref,int isShow) throws Exception;
    Banner findById(int bannerId);
    int updateBanner(Banner banner, int id) throws Exception;
}
