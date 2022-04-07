package com.ecommerce.dao;

import com.ecommerce.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 * @author Rijwank
 */
public class UserDao {

    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    //get user by email and password...
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
            String q = "from User where userEmail=:e and userPassword=:p";
            Session session = this.factory.openSession();
            Query query = session.createQuery(q);
            query.setParameter("e", email);
            query.setParameter("p", password);

            user = (User)query.uniqueResult();
            
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
