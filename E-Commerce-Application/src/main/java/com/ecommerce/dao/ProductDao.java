package com.ecommerce.dao;

import com.ecommerce.entities.Product;
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

}
