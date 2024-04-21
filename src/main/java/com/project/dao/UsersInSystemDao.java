/*package com.project.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.project.entity.Login;

@Component
public class UsersInSystemDao 
{
	@Autowired
	private SessionFactory sf;	//hibernate configuration in springMVC-servlet.xml file
	
	@Autowired
	LoginDao infoLog;
	
	//to manage transaction by itself
	@Transactional
	public List<Integer> getUsersInSystem()
	{
		try 
		{
			infoLog.logActivities("in UsersInSystemDao-getUsersInSystem");
							
			Session session= sf.getCurrentSession();
			
			StoredProcedureQuery procedure = session.createStoredProcedureQuery("users_in_system");
			procedure.registerStoredProcedureParameter("doctors", Integer.class, ParameterMode.OUT);
			procedure.registerStoredProcedureParameter("patients", Integer.class, ParameterMode.OUT);
			procedure.registerStoredProcedureParameter("employees", Integer.class, ParameterMode.OUT);
			procedure.registerStoredProcedureParameter("total_opd_income", Integer.class, ParameterMode.OUT);
			
			procedure.execute();
			Integer doctors = (Integer) procedure.getOutputParameterValue("doctors");
			Integer patients = (Integer) procedure.getOutputParameterValue("patients");  
			Integer employees = (Integer) procedure.getOutputParameterValue("employees");  
			Integer total_opd_income = (Integer) procedure.getOutputParameterValue("total_opd_income");
			
			List<Integer> users_count = new ArrayList<Integer>();
			users_count.add(doctors);
			users_count.add(patients);
			users_count.add(employees);
			users_count.add(total_opd_income);
			return users_count;
			
		}
		catch(Exception e)
		{
			infoLog.logActivities("in UsersInSystemDao-getUsersInSystem: "+e);
			return null;
		}
	}
	
	/*
	 * 
	 	CREATE PROCEDURE `users_in_system`(OUT doctors INT, OUT patients INT, OUT employees INT, OUT total_opd_income INT)
		BEGIN
		select count(*) into doctors from employee e where e.role = 'doctor' AND e.status = 1;
		select count(*) into patients from patient;
		select count(*) into employees from employee e where e.status = 1;
		select sum(fees) into total_opd_income from opddetails;
		END
	 * 
	 */
//}




package com.project.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.project.entity.Login;

@Component
public class UsersInSystemDao implements Cloneable
{
    @Autowired
    private SessionFactory sf;

    @Autowired
    LoginDao infoLog;

    @Transactional
    public List<Integer> getUsersInSystem()
    {
        try 
        {
            infoLog.logActivities("in UsersInSystemDao-getUsersInSystem");
                            
            Session session= sf.getCurrentSession();
            
            StoredProcedureQuery procedure = session.createStoredProcedureQuery("users_in_system");
            registerParameters(procedure, "doctors", "patients", "employees", "total_opd_income");
            
            procedure.execute();
            List<Integer> users_count = extractOutputParameters(procedure, "doctors", "patients", "employees", "total_opd_income");
            return users_count;
            
        }
        catch(Exception e)
        {
            infoLog.logActivities("in UsersInSystemDao-getUsersInSystem: "+e);
            return null;
        }
    }

    private void registerParameters(StoredProcedureQuery procedure, String... parameterNames) {
        for (String parameterName : parameterNames) {
            procedure.registerStoredProcedureParameter(parameterName, Integer.class, ParameterMode.OUT);
        }
    }

    private List<Integer> extractOutputParameters(StoredProcedureQuery procedure, String... parameterNames) {
        List<Integer> parameters = new ArrayList<>();
        for (String parameterName : parameterNames) {
            Integer parameterValue = (Integer) procedure.getOutputParameterValue(parameterName);
            parameters.add(parameterValue);
        }
        return parameters;
    }

    // Clone method to create a new instance
    @Override
    public UsersInSystemDao clone() {
        try {
            return (UsersInSystemDao) super.clone();
        } catch (CloneNotSupportedException e) {
            // Handle the exception appropriately
            return null;
        }
    }
}


