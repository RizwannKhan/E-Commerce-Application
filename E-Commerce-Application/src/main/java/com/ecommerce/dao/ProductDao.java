package com.ecommerce.dao;

import com.ecommerce.entities.Product;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * @author Rijwank
 */
public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    //save product to database....
    public int saveProduct(Product product) {
        int pId = 0;

        Session s = this.factory.openSession();
        Transaction tx = s.beginTransaction();
        pId = (int) s.save(product);
        tx.commit();
        s.close();
        return pId;
    }

    //fetch products from db...
    public List<Product> getAllProducts() {
        Session s = this.factory.openSession();
        Transaction tx = s.beginTransaction();

        Query query = s.createQuery("from Product");
        List<Product> list = query.list();

        return list;
    }

    //fetch products by category id from db...
    public List<Product> getAllProductsByCatId(int cid) {
        Session s = this.factory.openSession();
        Transaction tx = s.beginTransaction();

        Query query = s.createQuery("from Product as p where p.category.cId =: cid");
        query.setParameter("cid", cid);
        List<Product> list = query.list();

        return list;
    }

}
