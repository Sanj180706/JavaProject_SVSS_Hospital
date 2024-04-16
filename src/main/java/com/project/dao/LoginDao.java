package com.project.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.project.entity.Login;

@Component
public class LoginDao {
    @Autowired
    private SessionFactory sf;

    @Transactional
    public String validate(Login l) {
        try {
            // Logging activities
            logActivities("in logindao-validate: got= " + l);

            // Obtaining current session
            Session session = sf.getCurrentSession();

            // Creating and executing HQL query
            Query q1 = session.createQuery("from Login where role= :r AND username= :u");
            q1.setParameter("r", l.getRole());
            q1.setParameter("u", l.getUsername());

            // Retrieving login info from query result
            Login temp = (Login) q1.uniqueResult();

            // Validating entered password with the hashed password from the database
            boolean validUser = BCrypt.checkpw(l.getPassword(), temp.getPassword());
            logActivities("in logindao-validate: found= " + "i/p= " + l.getPassword() + ", db= " + temp.getPassword()
                    + ", match= " + validUser);

            // If password matches, return user ID
            if (!validUser) {
                throw new Exception("Password didn't match");
            }
            return temp.getId();
        } catch (Exception e) {
            // Logging exception
            logActivities("in logindao-validate: " + e);
            return null;
        }
    }

    public void logActivities(String s) {
        // Log activities
    }
}
