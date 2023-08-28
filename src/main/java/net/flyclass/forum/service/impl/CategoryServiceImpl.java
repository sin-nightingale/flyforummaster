package net.flyclass.forum.service.impl;

import net.flyclass.forum.dao.impl.CategoryDao;
import net.flyclass.forum.domain.Category;
import net.flyclass.forum.dto.PageDTO;
import net.flyclass.forum.service.CategoryService;

import java.util.Date;
import java.util.List;

public class CategoryServiceImpl implements CategoryService {


    private CategoryDao categoryDao = new CategoryDao();


    @Override
    public int deleteAll(String content) {
        return categoryDao.deleteAll(content);
    }

    @Override
    public Category findById(int categoryId) {
        return categoryDao.findById(categoryId);
    }

    @Override
    public int findCategoryCount() {
        return categoryDao.findCategoryCount();
    }

    @Override
    public List<Category> list() {
        return categoryDao.list();
    }

    @Override
    public PageDTO<Category> listCategoryPageAll(int page, int pageSize) {
        //查询总记录数
        int totalRecordNum = categoryDao.countTotalCategoryAll();

        int from = (page-1) * pageSize;

        //分页查询
        List<Category> categoryList =  categoryDao.findListAll(from,pageSize);

        PageDTO<Category> pageDTO = new PageDTO<>(page,pageSize,totalRecordNum);

        pageDTO.setList(categoryList);

        return pageDTO;
    }

    @Override
    public int updateCategory(Category category, int id) {
        category.setName(category.getName());
        category.setWeight(category.getWeight());
        try {
            return categoryDao.updateCategory(category,id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int addcatory(Category category) {

        category.setCreateTime(new Date());
        try {
            return categoryDao.save(category);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}
