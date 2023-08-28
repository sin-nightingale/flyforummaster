package net.flyclass.forum.controller;

import net.flyclass.forum.service.CategoryService;
import net.flyclass.forum.service.impl.CategoryServiceImpl;
import net.flyclass.forum.domain.Category;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet(name = "categoryServlet",urlPatterns = {"/category"})
public class CategoryServlet extends BaseServlet {


    private CategoryService categoryService = new CategoryServiceImpl();


    /**
     * 返回全部分类
     * http://localhost:8080/category?method=list
     */
    public void list(HttpServletRequest request, HttpServletResponse response){

        List<Category> list =  categoryService.list();

        System.out.println(list.toString());

        request.setAttribute("caregoryList",list);


    }



}
