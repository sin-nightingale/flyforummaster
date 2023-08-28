package net.flyclass.forum.dao;

import net.flyclass.forum.domain.Banner;
import net.flyclass.forum.dto.PageDTO;

import java.util.List;

public interface BannerDaoSerivce {
    public PageDTO<Banner> listBannerPageAll(int page, int pageSize);
    public int countTotalBannerAll();
    public List<Banner> findListAll(int from, int pageSize);
    public List<Banner> FindAllBanner();
    public int save(String title,String bannerImg,String goHref,int isShow) throws Exception;
    public  Banner findById(int bannerId);
    public int updateBanner(Banner banner, int id) throws Exception;


}
