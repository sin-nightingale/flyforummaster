package net.flyclass.forum.service.impl;

import net.flyclass.forum.dao.impl.BannerDao;
import net.flyclass.forum.domain.Banner;
import net.flyclass.forum.dto.PageDTO;
import net.flyclass.forum.service.BannerService;

import java.util.List;

public class BannerServiceImpl implements BannerService {

    private BannerDao bannerDao=new BannerDao();
    @Override
    public PageDTO<Banner> listBannerPageAll(int page, int pageSize) {
        //查询总记录数
        int totalRecordNum = bannerDao.countTotalBannerAll();

        int from = (page-1) * pageSize;

        //分页查询
        List<Banner> bannerList =  bannerDao.findListAll(from,pageSize);

        PageDTO<Banner> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(bannerList);

        return pageDTO;
    }

    @Override
    public List<Banner> findAllBanner() {
        return bannerDao.FindAllBanner();
    }

    @Override
    public int addbanner(String title,String bannerImg,String goHref,int isShow) throws Exception {
        return bannerDao.save(title, bannerImg, goHref, isShow);
    }

    @Override
    public Banner findById(int bannerId) {
        return bannerDao.findById(bannerId);
    }

    @Override
    public int updateBanner(Banner banner, int id) throws Exception {
        return bannerDao.updateBanner(banner,id);
    }


}
