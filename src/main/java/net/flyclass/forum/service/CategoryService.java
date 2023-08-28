package net.flyclass.forum.service;

import net.flyclass.forum.domain.Category;
import net.flyclass.forum.domain.Reply;
import net.flyclass.forum.dto.PageDTO;

import java.util.List;

public interface CategoryService {

    /**
     * 全部分类
     * @return
     */

    int deleteAll(String content);

    Category findById(int categoryId);

    int findCategoryCount();


    List<Category> list();

    PageDTO<Category> listCategoryPageAll(int page, int pageSize);

    int addcatory(Category category);

    int updateCategory(Category category, int id);
}
