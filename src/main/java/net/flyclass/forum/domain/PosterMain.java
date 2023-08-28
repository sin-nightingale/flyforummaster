package net.flyclass.forum.domain;


import java.awt.Font;

import net.flyclass.forum.util.PosterUtil;

public class PosterMain {
    public static void main(String[] args) throws Exception {
        String qrCodeUrl = "http://yun.flyskill.cn/view.php/9781bafb01248ffd8ee3a8c1e917f21e.jpg"; //二维码
        String goodsUrl = "http://yun.flyskill.cn/view.php/bbce54ad3378e7e1c6ab4fd899830196.png"; //顶部图片
        String avatarUrl = "http://yun.flyskill.cn/view.php/43cbcb8da742e1cfe5b0049fc12e3385.jpg"; //头像


        String title = "";
        String desc = "";


        Poster poster_ = new Poster();
        poster_.setWidth(375);
        poster_.setHeight(670);
        poster_.setQrCodeUrl(qrCodeUrl); //二维码
        poster_.setGoodsUrl(goodsUrl); //顶部banner
        poster_.setDesc(desc); //测评结果说明
        poster_.setPrice(title); //测评结果标题


        Poster poster = (Poster) PosterUtil.initPoster(poster_);
        PosterUtil.drawPoster(poster);


    }




}