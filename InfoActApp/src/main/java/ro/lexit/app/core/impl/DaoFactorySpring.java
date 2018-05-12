package ro.lexit.app.core.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import ro.lexit.app.core.intf.IDaoFactory;
import ro.lexit.app.core.intf.IDaoID;

@Service
public class DaoFactorySpring implements IDaoFactory, ApplicationContextAware {
	
	private ApplicationContext applicationContext;
	
	public IDaoID getInstance(String entityCode) {
		String beanName = "dao" + StringUtils.capitalize(entityCode);
		IDaoID dao = (IDaoID) applicationContext.getBean(beanName);
		return dao;
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}

	public ApplicationContext getApplicationContext() {
		return applicationContext;
	}	
}