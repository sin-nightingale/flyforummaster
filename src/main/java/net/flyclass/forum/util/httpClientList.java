package net.flyclass.forum.util;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class httpClientList {
    public String getTitle(String url) {
        try {
            CloseableHttpClient httpclient = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            CloseableHttpResponse response = httpclient.execute(httpGet);
            if (response.getStatusLine().getStatusCode() == 200) {
                HttpEntity entity = response.getEntity();
                String body = EntityUtils.toString(entity, "utf-8");

                if (body != null) {
                    /*
                     * 替换掉换行符、制表符、回车符，去掉这些符号，正则表示写起来更简单一些
                     * 只有空格符号和其他正常字体
                     */
                    Pattern p = Pattern.compile("\t|\r|\n");
                    Matcher m = p.matcher(body);
                    body = m.replaceAll("");
                    String sql_title="";
                    String sql_body="";



                    /*
                     * 提取列表页的正则表达式
                     * 去除换行符之后的 li
                     * <div class="post>                                    <h4>                                        <a href="https://voice.hupu.com/nba/2485167.html"  target="_blank">与球迷亲切互动！凯尔特人官方晒球队开放训练日照片</a>                                    </h4>                                </div>
                     */
                    Pattern title = Pattern
                            .compile("<div class=\"post\"> \\s*(.*?)\\s*<span>(.*?)\\s*</span>\\s*(.*?)</div>");


                    Matcher matcher_title=title.matcher(body);




                    while (matcher_title.find()) {

                        sql_title= matcher_title.group(2);
                    }
                    System.out.println("title:"+sql_title);


                    return sql_title;

                } else {
                    System.out.println("处理失败！！！获取正文内容为空");
                }
            } else {
                System.out.println("处理失败！！！返回状态码：" + response.getStatusLine().getStatusCode());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        return url;
    }

    public String getBody(String url) {
        try {
            CloseableHttpClient httpclient = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            CloseableHttpResponse response = httpclient.execute(httpGet);
            if (response.getStatusLine().getStatusCode() == 200) {
                HttpEntity entity = response.getEntity();
                String body = EntityUtils.toString(entity, "utf-8");

                if (body != null) {
                    /*
                     * 替换掉换行符、制表符、回车符，去掉这些符号，正则表示写起来更简单一些
                     * 只有空格符号和其他正常字体
                     */
                    Pattern p = Pattern.compile("\t|\r|\n");
                    Matcher m = p.matcher(body);
                    body = m.replaceAll("");
                    String sql_title="";
                    String sql_body="";



                    /*
                     * 提取列表页的正则表达式
                     * 去除换行符之后的 li
                     * <div class="list-hd">                                    <h4>                                        <a href="https://voice.hupu.com/nba/2485167.html"  target="_blank">与球迷亲切互动！凯尔特人官方晒球队开放训练日照片</a>                                    </h4>                                </div>
                     */
                             Pattern Title_body = Pattern
                            .compile("<div class=\"postBody\">\\s*(.*?)</div>");


                    Matcher matcher_body = Title_body.matcher(body);


                    // 匹配出所有符合正则表达式的数据
                    while (matcher_body.find()) {

                        sql_body= matcher_body.group(1);
                    }


                    System.out.println("body:"+sql_body);

                    return sql_body;

                } else {
                    System.out.println("处理失败！！！获取正文内容为空");
                }
            } else {
                System.out.println("处理失败！！！返回状态码：" + response.getStatusLine().getStatusCode());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        return url;
    }

//    public static void main(String[] args) {
//
//    }

}
