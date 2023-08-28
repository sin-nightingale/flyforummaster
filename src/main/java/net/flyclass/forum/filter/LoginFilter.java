package net.flyclass.forum.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebFilter(filterName = "LoginFilter",urlPatterns = {"/publish.jsp","/topic_detail.jsp","/reply.jsp","/admin/index.jsp","/userhome.jsp","/user/home.jsp"})
public class     LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest=( HttpServletRequest)servletRequest;
        HttpServletResponse httpServletResponse=(HttpServletResponse)servletResponse;
        if(httpServletRequest.getSession().getAttribute("loginUser")!=null){
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
            httpServletRequest.setAttribute("msg","非法访问，请登录");
            servletRequest.getRequestDispatcher("/user/login.jsp").forward(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
