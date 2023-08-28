package net.flyclass.forum.dao;

import net.flyclass.forum.domain.Category;

import java.util.List;

public interface CategoryDaoSerivce {
    public Category findById(int id);
    public List<Category> list();
    public int save(Category category)throws Exception;
    public int findCategoryCount();
    public int deleteAll(String condition);
    public int updateCategory(Category category, int id) throws Exception;
    public int countTotalCategoryAll();
    public List<Category> findListAll( int from, int pageSize);
    public List<Category> FindCategoryId(int Id);

}
