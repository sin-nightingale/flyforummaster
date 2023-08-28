package net.flyclass.forum.domain;

public class Banner {
    private int id;
    private String title;
    private String bannerImg;
    private String goHref;
    private int isShow;

    @Override
    public String toString() {
        return "Banner{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", bannerImg='" + bannerImg + '\'' +
                ", goHref='" + goHref + '\'' +
                ", isShow=" + isShow +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBannerImg() {
        return bannerImg;
    }

    public void setBannerImg(String bannerImg) {
        this.bannerImg = bannerImg;
    }

    public String getGoHref() {
        return goHref;
    }

    public void setGoHref(String goHref) {
        this.goHref = goHref;
    }

    public int getIsShow() {
        return isShow;
    }

    public void setIsShow(int isShow) {
        this.isShow = isShow;
    }
}
