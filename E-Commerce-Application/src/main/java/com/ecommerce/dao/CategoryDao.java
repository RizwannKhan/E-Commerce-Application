package com.ecommerce.dao;

import com.ecommerce.entities.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * @author Rijwank
 */
public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    //save category to database...
    public int saveCategory(Category cat) {
        Session s = this.factory.openSession();
        Transaction tx = s.beginTransaction();
        int catId = (int) s.save(cat);
        tx.commit();
        s.close();
        return catId;
    }

    public List<Category> getCategories() {
        Session s = this.factory.openSession();
        Query q = s.createQuery("from Category");
        List<Category> list = q.list();
        return list;
    }

    public Category getCategoryById(int catId) {
        Category cat = null;

        Session s = this.factory.openSession();
        cat = s.get(Category.class, catId);
        s.close();

        return cat;
    }

}
